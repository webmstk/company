class RussianDate
  Months = {
      января: '01',
      февраля: '02',
      марта: '03',
      апреля: '04',
      мая: '05',
      июня: '06',
      июля: '07',
      августа: '08',
      сентября: '09',
      октября: '10',
      ноября: '11',
      декабря: '12',
  }

  def self.rus_to_date(rus)
    date = replace_month(rus)
    Date.parse(date) if date
  end

  def self.date_to_rus(date)
    ar = date.to_formatted_s(:iso8601).split('-')
    month = Months.key(ar[1]).to_s

    "#{ar[2]} #{month} #{ar[0]}"
  end


  private

  def self.replace_month(rus)
    ar = rus ? rus.split : nil
    if ar && ar[1]
      month = ar[1].to_sym
      return ar[2] + Months[month] + ar[0] if Months[month]
    end

    nil
  end
end