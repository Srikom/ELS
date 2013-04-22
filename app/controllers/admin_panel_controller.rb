class AdminPanelController < ApplicationController

	before_filter :authenticate_admin!

	def index
		@managers = Manager.all
		@staffs = Staff.all
		@managements = Management.all
	end

	def show
		@managers = Manager.find(params[:id])
		@staffs = Staff.find(params[:id])
		@managements = Management.find(params[:id])
	end

end
