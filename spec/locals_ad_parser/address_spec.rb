require 'spec_helper'

RSpec.describe LocalsAdParser::Address do
  describe '.parse' do
    subject { LocalsAdParser::Address.parse(text)[:address] }

    context 'without address' do
      let(:text) { 'Люди! Реально выгодно.' }
      it { is_expected.to be_nil }
    end

    context 'when is written abbreviated words' do
      context '(avenue)' do
        let(:text) { 'Адрес: ул. Годовикова 2; Метро: Алексеевская (10 мин., пешком);' }
        it { is_expected.to eq 'ул. Годовикова 2' }
      end

      context '(street)' do
        let(:text) { 'Адрес: пр-т Мира, д.120. От м.Алексеевская третий дом!' }
        it { is_expected.to eq 'пр-т Мира, д.120' }
      end
    end

    context 'when is written by complite word' do
      let(:text) { 'Улица Плещеева 28, 10-15 мин пешком.' }
      it { is_expected.to eq 'Улица Плещеева 28' }
    end
  end
end
