class AnswersController < ApplicationController

  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.user = current_user if current_user nil?
    respond_to do |format|
      if @answer.save
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

end
