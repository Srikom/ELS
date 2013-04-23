class LeaveApplicationsController < ApplicationController
	def index
     @leave_applications= Leave_application.all
    
  end
	def show
    @leave_application=Leave_application.find(params[:id])
    
  end
  def new
    
     @leave_application= Leave_application.new
     end
  def create
     @leave_application= Leave_application.new(params[:leave_application])
   
    if  @leave_application.save
       
      #redirect_to new_post_path,:notice=>"Your post was saved"
      
    else
      render "new"
      
   
    end
  end
  def edit
     @leave_application= Leave_application.find(params[:leave_application_id])
    
  end
  def update
    @leave_application= Leave_application.find(params[:id])
    if  @leave_application.update_attributes(params[:leave_application])
      redirect_to leave_application_path
      #:notice=>"Your post was saved"
      else
      render "new"
      
    end
 end
  def destroy
    @leave_applicationpost=Leave_application.find(params[:id])
    @leave_application.destroy
    redirect_to leave_application,:notice=>"Your post has been deleted"
    
    
  end
end
