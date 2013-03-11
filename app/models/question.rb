class Question < ActiveRecord::Base
  attr_accessible :max_selections, :min_selections, :query, :ranked, :question_options_attributes

  belongs_to :user
  has_many :question_options
  has_many :answers
  has_many :answer_choices, :through => :answers

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
