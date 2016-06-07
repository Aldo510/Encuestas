class Survey < ActiveRecord::Base
  has_many :questions
  has_many :records
  belongs_to :user
  # Remember to create a migration!
end
