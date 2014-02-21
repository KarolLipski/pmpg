class RenameAddresses < ActiveRecord::Migration
  def change
    rename_table :publisher_addresses , :addresses
  end
end
