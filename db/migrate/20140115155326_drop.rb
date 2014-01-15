class Drop < ActiveRecord::Migration
  def change
    drop_table :fighters_users
  end
end
