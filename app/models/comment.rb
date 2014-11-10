class Comment < ActiveRecord::Base
  validates :content, :owner_id, :game_id, presence: true

  has_one :game
  has_one :user
end
