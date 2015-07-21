module WhosDatedWho
  class Importer
    include RethinkDB::Shortcuts
    attr_reader :conn, :logger, :table_name

    def initialize(db, table_name)
      @conn       = r.connect(host: 'localhost', db: db || 'celebs')
      @logger     = Logger.new(STDOUT)
      @table_name = table_name
    end

    def fetch_and_import(celebs)
      celebs.each do |celeb|
        logger.info "Fetching #{celeb}"
        import_celeb(celeb)
      end
    end

    private

    def import_celeb(celeb)
      result = Client.new.fetch(celeb)
      logger.info "Importing #{celeb} to #{table_name}"
      create(result)
    rescue
      logger.error("Error importing #{celeb}, added to missing")
      add_to_missing_celebs(celeb)
    end

    def create(results)
      r.table(table_name).insert(JSON.parse(results.to_json)).run(conn)
    end

    def add_to_missing_celebs(celeb)
      first_name, last_name = celeb.split
      r.table("missing_#{table_name}").insert(
        first_name: first_name, last_name: last_name
      ).run(conn)
    end
  end
end
