class Cell < ActiveRecord::Base
  belongs_to :board
  belongs_to :turn
end
