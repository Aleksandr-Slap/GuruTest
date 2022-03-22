  class QuestionsController < ApplicationController


  before_action :set_question, only: %i[show destroy]
  before_action :set_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  skip_before_action :verify_authenticity_token

  def index

  end  

  def show

  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render inline: '<p>Ошибка при создании вопроса: <%= @question.errors.full_messages %></p>'
    end  
  end

  def destroy
    @question.destroy

    redirect_to root_path
  end  

  private

  def set_question
    @question = Question.find(params[:id])
  end 

  def set_test
    @test = Test.find(params[:test_id])
  end 

  def question_params
    params.require(:question).permit(:body)
  end 

  def question_not_found
    render plain: "404 No question found", status: 404
  end  
end
