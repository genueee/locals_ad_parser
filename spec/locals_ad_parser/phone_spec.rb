require 'spec_helper'

RSpec.describe LocalsAdParser::Phone do
  describe '.parse' do
    let(:phone) { LocalsAdParser::Phone.parse text }
    let(:answer) { '+7 123 456-78-90' }

    context 'without phone' do
      let(:text) { 'some text without phone' }
      it { expect(phone[:phone]).to be_nil }
    end

    context 'when has only digits' do
      context 'and lead digit is number' do
        let(:text) { '1-к квартира. Заключаем договор. 89295525353 звоните!' }
        let(:answer) { '+7 929 552-53-53' }
        it { expect(phone[:phone]).to eql answer }
      end

      context 'and lead digit is plus sign' do
        let(:text) { 'phone number: +71234567890' }
        it { expect(phone[:phone]).to eql answer }
      end
    end

    context 'when has spaces' do
      context 'and lead digit is number' do
        let(:text) { 'phone number: 8 123-45-67-890' }
        it { expect(phone[:phone]).to eql answer }
      end

      context 'and lead digit is plus sign' do
        let(:text) { 'phone number: +7 123 45-67-890' }
        it { expect(phone[:phone]).to eql answer }
      end

      context 'and brackets' do
        let(:text) { 'phone number: +7 (123) 45-67-890' }
        it { expect(phone[:phone]).to eql answer }
      end
    end
  end
end
