class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :name
      t.text :imgUrl
      t.integer :like
      t.string :dept

      t.timestamps null: false
    end
  end
end
