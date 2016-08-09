require 'spec_helper'

RSpec.describe LocalsAdParser::Price do
  describe '.parse' do
    subject { LocalsAdParser::Price.parse(text)[:price] }
    let(:answer) { 40_000 }

    context 'without price' do
      let(:text) { 'Some number 40000, but does not price' }
      it { is_expected.to be_nil }
    end

    context 'when has only digits' do
      let(:text) { 'phone number: 81234567890. 40000 руб.' }
      it { is_expected.to eql answer }
    end

    context 'when has spaces' do
      let(:text) { 'phone number: 81234567890. 40 000 руб.' }
      it { is_expected.to eql answer }
    end

    context 'when has comma' do
      let(:text) { 'phone number: 81234567890. 40,000 руб.' }
      it { is_expected.to eql answer }
    end

    context 'when is written abbreviated words' do
      let(:text) { 'phone number: 81234567890. 40тыс руб.' }
      it { is_expected.to eql answer }
    end

    context 'when is written by complete words' do
      let(:text) { 'phone number: 81234567890. стоит всего 40 тысяч.' }
      it { is_expected.to eql answer }
    end

    context 'when is written single later abbreviation' do
      let(:text) { 'phone number: 81234567890. 40 т.р.' }
      it { is_expected.to eql answer }
    end
  end
end
