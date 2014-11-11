class Comment < ActiveRecord::Base
  validates :content, :owner_id, :game_id, presence: true

  belongs_to :game
  belongs_to :user
end
