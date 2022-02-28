class Test < ApplicationRecord
  has_many :questions, dependent: :destroy 
  has_and_belongs_to_many :users
  belongs_to :user 
  belongs_to :category
  
  validates :title, presence: true, 
                    uniqueness: { scope: :level }
  validates :level, presence: true, 
                    numericality: { only_integer: true, greater_than: -1 }

  scope :easy, ->{where(level: 0..1)}
  scope :midl, ->{where(level: 2..4)}
  scope :hard, ->{where(level: 5..)}
  scope :show_tests, ->(name_category) { joins(:category).where(categories: { title: name_category }) } 

  def self.category_tests (name_category)
    show_tests(name_category).order(title: :desc).pluck(:title)
  end  
end
