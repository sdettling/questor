class Answer < ActiveRecord::Base
  attr_accessible :question_id
  belongs_to :user
  belongs_to :question
  has_many :answer_choices
end
