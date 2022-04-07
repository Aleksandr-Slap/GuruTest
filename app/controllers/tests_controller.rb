class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]

  def index 
    @tests = Test.all
  end 

  def show

  end


  def new
    @test = Test.new
  end 
  
  def edit
  
  end

  def create
    @user = User.first
    @test = @user.my_tests.new(test_params)

    if @test.save
      flash[:success] = "Тест успешно создан!"
      redirect_to tests_path
    else
      flash[:alert] = "Вы допустили ошибку при создании теста"
      render :new
    end    
  end 

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end 
  end     

  def destroy
    @test.destroy

    redirect_to root_path
  end 

  def start 
    @current_user.tests.push(@test)
    redirect_to @current_user.test_passage(@test)
  end 

  private

  def set_test
    @test = Test.find(params[:id])
  end 

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
