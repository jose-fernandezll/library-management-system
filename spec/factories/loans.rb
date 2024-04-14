FactoryBot.define do
  factory :loan do
    user { create(:user) }
    book { create(:book) }
    start_date { "2024-04-13 20:17:36" }
    end_date { "2024-04-13 20:17:36" }
    state { "MyString" }
  end
end
