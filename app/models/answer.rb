class Answer < ActiveRecord::Base
  # Remember to create a migration!
  has_many :stats
  belongs_to :question

end
