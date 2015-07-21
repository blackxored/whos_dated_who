require 'yaml'
module WhosDatedWho
  class BingClient
    def initialize(type = 'Web', num_results = 10, api_key = nil)
      @api_key = api_key || ENV['BING_API_KEY'] || config[:bing_api_key]
      @client = Bing.new(@api_key, num_results, type)
    end

    def search(query)
      @client.search(query)
    end

    private

    def config
      @config ||= YAML.load_file(File.expand_path('~/.whos_dated_who.yml'))
    end
  end
end
