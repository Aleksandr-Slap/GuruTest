class Answer < ApplicationRecord
  belongs_to :question 

  validates :body, presence: true,
                   length: { maximum: 50 }
  validate :limit_answers, on: :create                 

  scope :correct, ->{where(correct: true) }

  private

  def limit_answers
    errors.add(:max_answers, 'cannot have more than 4 answers') if question.answers.size > 4
  end  
end
