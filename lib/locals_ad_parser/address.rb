module LocalsAdParser
  class Address
    REGEX = /((ул\.)|(улица)|(пр-т)|(проспект))\s*([а-я]+)[,]?\s(((дом)|(д\.))\s?)?(\d+(\/\d+)?[а-я]?)/i

    def self.parse(text)
      address = text.match(REGEX).to_s
      { address: format(address) }
    end

    def self.format(text)
      text if text.present?
    end
  end
end
