class Answer < ActiveRecord::Base
  attr_accessible :user_id, :question, :question_option_id

  belongs_to :user
  belongs_to :question
  belongs_to :question_option

  #validates :question, :presence => true

  #def answers_length
  #  Errors.add("answers","you must select more than 0") if self.question_option_ids.selected.count < 0
  #end
  #length of array is between min and max


end
