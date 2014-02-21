class MakeContactsPolymorphic < ActiveRecord::Migration
  def change
    add_reference :contacts , :contactable, polymorphic: true
  end
end
