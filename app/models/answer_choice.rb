class AnswerChoice < ActiveRecord::Base
  attr_accessible :answer_id, :question_choice_id
  belongs_to :answer
  belongs_to :question_choice
end
