module LocalsAdParser
  class Kind
    REGEX = /комнат[а-я]{1,2}([^а-я])/i

    def self.parse(text)
      kind = text.match(REGEX).to_s
      { kind: format(kind) }
    end

    def self.format(text)
      text.present? ? 'room' : 'apartment'
    end
  end
end
