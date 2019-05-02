class Garden < ActiveRecord::Base
  has_many :vegetables
  belongs_to :farmer 
end
