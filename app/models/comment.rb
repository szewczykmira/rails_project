class Comment < ActiveRecord::Base
  validates :content, :owner_id, :game_id, presence: true
end
