module LocalsAdParser
  class Phone
    REGEX = /((8|\+7)[- ]?)?(\(?\d{3}\)?)([ -]?\d){7}/

    def self.parse(text)
      phone = text.match(REGEX).to_s
      { phone: format(phone) }
    end

    def self.format(text)
      text.gsub!(/[\s\-\(\)]/, '')
      text.try :gsub!, '+7', '8'
      if text =~ /\d{11}/
        "+7 #{text[1..3]} #{text[4..6]}-#{text[7..8]}-#{text[9..11]}"
      end
    end
  end
end
