class ClientsController < ApplicationController
  def new
    @client = Client.new
  end
  
  def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to @client
      else
        render 'new'
      end
      #render text: params[:client].inspect
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
   
    if @client.update(params[:client].permit(:name, :code, :description))
      redirect_to @client
    else
      render 'edit'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  def index
    @clients = Client.all
  end

  private
  def client_params
    params.require(:client).permit(:name, :code, :description)
  end
  
end
