class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '--' },
    { id: 2, category: '英語' },
    { id: 3, category: '外国語' },
    { id: 4, category: '国語・古典' },
    { id: 5, category: '数学' },
    { id: 6, category: '理科・化学・物理' },
    { id: 7, category: '社会・歴史・地理' },
    { id: 8, category: '中学校' },
    { id: 9, category: '高校' },
    { id: 10, category: '大学・専門学校' },
    { id: 11, category: '資格' },
    { id: 12, category: 'SPI' },
    { id: 13, category: '独学' },
    { id: 14, category: '専門分野' },
    { id: 15, category: '図鑑' },
    { id: 16, category: '趣味' },
    { id: 17, category: 'その他' },
]
  include ActiveHash::Associations
  has_many :dictionaries
end
  