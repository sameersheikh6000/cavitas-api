class Api::V1::InsuredClientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_insured_client, only: %i[ show ]

    def index
        if current_user.role == 'admin'
            insured_clients = InsuredClient.all
        elsif current_user.role == 'user'
            insured_clients = []
            InsuredClient.each do |ic|
                if ic.client_info.user.id == current_user.id
                insured_clients << ic
                end
            end
        end
        render json: {
            status: 200,
            insured_clients: insured_clients
        }
    end
end