module WhosDatedWho
  class Client
    def fetch(name)
      search = "#{name} dating site:whosdatedwho.com"
      bing_results = BingClient.new.search(search)
      url = bing_results.first[:Web].first[:Url]

      resp = Faraday.get(url)

      if resp.success?
        Parser.new.parse(resp.body)
      end
    end
  end
end
