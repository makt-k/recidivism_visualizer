require 'csv'
require_relative '../states.rb'

puts STATE_NAMES;

data =  CSV.read("../../data/ppus07st06.csv")

class StateRecividism
  attr_accessor :name, :pop_at_risk, :returned_to_jail, :percent
  def initialize(name, pop_at_risk, returned_to_jail, percent)
    @name = name
    @pop_at_risk = pop_at_risk
    @returned_to_jail = returned_to_jail
    @percent = percent
  end
end

data.each do |row|
  # CSV.foreach("../../data/ppus07st06.csv") do |row|
  # puts "State data = #{row}" if STATE_NAMES.include? row[1]
  state_name = row[1]

  if STATE_NAMES.include?(state_name)
    state_reciv =  StateRecividism.new(state_name, row[3], row[4], row[5])
    puts state_reciv.inspect
    # puts "name: #{row[1]}, pop_at_risk: #{row[3]}, returned_to_jail: #{row[4]}, percentage: #{row[5]},  calc_percent = #{(row[4].to_f/row[3].to_f)*100}"
  end

end
