require 'spec_helper'

RSpec.describe LocalsAdParser::Space do
  describe '.parse' do
    subject { LocalsAdParser::Space.parse(text)[:space] }

    context 'without space' do
      let(:text) { 'Some number 40.0 , but is not space' }
      it { is_expected.to be_nil }
    end

    context 'when is written abbreviated words' do
      context 'and dot as decimal mark' do
        let(:text) { 'Квартире (70.5 кВ.м), на 12/15 этаж Кирпичного Дома.' }
        it { is_expected.to eq 70.5 }
      end

      context 'and common as decimal mark' do
        let(:text) { 'Квартире (70,5 кВ.м), на 12/15 этаж Кирпичного Дома.' }
        it { is_expected.to eq 70.5 }
      end
    end

    context 'when is written by complite words' do
      let(:text) { 'Большая комната (около 20 метров)' }
      it { is_expected.to eq 20 }
    end

    context 'when is written by math way' do
      context 'with power sign' do
        let(:text) { 'Большая комната (около 20,0 м^2)' }
        it { is_expected.to eq 20 }
      end

      context 'without power sign' do
        let(:text) { 'Большая комната (около 20.0 м2)' }
        it { is_expected.to eq 20 }
      end
    end
  end
end
