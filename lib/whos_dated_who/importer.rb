module WhosDatedWho
  class Importer
    include RethinkDB::Shortcuts
    attr_reader :conn, :logger, :table_name

    def initialize(db, table_name)
      @conn = r.connect(host: 'localhost', db: db || 'celebs')
      @logger = Logger.new(STDOUT)
      @table_name = table_name
    end

    def fetch_and_import(celebs)
      celebs.each do |celeb|
        begin
          logger.info "Fetching #{celeb}"
          result = Client.new.fetch(celeb)
          logger.info "Importing #{celeb} to #{table_name}"
          import(result)
        rescue
          first_name, last_name = celeb.split
          r.table("missing_#{table_name}").insert(first_name: first_name, last_name: last_name).run(conn)
          logger.error("Error importing #{celeb}, added to missing")
        end
      end
    end

    def import(results)
      r.table(table_name).insert(JSON.parse(results.to_json)).run(conn)
    end
  end
end
