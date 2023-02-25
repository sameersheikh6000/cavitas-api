class ClientInfoSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :subject, :description

    attribute :file do |client_info|
        if client_info.file.present? 
            {url: template.audio.url, filename: template.audio.file.filename}
        end
    end

    attribute :created_at do |client_info|
        client_info.created_at && client_info.created_at.strftime('%d/%m/%Y')
    end
end