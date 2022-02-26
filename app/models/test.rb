class Test < ApplicationRecord
  has_many :questions, dependent: :destroy 
  has_and_belongs_to_many :users
  belongs_to :user 
  belongs_to :category
end
