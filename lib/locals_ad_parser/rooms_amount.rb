module LocalsAdParser
  class RoomsAmount
    REGEX = /(((однокомнатн)|(двухкомнатн)|(трехкомнатн))[а-я]+)|(\d([-]?х\s)?(-)?комн(\.)?)|(\d[-]?к квартир[а-я]*)/i

    AMOUNT = {
      /однокомнатн/ => 1,
      /двухкомнатн/ => 2,
      /трехкомнатн/ => 3
    }.freeze

    def self.parse(text)
      rooms_amount = text.match(REGEX).to_s
      { rooms_amount: format(rooms_amount) }
    end

    def self.format(text)
      rooms = text.to_i
      AMOUNT.each { |word, num| rooms = num if text =~ word } if rooms.zero?
      rooms.zero? ? nil : rooms
    end
  end
end
