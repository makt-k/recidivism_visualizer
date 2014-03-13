require 'csv'
require_relative '../states.rb'

class ImportRecividism
  def self.import
    data =  CSV.read("#{Rails.root}/data/ppus07st06.csv")

    data.each do |row|
      state_name = row[1]

      if STATE_NAMES.include?(state_name)
        state_reciv =  StateRecividism.create!(name: state_name, pop_at_risk: row[3], returned_to_jail: row[4], percent: row[5])

        puts "Added #{state_reciv.inspect}"
        # puts "name: #{row[1]}, pop_at_risk: #{row[3]}, returned_to_jail: #{row[4]}, percentage: #{row[5]},  calc_percent = #{(row[4].to_f/row[3].to_f)*100}"
      end

    end

  end
end
