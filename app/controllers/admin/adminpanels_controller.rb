class Admin::AdminpanelsController < ApplicationController

	def index
		# @adminpanels = Adminpanel.all
		call_rake :update_shop
	end

	def create
		@adminpanel = Adminpanel.create(frequency: params[:frequency], date: params[:date], time: params[:time])
		redirect_to "/admin"
	end

end