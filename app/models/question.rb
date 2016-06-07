class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey

  # Remember to create a migration!
end
