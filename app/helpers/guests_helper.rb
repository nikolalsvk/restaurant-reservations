module GuestsHelper

  def reservation_link(review)
    if review.reservation
      link_to "Show", restaurant_reservation_path(review.restaurant, review.reservation),
              :class => "btn btn-info"
    else
      link_to "Show", restaurant_reservation_path(review.restaurant, review.invitation.reservation),
              :class => "btn btn-info"
    end
  end
end
