# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :task do |t|
    t.day { Date.today }
    t.room { Faker::Lorem.words(num = 1) }
    t.begin_time "2012-10-11 15:10:19"
    t.end_time "2012-10-11 15:10:19"
    t.gear "LCD"
    t.preset "MyString"
    t.setup "MyString"
    t.strike "MyString"
    t.notes "MyText"
  end
end
