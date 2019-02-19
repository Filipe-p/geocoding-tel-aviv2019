class FlatsController < ApplicationController
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: render_to_string(partial: "flatinfo", locals: { flat: flat }),
        image_url: helpers.asset_url('banana')
      }
    end
  end

  def new
    @flat = Flat.new
  end


end
