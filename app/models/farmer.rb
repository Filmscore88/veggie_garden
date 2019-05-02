class Farmer < ActiveRecord::Base
  has_many :gardens
  has_secure_password
end
