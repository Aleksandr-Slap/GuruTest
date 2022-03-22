class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test

  validates :body, presence: true, 
                   length: { maximum: 100 },
                   uniqueness: true
end
 