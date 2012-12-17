class AutocompleteController < ApplicationController

	def index
		# @autocomplete_data = Hashlog.order(:tag).where("tag ilike?", "#{params[:term]}:*")
		@autocomplete_data = Hashlog.where{ |hashlog| hashlog.tag =~ "%#{params[:term]}%"}
		render json: @autocomplete_data.map(&:tag)
	end
end
