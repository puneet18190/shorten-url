#command: rake get_data:run

namespace :get_data do
  desc "Get Title Metadata from URLs"
  task :run => :environment do

    records = Record.where(title: nil)
    records.find_in_batches(batch_size: 50) do  |obj|
      obj.each do |record|
        begin
          object = LinkThumbnailer.generate(record.url)
          if object
            record.update(title: object.title)
          end
        rescue Exception => e
          puts ">>>>>>>> Error - #{e.message} >>>>>>>"
        end
      end
    end

  end
end
