class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :amount
      t.integer :payment_method
      t.string :notes
      t.integer :status
      t.datetime :paid_at

      t.timestamps
    end
  end
end
