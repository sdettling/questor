class QuestionOption < ActiveRecord::Base
  attr_accessible :description, :question_id
  belongs_to :question
  has_many :answers
  validates :description, :presence => true
  #validates_presence_of :question
end
