class RenameContacts < ActiveRecord::Migration
  def change
    rename_table :publisher_contacts, :contacts
  end
end
