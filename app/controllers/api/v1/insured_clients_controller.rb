class Api::V1::InsuredClientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_insured_client, only: %i[ show ]

    def index
        if current_user.role == 'admin'
            insured_clients = InsuredClient.all
        else
            insured_clients = InsuredClient.joins(client_info: :user).where(users: { id: current_user.id }).order("created_at DESC")
        end
        render json: {
            status: 200,
            insured_clients: insured_clients
        }
    end
end