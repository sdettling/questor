class Question < ActiveRecord::Base
  attr_accessible :max_selections, :min_selections, :query, :ranked, :answers, :question_options_attributes

  belongs_to :user
  has_many :question_options
  has_many :answers, :through => :question_options

  accepts_nested_attributes_for :question_options, allow_destroy: true

  validates :query, :presence => true
  validates :max_selections, :presence => true, :numericality => {only_integer: true, greater_than_or_equal_to: :min_selections}
  validates :min_selections, :presence => true, :numericality => {only_integer: true, less_than_or_equal_to: :max_selections, greater_than: 0}
  #with_options :if => :ranked? do |ranked|
  #  ranked.validates :min_selections, :numericality => {greater_than: 1}
  #end
  #validate :max_selections, :numericality => {less_than_or_equal_to: :question_options.count}
  validates_associated :question_options
end
