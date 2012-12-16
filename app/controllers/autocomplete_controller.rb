class AutocompleteController < ApplicationController

	def index
		@autocomplete_data = Hashlog.order(:tag).where("tag like?", "%#{params[:term]}")
		render json: @autocomplete_data.map(&:tag)
	end
end
