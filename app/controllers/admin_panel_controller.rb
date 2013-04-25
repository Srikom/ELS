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

	def destroyStaff
		@staffs = Staff.find(params[:id])
		@staffs.destroy 

		flash[:notice] = "User has been deleted"
		redirect_to admin_panel_index_path
	end

	def destroyManager
		@managers = Manager.find(params[:id])
		@managers.destroy

		flash[:notice] = "User has been deleted"
		redirect_to admin_panel_index_path
	end

	def destroyManagement
		@managements = Management.find(params[:id])
		@managements.destroy

		flash[:notice] = "User has been deleted"
		redirect_to admin_panel_index_path
	end

end