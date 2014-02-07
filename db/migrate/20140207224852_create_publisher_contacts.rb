class CreatePublisherContacts < ActiveRecord::Migration
  def change
    create_table :publisher_contacts do |t|
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.references :publisher, index: true

      t.timestamps
    end
  end
end
