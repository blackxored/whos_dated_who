require 'yaml'
module WhosDatedWho
  class BingClient
    API_KEY = ENV['BING_API_KEY'] ||
      YAML.load_file( File.expand_path('~/.whos_dated_who.yml'))[:bing_api_key]

    def initialize(api_key=API_KEY)
      @api_key = api_key
      @client = Bing.new(@api_key, 10, 'Web')
    end

    def search(query)
      @client.search(query)
    end
  end
end
