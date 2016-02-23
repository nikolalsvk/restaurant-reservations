module RestaurantsHelper

  def seats_check_box(configuration, x, y, time)
    if configuration.seat?(x, y)
      if configuration.seat_reserved?(x, y, time)
        reserved_check_box
      else
        free_check_box(configuration, x, y)
      end
    else
      empty_check_box
    end
  end

  def reserved_check_box
    content_tag(:label, nil, :class => "btn btn-default", :style => "background-color: #B71C1C", :disabled => true) do
      content_tag(:div, :class => "itemcontent configuration-check-box", :disabled => true) do
        check_box_tag(" ", nil, nil, :disabled => true) +
          content_tag(:h5, "")
      end
    end
  end

  def free_check_box(configuration, x, y)
    content_tag(:label, nil, :class => "btn btn-default", :style => "background-color: #00796B") do
      content_tag(:div, :class => "itemcontent configuration-check-box") do
        hidden_field_tag("seat_#{x}_#{y}[x]", x) +
          hidden_field_tag("seat_#{x}_#{y}[y]", y) +
          check_box_tag("seat_#{x}_#{y}[reserved]", true, false) +
          content_tag("span", nil, :class => "fa fa-car fa-2x") +
          content_tag(:h5, "")
      end
    end
  end

  def empty_check_box
    content_tag(:label, nil, :class => "btn btn-default", :disabled => true) do
      content_tag(:div, :class => "itemcontent configuration-check-box") do
        check_box_tag(" ") +
          content_tag(:span, nil, :class => "fa fa-ban fa-2x") +
          content_tag(:h5, "")
      end
    end
  end

end
