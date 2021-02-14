class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.integer :campaign_id
      t.string :name

      t.timestamps
    end
  end
end
