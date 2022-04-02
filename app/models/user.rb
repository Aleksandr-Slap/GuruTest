class User < ApplicationRecord 
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true,
                    uniqueness: true, 
                    format: {with: URI::MailTo::EMAIL_REGEXP,
                             message: "Invalid format! @ and '.' should be used"}

  def my_tests_level(level)
    tests.where(level: level)
  end  

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end  
end 
