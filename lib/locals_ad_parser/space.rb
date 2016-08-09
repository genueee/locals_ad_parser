module LocalsAdParser
  class Space
    REGEX = /\d{2,3}([\.\,]\d+)?( )?(((кв)(\.)?( )?(м|метр)?)|(метр)|(м(\^)?2))/i

    def self.parse(text)
      space = text.match(REGEX).to_s
      { space: format(space) }
    end

    def self.format(text)
      text.try :gsub!, /\,/, '.'
      text.try :gsub!, /(м(\^)?2)|[а-я ]/i, ''
      text.to_f if text.present?
    end
  end
end
