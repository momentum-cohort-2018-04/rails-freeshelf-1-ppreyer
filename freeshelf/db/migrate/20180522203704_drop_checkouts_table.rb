class DropCheckoutsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :checkouts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
