class ManagementPanelController < ApplicationController

	before_filter :authenticate_management!

	def index

	end

end
