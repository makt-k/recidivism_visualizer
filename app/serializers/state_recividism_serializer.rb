require "#{Rails.root}/lib/states"
class StateRecividismSerializer < ActiveModel::Serializer
  attributes :id, :state_abbr, :pop_at_risk, :returned_to_jail, :percent

  def state_abbr
    ::STATES[object.name]
  end

end
