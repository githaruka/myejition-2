class User < ApplicationRecord
  has_many :dictionaries
  has_many :likes
  has_many :liked_dictionaries, through: :likes, source: :dictionary
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, presence: true 
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  def liked_by?(dictionary)
    self.likes.exists?(dictionary_id: dictionary.id)
  end
end
