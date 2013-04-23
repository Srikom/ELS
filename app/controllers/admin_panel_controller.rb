class AdminPanelController < ApplicationController

	before_filter :authenticate_admin!

	def index
		@managers = Manager.all
		@staffs = Staff.all
		@managements = Management.all
	end

	def showManager
		@managers = Manager.find(params[:id])
	end

	def showStaff
		@staffs = Staff.find(params[:id])
	end

	def showManagement
		@managements = Management.find(params[:id])
	end

end