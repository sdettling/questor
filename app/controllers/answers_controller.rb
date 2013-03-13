class AnswersController < ApplicationController

  def new
    @answer = current_user.answers.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # POST /answers
  def create
    #@answer = Answer.new(params[:answer])
    #@answer.user = current_user if current_user nil?
    params[:question_option_ids].each do |oid|
      current_user.answers.create(:question_option_id => oid)
    end
  end

end
