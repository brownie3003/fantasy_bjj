class CreateTeams < ActiveRecord::Migration
    def change
        create_table :teams do |t|
            t.integer :user_id
            t.integer :rooster_fighter_id
            t.integer :light_feather_fighter_id
            t.integer :feather_fighter_id
            t.integer :light_fighter_id
            t.integer :middle_fighter_id
            t.integer :medium_heavy_fighter_id
            t.integer :heavy_fighter_id
            t.integer :super_heavy_fighter_id
            t.integer :ultra_heavy_fighter_id

            t.timestamps
        end
    end
end
