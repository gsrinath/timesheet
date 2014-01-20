class ProjectsController < ApplicationController
   def create
    @client = Client.find(params[:client_id])
    @comment = @client.projects.create(params[:project].permit(:title, :description))
    redirect_to client_path(@client)
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @project = @client.projects.find(params[:id])
    @project.destroy
    redirect_to client_path(@client)
  end
end
