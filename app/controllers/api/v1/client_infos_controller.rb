class Api::V1::ClientInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client_info, only: %i[ show update destroy ]

  def index
    if current_user.role ==  'admin'
      @client_infos = ClientInfo.pending
    else
      @client_infos = ClientInfo.where(user_id: current_user.id)
    end

    render json: {
      status: 200,
      client_infos: ClientInfoSerializer.new(@client_infos).serializable_hash[:data].map{|data| data[:attributes]}
    }
  end

  def show
    render json: {status: 200, client_info: @client_info}
  end

  def create
    @client_info = ClientInfo.new(client_info_params)
    @client_info.user_id = current_user.id
    if @client_info.save
      render json: {
        status: 200,
        client_info: @client_info
    }
    else
      render json: @client_info.errors
    end
  end

  def update
    if @client_info.update(client_info_params)
      render json: {status: 200, client_info: @client_info}
    else
      render json: @client_info.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @client_info.destroy
    render json: {
      status: 200,
      message: "Destroyed"
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_info
      @client_info = ClientInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_info_params
      params.permit(:subject, :description, :file, :status)
    end
end
