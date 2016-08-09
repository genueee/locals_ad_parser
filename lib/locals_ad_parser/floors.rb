module LocalsAdParser
  class Floors
    # REGEX = /((\d+\/\d+)|(\d+(([-]?[йх]))?))\s?(этаж)/i
    REGEX = /(\d+)\sэтаж/i

    def self.parse(text)
      matches = text.scan REGEX
      return {} unless matches.any?
      result = matches.first
      if result.count == 1
        { floor: result.first.to_i }
      else
        {
          floor: result.first.to_i,
          floors_amount: result.last.to_i
        }
      end
    end
  end
end