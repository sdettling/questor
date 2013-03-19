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

    @formerrors = []
    question = Question.find(params[:question_id])
    max = question.max_selections
    min = question.min_selections
    if params.has_key?(:question_option_ids)
      total = params[:question_option_ids].count
      @formerrors << "You must select between #{min} and #{max} options" if ( total < min || total > max )
    else
      @formerrors << "You must select at least one option"
    end
    if @formerrors.empty?
      if current_user
        question.answers.where("user_id = ?", current_user.id).destroy_all
        params[:question_option_ids].each do |oid|
          current_user.answers.create(:question_option_id => oid)
        end
      else
        params[:question_option_ids].each do |oid|
          Answer.create(:question_option_id => oid)
        end
      end
    redirect_to action: "index", controller: "questions"
    else
      flash[:notice] = @formerrors.first
      redirect_to action: "index", controller: "questions"
    end
  end

end
