class ClientInfoSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :subject, :description, :status

    attribute :file do |client_info|
        if client_info.file.present? 
            {url: client_info.file.url, filename: client_info.file.file.filename}
        end
    end

    attribute :created_at do |client_info|
        client_info.created_at && client_info.created_at.strftime('%d/%m/%Y')
    end

    attribute :rejection do |client_info|
        client_info.rejected_file && client_info.rejected_file.reason_of_rejection
    end

end