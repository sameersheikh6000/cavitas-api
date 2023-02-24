class Api::V1::ClientInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client_info, only: %i[ show update destroy ]

  # GET /client_infos
  def index
    @client_infos = ClientInfo.all

    render json: @client_infos
  end

  # GET /client_infos/1
  def show
    render json: @client_info
  end

  # POST /client_infos
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

  # PATCH/PUT /client_infos/1
  def update
    if @client_info.update(client_info_params)
      render json: @client_info
    else
      render json: @client_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_infos/1
  def destroy
    @client_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_info
      @client_info = ClientInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_info_params
      params.permit(:subject, :description, :file, :user_id, :status)
    end
end
