module UpvotesHelper

  def upvote_button(item)
    if current_user
      button_to item.upvotes.count, toggle_vote_path(item_id: item.id, item_type: item.class.to_s)
    else
      button_to item.upvotes.count, toggle_vote_path(item_id: item.id, item_type: item.class.to_s), data: {turbo: false}
    end
  end
end
