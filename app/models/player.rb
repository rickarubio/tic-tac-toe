class Player < ActiveRecord::Base
  belongs_to :game

  validates :name, presence: true, allow_blank: false
end
