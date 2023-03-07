class Api::V1::RejectedFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rejected_file, only: %i[ show update destroy ]

  # GET /rejected_files
  def index
    @rejected_files = RejectedFile.all

    render json: @rejected_files
  end

  # GET /rejected_files/1
  def show
    render json: @rejected_file
  end

  # POST /rejected_files
  def create
    client_info = ClientInfo.find_by(id: params[:client_info][:id])
    if !(client_info.rejected_file.present?)
      @rejected_file = RejectedFile.new(rejected_file_params)
      @rejected_file.client_info_id = client_info.id; @rejected_file.user_id = client_info.user.id
      if @rejected_file.save
        render json: @rejected_file, status: :created, location: @rejected_file
      else
        render json: @rejected_file.errors, status: :unprocessable_entity
      end
    else
      client_info.rejected_file.update!(reason_of_rejection: params[:reason_of_rejection])
    end
  end

  # PATCH/PUT /rejected_files/1
  def update
    if @rejected_file.update(rejected_file_params)
      render json: @rejected_file
    else
      render json: @rejected_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rejected_files/1
  def destroy
    @rejected_file.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rejected_file
      @rejected_file = RejectedFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rejected_file_params
      params.require(:rejected_file).permit(:user_id, :client_info_id, :reason_of_rejection)
    end
end
