class CreateStateRecividism < ActiveRecord::Migration
  def change
    create_table :state_recividisms do |t|
      t.string :name
      t.decimal :pop_at_risk
      t.decimal :returned_to_jail
      t.float :percent
    end
  end
end
