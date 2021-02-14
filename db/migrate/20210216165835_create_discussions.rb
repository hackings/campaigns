class CreateDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :discussions do |t|
      t.integer :campaign_id
      t.string :title
      t.integer :created_by

      t.timestamps
    end
  end
end
