class FollowRelationship < ApplicationRecord
  belongs_to :following
  belongs_to :follower
end
