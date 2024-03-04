class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
