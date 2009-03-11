class Quip < ActiveRecord::Base
  belongs_to :author
  
  acts_as_taggable
end
