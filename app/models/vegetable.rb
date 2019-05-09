class Vegetable < ActiveRecord::Base
  belongs_to :garden
  has_many :farmers, through: :gardens
end
