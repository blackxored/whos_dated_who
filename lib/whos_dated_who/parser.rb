module WhosDatedWho
  class Parser
    attr_reader :doc

    def parse(body)
      @doc = Nokogiri::HTML(body)
      extract_bio
      extract_current_relationship
      # TODO: extract_past_relationships
      @result
    end

    def result
      @result ||= Hashie::Mash.new(biography: @biography, status: :unknown)
    end

    private

    def extract_bio
      result = parse_bio(@doc.css('#rcol .cbox-nopad:nth-child(3)'))
      result[:description] = @doc.css('#wikitext').text

      @biography = Biography.new(result.symbolize_keys)
    end

    def extract_current_relationship
      current = @doc.css('.pbox.datebox')
      relationship = {}

      relationship[:human] = current.css('div.padb10:first').text
      relationship[:dates] = current.css('ul li').map(&:content)
      result[:current_relationship] = relationship

      result[:status] = parse_relationship_status(relationship)
      relationship
    end

    def list?(el)
      el.css('div').size > 0
    end

    def parse_bio(bio)
      bio.css('.posl, .posr').each_with_object({}) do |el, result|
        if el.matches?('.posl')
          @key = el.content
        else
          key = normalize_bio_key(@key)
          result[key] = list?(el) ? parse_list(el) : parse_content(el, key)
        end
      end
    end

    def parse_list(el)
      el.children.map(&:content).reject do |c|
        c.empty? || c =~ /^\s\(/
      end
    end

    def parse_content(el, key)
      value = el.content.rstrip
      if respond_to?("parse_#{key}".to_sym, true)
        send("parse_#{key}", value)
      else
        value
      end
    end

    def parse_relationship_status(relationship)
      case relationship[:human]
      when /married/ then :married
      when /engaged/ then :engaged
      when /dating/  then :dating
      when /in a long-term relationship/ then :dating
      when /single/  then :single
      else
        :unknown
      end
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
