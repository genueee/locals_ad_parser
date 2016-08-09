module LocalsAdParser
  class Subway
    REGEX = /[^а-я\d]((м\.)|(метро[\:\-]?\s))\s*([а-я]+)/i

    def self.parse(text, subways)
      { subway_ids: detect(subways,text) }
    end

    def self.detect subways, text
      ids = []
      subways.each do |id, title|
        regexp = Regexp.new(title, Regexp::IGNORECASE)
        ids << id if text.match(regexp).present?
      end
      ids
    end
  end
end
