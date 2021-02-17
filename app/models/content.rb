class Content < ApplicationRecord
  belongs_to :dictionary

  with_options presence: true do
    validates :phrase, length: { maximum: 40 }
    validates :content_mean, length: { maximum: 1000 }
    validates :phrase_reference
  end

end
