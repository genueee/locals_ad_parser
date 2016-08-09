require 'active_support'
require 'active_support/core_ext/object'

require "locals_ad_parser/address"
require "locals_ad_parser/description"
require "locals_ad_parser/floors"
require "locals_ad_parser/kind"
require "locals_ad_parser/phone"
require "locals_ad_parser/price"
require "locals_ad_parser/rooms_amount"
require "locals_ad_parser/sex"
require "locals_ad_parser/space"
require "locals_ad_parser/stop_words"
require "locals_ad_parser/subway"
require "locals_ad_parser/version"

module LocalsAdParser
  class Default
    attr_accessor :subways
    PARSERS = [
      LocalsAdParser::Address,
      LocalsAdParser::Description,
      LocalsAdParser::Floors,
      LocalsAdParser::Kind,
      LocalsAdParser::Phone,
      LocalsAdParser::Price,
      LocalsAdParser::RoomsAmount,
      LocalsAdParser::Sex,
      LocalsAdParser::Space
    ]

    def initialize subways
      self.subways = subways
    end

    def perform text
      ad_params = {}
      if LocalsAdParser::StopWords.parse(text) == true
        return nil
      end
      PARSERS.each do |parser|
        new_params = parser.parse(text)
        ad_params = ad_params.merge(new_params)
      end
      ad_params = ad_params.merge(LocalsAdParser::Subway.parse(text, subways))
      ad_params
    end
  end
end
