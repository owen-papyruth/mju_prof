class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :id
      t.string :integer
      t.string :name
      t.string :string
      t.string :department
      t.string :string
      t.string :image_url
      t.string :string
      t.string :class
      t.string :string
      t.string :like_num
      t.string :integer

      t.timestamps null: false
    end
  end
end
