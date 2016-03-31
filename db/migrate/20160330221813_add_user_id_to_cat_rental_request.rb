class AddUserIdToCatRentalRequest < ActiveRecord::Migration
  def change
    add_reference :cat_rental_requests, :user, index: true
    change_column :cat_rental_requests, :user_id, :integer, null: false
  end
end
