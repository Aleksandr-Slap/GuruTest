class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_validation :set_next_question, on: :update

  SUCCESSFUL_COMPLETION = 85.freeze


  def successfully?
    if success_rate >= SUCCESSFUL_COMPLETION
      true
    else
      false
    end  
  end  
  
  def completed?
    current_question.nil?
  end  

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end 
    
    save!
  end


  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end  

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
    # correct_answers_count = correct_answers.count

    # (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    # correct_answers_count = answer_ids.count
  end  

  def correct_answers
    current_question.answers.correct
  end  

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first     
  end

  def set_next_question
    self.current_question = next_question
  end  

  def success_rate
    correct_question / test.questions.count * 100
  end  
end
