class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.date :opened_at, null: false
      t.timestamps
    end
  end
end
