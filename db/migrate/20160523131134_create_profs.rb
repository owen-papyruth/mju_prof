class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :name
      t.string :department
      t.string :image_url
      t.string :class

      t.timestamps null: false
    end
  end
end
