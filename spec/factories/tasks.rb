# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    day "2012-10-11"
    room "MyString"
    begin_time "2012-10-11 15:10:19"
    end_time "2012-10-11 15:10:19"
    gear "MyString"
    preset "MyString"
    setup "MyString"
    strike "MyString"
    notes "MyText"
  end
end
