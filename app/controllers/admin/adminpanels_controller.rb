class Admin::AdminpanelsController < ApplicationController

	def index
		@adminpanels = Adminpanel.all
		render nothing: true
	end

	def create
		@adminpanel = Adminpanel.create(frequency: params[:frequency], date: params[:date], time: params[:time])
	end

end