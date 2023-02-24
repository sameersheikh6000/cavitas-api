class ReadFileService
    require 'csv'
    def read_file(client_info)
        CSV.foreach(client_info.file.file.path, headers: true) do |row|
            data = InsuredClient.new row.to_hash
            data.client_info_id = client_info.id
            data.save!
        end
    end
end