class Question < ActiveRecord::Base
  attr_accessible :max_selections, :min_selections, :query, :ranked
end
