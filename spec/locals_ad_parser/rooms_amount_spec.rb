require 'spec_helper'

RSpec.describe LocalsAdParser::RoomsAmount do
  describe '.parse' do
    subject { LocalsAdParser::RoomsAmount.parse(text)[:rooms_amount] }

    context 'without rooms amount' do
      let(:text) { 'Люди! Реально выгодно.' }
      it { is_expected.to be_zero }
    end

    context 'when have written by numbers' do
      context 'abbreviated word' do
        let(:text) { 'Сдаётся изолированная комната (22кв.м) в 2х комн. Квартире (70 кВ.м)' }
        it { is_expected.to eq 2 }
      end

      context 'complete word' do
        let(:text) { 'сдаю комнату в просторной 3-х комнатной квартире' }
        it { is_expected.to eq 3 }
      end

      context 'without rooms' do
        let(:text) { 'Творческая 2-к квартира, ВДНХ' }
        it { is_expected.to eq 2 }
      end
    end

    context 'when have written by words' do
      let(:text) { 'С 1 июля сдам светлую однокомнатную квартиру на станции метро Щукинская.' }
      it { is_expected.to eq 1 }
    end
  end
end
