class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    fetch_quiz
    @question.quiz = @quiz
    authorize @question
    if @question.save

    else
      render 'quiz/show'
    end
  end

  def update
  end

  def destroy
  end

  private

  def fetch_quiz
    @quiz = Quiz.find(params[:id])
    authorize @quiz
  end

  def question_params
    params.require(:question).permit(:content, :correct_answer, :difficulty)
  end
end
