require 'spec_helper'

RSpec.describe LocalsAdParser::Floors do
  describe '.parse' do
    subject { LocalsAdParser::Floors.parse(text) }

    context 'without floors information' do
      let(:text) { 'Квартира освобождается примерно через месяц или раньше.' }
      it { is_expected.to be_empty }
    end

    context 'when have written by words' do
      context 'and only one param is present' do
        let(:text) { 'С 15.07 сдаю комнату в просторной 3-х комнатной квартире, 13 этаж, 4 минуты пешком' }
        it { is_expected.to eq({floor: 13}) }
      end

      context 'and both param are present' do
        context 'right order' do
          let(:text) { '9 этаж 24-х этажного монолитного дома (застройщик Донстрой)' }
          it { is_expected.to eq({floor: 9, floors_amount:24}) }
        end

        context 'reverse order' do
          let(:text) { '24-х этажный монолитный дом, 9 этаж' }
          it { is_expected.to eq({floor:9, floors_amount: 24}) }
        end
      end
    end

    context 'when have written through slash' do
      let(:text) { 'на 12/15 этаж Кирпичного Дома' }
      it { is_expected.to eq({floor: 12, floors_amount:15}) }
    end
  end
end
