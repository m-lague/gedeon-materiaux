module UpvotesHelper

  def upvote_button(item)

      button_to item.upvotes.count, toggle_vote_path(item_id: item.id, item_type: item.class.to_s)

  end
end
