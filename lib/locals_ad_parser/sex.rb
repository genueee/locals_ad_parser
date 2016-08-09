module LocalsAdParser
  class Sex
    REGEX = /(девушк[а-я]+)|((парн[а-я]+)|(парня))/i

    SEX = {
      /девушк/i => 'female',
      /(парн[а-я]+)|(парня)/i => 'male'
    }.freeze

    def self.parse(text)
      sex = text.match(REGEX).to_s
      { sex: format(sex) }
    end

    def self.format(text)
      sex = 'any'
      SEX.each { |key, value| sex = value if text =~ key }
      sex
    end
  end
end
