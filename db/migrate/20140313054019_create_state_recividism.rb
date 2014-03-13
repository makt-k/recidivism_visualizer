class CreateStateRecividism < ActiveRecord::Migration
  def change
    create_table :state_recividisms do |t|
      t.string :name
      t.integer :pop_at_risk
      t.integer :returned_to_jail
      t.float :percent
    end
  end
end
