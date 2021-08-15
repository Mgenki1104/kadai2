class CreateIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :introductions do |t|
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
