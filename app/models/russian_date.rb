class RussianDate
  Months = {
    января: 'Jan',
    февраля: 'Feb',
    марта: 'Mar',
    апреля: 'Apr',
    мая: 'May',
    июня: 'Jun',
    июля: 'Jul',
    августа: 'Aug',
    сентября: 'Sep',
    октября: 'Oct',
    ноября: 'Nov',
    декабря: 'Dec',
  }

  def self.parse(str)
    Date.parse(replace_month(str)) if str
  end

  private
    def self.replace_month(str)
      Months.each do |rus, eng|
        replace = str.sub!(rus.to_s, eng)
        return replace until replace.nil?
      end
    end
end