class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true, counter_cache: true
 
end
