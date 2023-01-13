class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
