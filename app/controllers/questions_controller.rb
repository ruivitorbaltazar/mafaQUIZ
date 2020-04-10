class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    fetch_quiz
    @question.quiz =
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:content, :correct_answer, :difficulty)
  end
end
