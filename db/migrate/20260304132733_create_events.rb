class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :total_seat
      t.integer :available_seat
      t.decimal :ticket_price
      t.string :street
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
