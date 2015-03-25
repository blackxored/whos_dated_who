module WhosDatedWho
  class Client
    def fetch(name)
      bing_results = BingClient.new.search("#{name} site:dating.famousfix.com")
      url = bing_results.first[:Web].first[:Url]
      resp = Faraday.get(url)
      if resp.success?
        Parser.new.parse(resp.body)
      end
    end
  end
end
