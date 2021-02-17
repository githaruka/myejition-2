class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '--' },
    { id: 2, category: '中学校' },
    { id: 3, category: '高校' },
    { id: 4, category: '大学・専門学校' },
    { id: 5, category: '資格' },
    { id: 6, category: 'SPI' },
    { id: 7, category: '独学' },
    { id: 8, category: '趣味' },
    { id: 9, category: 'その他' },
]
  include ActiveHash::Associations
  has_many :dictionaries
end
  