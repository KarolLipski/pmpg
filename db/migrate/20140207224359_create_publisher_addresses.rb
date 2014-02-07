class CreatePublisherAddresses < ActiveRecord::Migration
  def change
    create_table :publisher_addresses do |t|
      t.string :company_name
      t.string :street
      t.integer :street_no
      t.string :postal_code
      t.string :string
      t.string :city
      t.string :nip
      t.string :type
      t.references :publisher, index: true

      t.timestamps
    end
  end
end
