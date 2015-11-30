require 'rails_helper'

RSpec.describe RussianDate do
  describe '.parse' do
    months = RussianDate::Months.keys

    1.upto(12) do |i|
      it "returns date for #{months[i-1]}" do
        date = "12 #{months[i-1]} 2014"
        expect(RussianDate::parse(date)).to eq Date.parse("12-#{i}-2014")
      end
    end

  end
end