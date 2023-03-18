class CreateOrderDeatails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_deatails do |t|

      t.timestamps
    end
  end
end
