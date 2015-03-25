module WhosDatedWho
  class Parser
    attr_reader :doc

    def parse(body)
      @doc = Nokogiri::HTML(body)
      extract_bio
      extract_current_relationship
      extract_past_relationships
      @result
    end

    def result
      @result ||= Hashie::Mash.new(biography: @biography, status: :unknown)
    end

    private

    def extract_bio
      result = {}
      result[:description] = @doc.css('#wikitext').text

      bio = @doc.css('#rcol .cbox-nopad:nth-child(3)')
      bio.css('.posl, .posr').each do |el|
        if el.matches?('.posl')
          @key = el.content
        else
          key = normalize_bio_key(@key)
          if el.css('div').size > 0
            result[key] = [] unless result[key]
            result[key] = el.children.map(&:content).reject do |c|
              c.empty? || c =~ /^\s\(/
            end
          else
            value = el.content.rstrip
            if respond_to?("parse_#{key}".to_sym, true)
              result[key] = send("parse_#{key}", value)
            else
              result[key] = value
            end
          end
        end
      end

      @biography = Biography.new(result.symbolize_keys)
    end

    def extract_current_relationship
      current = @doc.css('.pbox.datebox')
      relationship = {}
      relationship[:human] = current.css('div.padb10:first').text
      relationship[:dates] = current.css('ul li').map(&:content)
      result[:current_relationship] = relationship
      result[:status] = :married if relationship[:human] =~ /married/
      result[:status] = :engaged if relationship[:human] =~ /engaged/
      result[:status] = :rumored if relationship[:human] =~ /rumored/
      result[:status] = :dating  if relationship[:human] =~ /dating/
      result[:status] = :single  if relationship[:human] =~ /single/
      relationship
    end

    def extract_past_relationships
    end

    def normalize_bio_key(key)
      key.gsub(/\s/, '_').gsub(/[()]/, '').downcase
    end

    def parse_height(value)
      (Regexp.last_match(1).to_i / 100.0) if value =~ /(\d+) cm.*$/
    end

    def parse_weight(value)
      Regexp.last_match(1).to_f if value =~ /\((.+) kg/
    end
  end
end
