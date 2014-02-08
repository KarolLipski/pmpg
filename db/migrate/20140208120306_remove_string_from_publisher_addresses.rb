class RemoveStringFromPublisherAddresses < ActiveRecord::Migration
  def change
    remove_column :publisher_addresses, :string, :string
  end
end
