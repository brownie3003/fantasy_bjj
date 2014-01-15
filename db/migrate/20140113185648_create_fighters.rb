class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :name
      t.string :nickname
      t.string :weight
      t.date :date_of_birth
      t.string :team_affiliation

      t.timestamps
    end

    create_table :users_fighters do |t|
      t.belongs_to :fighter
      t.belongs_to :user
    end
  end
end
