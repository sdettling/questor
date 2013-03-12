class Answer < ActiveRecord::Base
  attr_accessible :question_id, :answer_choices_attributes
  belongs_to :user
  belongs_to :question
  has_many :answer_choices  
  accepts_nested_attributes_for :answer_choices, allow_destroy: true
end
