require 'spec_helper'

module WhosDatedWho
  describe Parser do
    let(:parser) { Parser.new }
    before do
      body = File.read(File.expand_path('../../fixtures/scarlett-johansson.resp', __FILE__))
      parser.parse(body)
      @result = parser.result.biography
    end

    context "biography" do
      it "parses the HTML and returns a result hash" do
        expect(@result.first_name).to eq("Scarlett")
        expect(@result.last_name).to eq("Johansson")
      end

      it "translates keys" do
        expect(@result.born_at).to be_truthy
        expect(@result.born_on).to be_truthy
      end

      it "coerces result values" do
        expect(@result.age).to eq(29)
        expect(@result.born_on).to be_kind_of(Date)
      end

      it "ignores irrelevant keys" do
        expect(@result).to_not have_key("snapshot")
      end

      it "populates arrays" do
        [
          :other_names, :brand_endorsements, :websites, :brothers, :sisters,
          :friends, :pets, :favorite_movies, :favorite_places, :favorite_foods,
          :favorite_colors, :favorite_accessories
        ].each do |key|
          expect(@result[key]).to be_kind_of(Array)
        end

        expect(@result.brand_endorsements).to include(/Gap/)
        expect(@result.brand_endorsements).to include(/L'Oreal/)
        expect(@result.websites).to include(/scarlett-fan\.com/)
        expect(@result.brothers).to include(/Hunter Johansson/)
        expect(@result.sisters.size).to eq(2)
        expect(@result.friends.size).to eq(4)
        expect(@result.pets.size).to eq(2)
        expect(@result.favorite_movies).to include(/Heat/)
        expect(@result.favorite_places).to include('London')
      end
    end
  end
end
