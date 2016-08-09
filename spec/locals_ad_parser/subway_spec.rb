require 'spec_helper'
RSpec.describe LocalsAdParser::Subway do
  describe '.parse' do
    subject { LocalsAdParser::Subway.parse(text)[:subway_ids] }

    context 'without subway information' do
      let(:text) { 'Квартира освобождается примерно через месяц или раньше.' }
      it { is_expected.to be_empty }
    end

    context 'when is written abbreviated words' do
      context 'contain single subway' do
        let(:text) { '10 минут пешком от м. Красногвардейская.' }
        it { is_expected.to match_array [60] }
      end

      context 'contain few subways' do
        let(:text) { '7 минут пешком от м. Шипиловская, 10 минут пешком от м. Красногвардейская.' }
        it { is_expected.to match_array [170, 60] }
      end
    end

    context 'when is written by complite word' do
      let(:text) { 'Адрес: ул. Годовикова 2; Метро: Алексеевская (10 мин., пешком);' }
      it { is_expected.to match_array [5] }
    end
  end
end
