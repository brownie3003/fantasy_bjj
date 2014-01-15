class FightersUsers < ActiveRecord::Migration
  def change
    create_table :fighters_users do |t|
      t.belongs_to :fighter
      t.belongs_to :user
    end
  end
end
