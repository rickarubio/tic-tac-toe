class Turn < ActiveRecord::Base
  has_one :cell
  belongs_to :game
  belongs_to :player
end
