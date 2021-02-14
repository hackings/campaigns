class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.integer :created_by
      t.string :title
      t.string :purpose
      t.integer :estimated_duration

      t.timestamps
    end
  end
end
