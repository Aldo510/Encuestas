class Stat < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  # Remember to create a migration!
end
