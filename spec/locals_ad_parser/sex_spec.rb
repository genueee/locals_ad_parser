require 'spec_helper'

RSpec.describe LocalsAdParser::Sex do
  describe '.parse' do
    subject { LocalsAdParser::Sex.parse(text)[:sex] }

    context 'without sex info' do
      let(:text) { 'Люди! Реально выгодно.' }
      it { is_expected.to eq 'any' }
    end

    context 'when male' do
      let(:text) { 'Ищу 1 Парня, Чистоплотного! Не Курящего!' }
      it { is_expected.to eq 'male' }
    end

    context 'when female' do
      let(:text) { 'Ищу 1 Девушку, Чистоплотную! Не Курящую!' }
      it { is_expected.to eq 'female' }
    end
  end
end
