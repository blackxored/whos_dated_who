require 'spec_helper'

describe WhosDatedWho do
  let(:client) { WhosDatedWho::Client.new }

  context 'smoke test' do
    it 'fetches and parses the correct results' do
      result = client.fetch('Candice Swanepoel')
      expect(result.status).to eq(:engaged)
      expect(result.biography.first_name).to eq('Candice')
      expect(result.biography.last_name).to eq('Swanepoel')
      expect(result.biography.age).to eq(27)

      result = client.fetch('Jennifer Lawrence')
      expect(result.status).to eq(:dating)
      expect(result.biography.first_name).to eq('Jennifer')
      expect(result.biography.last_name).to eq('Lawrence')
      expect(result.biography.age).to eq(25)
    end
  end
end
