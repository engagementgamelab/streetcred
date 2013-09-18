class PagesController < ApplicationController
	layout 'home'

	def index
		@current_campaign = Campaign.current
		gon.markers = Action.all.reject {|x| x.latitude.blank? || x.longitude.blank? || !x.user.try(:active?) || !x.user.try(:visible?)}.collect {|x| {type: 'Feature', geometry: {type: 'Point', coordinates: [x.longitude, x.latitude]}, properties: { title: x.user.try(:display_name), description: "#{x.action_type.try(:channel).try(:name)}<br />#{x.action_type.try(:name)}<br />#{x.created_at.strftime('%m/%d/%Y')}", 'marker-size' => 'small', 'marker-color' => '#ff502d'}}}
	end
end
