FactoryBot.define do
  factory :todo do
    project { nil }
    checked { false }
    todoname { "MyString" }
  end
end
