class Board < ActiveRecord::Base
  belongs_to :game
  has_many :cells
end
