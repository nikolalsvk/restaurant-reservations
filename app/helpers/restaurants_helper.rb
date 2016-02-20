module RestaurantsHelper

  def seats_check_box(configuration, x, y)
    if configuration.seat?(x, y)
      button_tag(" ",
                 :class => "configuration-check-box",
                 :style => "background: #990000;",
                 "data-toggle"=> "tooltip")
    else
      button_tag(" ",
                 :class => "configuration-check-box")
    end

  end
end
