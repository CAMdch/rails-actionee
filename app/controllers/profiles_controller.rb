class ProfilesController < ApplicationController
  def dashboard
    @profile = current_user
    authorize @profile
    @track_items = TrackItem.new
  end
end
