class DashboardsController < ApplicationController

	def index
		@dashboards = Dashboard.all
		# if params[:id] != nil
		# 	@dashboard = Dashboard.find(params[:id])
		# end		
	end

	def show
		@dashboard = Dashboard.find(params[:id])
		respond_to do |format|
			format.js
			format.html
			format.xml
		end
	end

end