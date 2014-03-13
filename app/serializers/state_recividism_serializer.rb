require "#{Rails.root}/lib/states"
class StateRecividismSerializer < ActiveModel::Serializer
  attributes :id, :state_abbr, :pop_at_risk, :returned_to_jail, :percent, :fill_color

  def fill_color

    case object.percent
    when 0..8 then
      "LOW"
    when 9..16 then
      "MEDIUM"
    else
      "HIGH"
    end
  end

  def state_abbr
    ::STATES[object.name]
  end

end
