module RestaurantsHelper

  def seats_check_box(configuration, x, y, time)
    if configuration.seat?(x, y)
      if configuration.seat_reserved?(x, y, time)
        content_tag(:div, :class => "itemcontent configuration-check-box") do
          check_box_tag(" ", :disabled => true) +
          content_tag(:span, :class => "fa fa-bell-slash-o fa-2x") +
          content_tag(:h5, "Reserved")
        end
      else
        return content_tag(:div, :class => "itemcontent configuration-check-box") do
          hidden_field_tag("seat_#{x}_#{y}[x]", x) +
          hidden_field_tag("seat_#{x}_#{y}[y]", y) +
          check_box_tag("seat_#{x}_#{y}[reserved]", true, false) +
          content_tag("span", nil, :class => "fa fa-car fa-2x") +
          content_tag(:h5, "Free")
        end
      end
    else
      content_tag(:div, :class => "itemcontent configuration-check-box") do
        check_box_tag(" ") +
        content_tag(:span, nil, :class => "fa fa-ban fa-2x") +
        content_tag(:h5, "")
      end
    end

  end
end
