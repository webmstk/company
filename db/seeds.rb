# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

person1 = Person.create(name: 'Фёдор', lastname: 'Кукушкин', email: 'f.kukushkin@svarbi.ru', phone: 771, birthday: RussianDate.yesterday)
person2 = Person.create(name: 'Костя', lastname: 'Залупкин', email: 'k.zalupkin@svarbi.ru', phone: 799)
person3 = Person.create(name: 'Лена', lastname: 'Головач', email: 'l.golovach@svarbi.ru', phone: 801, birthday: RussianDate.tomorrow)
