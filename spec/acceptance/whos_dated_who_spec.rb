require 'spec_helper'

describe WhosDatedWho do
  let(:client) { WhosDatedWho::Client.new }

  context "smoke test" do
    it "fetches and parses the correct results" do
      result = client.fetch('Candice Swanepoel')
      expect(result.status).to eq(:dating)
      expect(result.biography.first_name).to eq('Candice')
      expect(result.biography.last_name).to eq('Swanepoel')
      expect(result.biography.age).to eq(26)

      result = client.fetch('Katheryn Winnick')
      expect(result.status).to eq(:unknown)
      expect(result.biography.first_name).to eq('Katheryn')
      expect(result.biography.last_name).to eq('Winnick')
      expect(result.biography.age).to eq(37)
    end
  end
end
