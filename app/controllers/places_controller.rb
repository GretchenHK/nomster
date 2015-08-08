class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update]
	def index
		@places = Place.order("name").page(params[:page]).per(5)
	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(place_params)
		Place.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Nice try, but not allowed', :status => :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])
		if @place.user != current_user
			retrun rend :text => "Nope, not allowed", :status => :forbidden
		end

		@place.update_attributes(place_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
