class StateRecividismSerializer < ActiveModel::Serializer
  attributes :id, :pop_at_risk, :returned_to_jail, :percent
end
