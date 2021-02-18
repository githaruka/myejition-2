class Dictionary < ApplicationRecord
  belongs_to :user
  has_many :contents, foreign_key: :dictionary_id, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 500 }
  end

  validates :category_id, numericality: { other_than: 1 } 

  #def self.search(search) #self.でクラスメソッドとしている
    #if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      #Content.where(['phrase LIKE ?', "%#{search}%"])
    #else
      #Content.all #全て表示。
    #end
  #end

end
