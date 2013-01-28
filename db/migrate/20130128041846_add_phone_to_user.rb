class AddPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phones, :text, :default => ""
  end
end
