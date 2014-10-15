require 'yaml'
module WhosDatedWho
  class BingClient
    API_KEY = ENV['BING_API_KEY'] ||
      YAML.load_file( File.expand_path('~/.whos_dated_who.yml'))[:bing_api_key]

    def initialize(api_key=API_KEY, num_results=10, type='Web')
      @api_key = api_key
      @client = Bing.new(@api_key, num_results, type)
    end

    def search(query)
      @client.search(query)
    end
  end
end
