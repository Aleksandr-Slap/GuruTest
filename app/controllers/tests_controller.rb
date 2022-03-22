class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update destroy categor]

  def index 
    @tests = Test.all
  end 

  def show

  end

  def edit
  
  end

  def new
    @test = Test.new
  end 

  def create
    @user = User.first
    @test = @user.my_tests.new(test_params)

    if @test.save
      redirect_to tests_path
    else
      render :new
    end    
  end

  def level
    render plain: "Test category: <%= @test.level %>"
  end  

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render plain: "Ошибка!"
    end 
  end     

  def destroy
    @test.destroy

    redirect_to root_path
  end  

  private

  def set_test
    @test = Test.find(params[:id])
  end 

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end
