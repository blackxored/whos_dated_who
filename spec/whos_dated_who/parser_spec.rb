require 'spec_helper'

module WhosDatedWho
  describe Parser do
    let(:parser) { Parser.new }

    before do
      parser.parse(fixture_response(:scarlett_johansson))
      @result = parser.result.biography
    end

    context 'biography' do
      it 'parses the HTML and returns a result hash' do
        expect(@result.first_name).to eq('Scarlett')
        expect(@result.last_name).to eq('Johansson')
      end

      it 'translates keys' do
        expect(@result.born_at).to be_truthy
        expect(@result.born_on).to be_truthy
      end

      it 'coerces result values' do
        expect(@result.age).to eq(30)
        expect(@result.born_on).to be_kind_of(Date)
      end

      it 'ignores irrelevant keys' do
        expect(@result).to_not have_key('snapshot')
      end

      it 'parses height' do
        expect(@result.height).to eq(1.60)
      end

      it 'parses weight' do
        expect(@result.weight).to eq(56.7)
      end

      it 'populates arrays' do
        [
          :other_names, :brand_endorsements, :websites, :brothers, :sisters,
          :friends, :pets, :favorite_movies, :favorite_places, :favorite_foods,
          :favorite_colors, :favorite_accessories, :distinctive_features
        ].each do |key|
          expect(@result[key]).to be_kind_of(Array)
        end

        expect(@result.brand_endorsements).to include(/Gap/)
        expect(@result.brand_endorsements).to include(/L'Oreal/)
        expect(@result.websites).to include(/scarlett-fan\.com/)
        expect(@result.brothers).to include(/Hunter Johansson/)
        expect(@result.sisters.size).to eq(2)
        expect(@result.friends.size).to eq(5)
        expect(@result.pets.size).to eq(2)
        expect(@result.favorite_movies).to include(/Heat/)
        expect(@result.favorite_places).to include('London')
        expect(@result.distinctive_features).to include(/Lips/)
        expect(@result.distinctive_features).to include(/Husky Voice/)
      end

      it 'gets a description' do
        expect(@result.description).to match(
          /American actress, model, and singer/
        )
      end

      it 'parses relationship statuses' do
        statuses = {
          'is currently single.'                => :single,
          'is married to'                       => :married,
          'is engaged to'                       => :engaged,
          'is currently dating'                 => :dating,
          'is in a long-term relationship with' => :dating,
          'i dunno what this about'             => :unknown
        }

        statuses.each do |human, status|
          expect(
            parser.send(:parse_relationship_status, human: human)
          ).to eq(status)
        end
      end
    end
  end
end
