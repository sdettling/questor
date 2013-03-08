class Question < ActiveRecord::Base
  attr_accessible :max_selections, :min_selections, :query, :ranked
  belongs_to :user
  has_many :question_options
end
