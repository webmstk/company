require 'rails_helper'

RSpec.describe RussianDate do
  describe '.rus_to_date' do
    context 'with valid input date' do
      months = RussianDate::Months.keys

      1.upto(12) do |i|
        it "returns date for #{months[i-1]}" do
          date = "13 #{months[i-1]} 2014"
          expect(RussianDate::rus_to_date(date)).to eq Date.parse("13-#{i}-2014")
        end
      end
    end

    context 'with invalid input date' do
      it 'returns nil' do
        invalid_dates = ['я_криворукая_обезьяна', 'я криворукая обезьяна']

        invalid_dates.each do |invalid_date|
          expect(RussianDate::rus_to_date(invalid_date)).to eq nil
        end
      end
    end
  end


  describe '.date_to_rus' do
    context 'with valid input date' do
      months = RussianDate::Months.keys

      1.upto(12) do |i|
        it "returns russian date for #{months[i-1]}" do
          month = i < 10 ? "0#{i}" : i
          date = Date.parse("2014-#{month}-13")
          expect(RussianDate::date_to_rus(date)).to eq "13 #{months[i-1]} 2014"
        end
      end
    end
  end
end