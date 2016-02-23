module GuestsHelper

  def reverse_geocode(guest)
    res = Geokit::Geocoders::GoogleGeocoder.reverse_geocode "#{guest.lat},#{guest.lng}"
    res.full_address
  end

end
