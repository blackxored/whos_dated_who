require 'thor'
require 'whos_dated_who'

module WhosDatedWho
  class CLI < Thor
    desc "version", "Return the version of WhosDatedWho"
    def version
      puts WhosDatedWho::VERSION
    end

    desc "query", "Return the relationship status of a celebrity"
    def query(name)
      result = Client.new.fetch(name)
      puts "#{result[:status]}: #{result[:current_relationship][:human]}"
      puts result[:current_relationship][:dates].join(", ")
    end
  end
end
