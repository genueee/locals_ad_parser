require 'spec_helper'

RSpec.describe LocalsAdParser::Kind do
  describe '.parse' do
    subject { LocalsAdParser::Kind.parse(text)[:kind] }

    context 'without info about kind' do
      let(:text) { 'Люди! Реально выгодно.' }
      it { is_expected.to eq 'apartment' }
    end

    context 'when room' do
      let(:text) { 'С 15.07 сдаю комнату в просторной 3-х комнатной квартире' }
      it { is_expected.to eq 'room' }
    end
  end
end
