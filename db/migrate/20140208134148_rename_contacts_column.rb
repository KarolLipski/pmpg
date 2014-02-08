class RenameContactsColumn < ActiveRecord::Migration
  def change
    rename_column :publisher_contacts, :contact_name, :name
    rename_column :publisher_contacts, :contact_email, :email
    rename_column :publisher_contacts, :contact_phone, :phone
  end
end
