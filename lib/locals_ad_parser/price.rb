module LocalsAdParser
  class Price
    REGEX = /\d{1,3}[ \,]?((\d{3}\s?(руб(\.)?))|(((тыс(\.)?)|(тысяч)|(т\.))\s?((р\.)|(руб\.))?))/i

    def self.parse(text)
      price = text.match(REGEX).to_s
      { price: format(price) }
    end

    def self.format(text)
      text.try :gsub!, /(тыс)|(т\.)/i, '000'
      text.try :gsub!, /\D/, ''
      text.to_i if text.present?
    end
  end
end
