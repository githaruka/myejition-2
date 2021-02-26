FactoryBot.define do
  factory :content do
    phrase             { 'クラス' }
    content_mean       { 'オブジェクト指向の設計図のようなもの。' }
       phrase_reference{ 'https://aaaaaaaa123' }
    association :dictionary
  end
end
