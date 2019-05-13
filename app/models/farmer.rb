class Farmer < ActiveRecord::Base
  has_many :gardens
  has_many :vegetables, through: :gardens
  has_secure_password
end
