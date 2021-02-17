FactoryBot.define do
  factory :dictionary do
    name         { 'Ruby用語' }
    info         { 'これは辞書です。2021年に作成しました。' }
    category_id  { 2 }
    association :user
  end
end
