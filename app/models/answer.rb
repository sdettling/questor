class Answer < ActiveRecord::Base
  attr_accessible :user_id, :question, :question_option_id

  belongs_to :user
  belongs_to :question
  belongs_to :question_option

end
