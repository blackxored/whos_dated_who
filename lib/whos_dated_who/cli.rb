require 'thor'
require 'whos_dated_who'

module WhosDatedWho
  class CLI < Thor
    desc 'version', 'Return the version of WhosDatedWho'
    def version
      puts WhosDatedWho::VERSION
    end

    desc 'query', 'Return the relationship status of a celebrity'
    def query(name)
      result = Client.new.fetch(name)
      status = [
        result[:relationship_status], result[:current_relationship][:human]
      ].join(': ')

      puts status
      puts result[:current_relationship][:dates].join(', ')
    end

    desc 'explore', 'Return the relationship status of everyone in celebs.yml'
    def explore
      my_celebs.map do |celeb|
        puts "Processing #{celeb}..."
        begin
          Client.new.fetch(celeb)
        rescue
          puts "Error processing #{celeb}"
        end
      end.compact
    end

    desc 'import_mine', 'Import my favorites into RethinkDB'
    def import_mine
      Importer.new('celebs', 'mine').fetch_and_import(my_celebs)
    end

    desc 'import_maxim', 'Import maxim hot 100'
    def import_maxim
      # TODO
      # resp = Faraday.get('http://www.maxim.com/hot100/2014')
    end

    private

    def my_celebs
      YAML.load_file(File.expand_path('../../../celebs.yml', __FILE__))
    end
  end
end
