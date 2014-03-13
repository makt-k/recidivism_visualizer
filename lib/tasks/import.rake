require "#{Rails.root}/lib/import/import_recividism"

namespace :import do
  desc "Import the State Recividism data"
  task recividism: :environment do
    ImportRecividism.import
  end

end
