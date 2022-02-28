class User < ApplicationRecord 
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true,
                    uniqueness: true, 
                    format: {with: URI::MailTo::EMAIL_REGEXP,
                             message: "Invalid format! @ and '.' should be used"}

  def my_tests_level(level)
    tests.where(level: level)
  end 
end 
