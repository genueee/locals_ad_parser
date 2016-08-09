module LocalsAdParser
  class StopWords
    REGEX = /(сниму)/i

    def self.parse text
      stop_words = text.scan REGEX
      stop_words.any?
    end
  end
end
