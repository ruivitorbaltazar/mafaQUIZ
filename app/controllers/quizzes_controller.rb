class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    authorize @quiz
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    authorize @quiz
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.new
    authorize @quiz
  end

  def update
    authorize @quiz
  end

  def show
    fetch_quiz
    @questions = []
    case @quiz.style
    when 'Normal'
      5.times { @questions << Question.new }
    when 'Cascata'
      5.times { @questions << Question.new }
    when 'Escada'
      5.times { @questions << Question.new }
    end
  end

  private

  def fetch_quiz
    @quiz = Quiz.find(params[:id])
    authorize @quiz
  end

  def quiz_params
    params.require(:quiz).permit(:name, :style)
  end
end
