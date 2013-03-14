class Question < ActiveRecord::Base
  attr_accessible :max_selections, :min_selections, :query, :ranked, :answers, :question_options_attributes

  belongs_to :user
  has_many :question_options
  has_many :answers, :through => :question_options

  accepts_nested_attributes_for :question_options, allow_destroy: true

  validates :query, :presence => true
  validates :max_selections, :presence => true, :numericality => {only_integer: true, greater_than_or_equal_to: :min_selections}
  validates :min_selections, :presence => true, :numericality => {only_integer: true, less_than_or_equal_to: :max_selections}
  validates_associated :question_options

end
