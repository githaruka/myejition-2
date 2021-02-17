class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dictionary
  validates_uniqueness_of :dictionary_id, scope: :user_id
end
