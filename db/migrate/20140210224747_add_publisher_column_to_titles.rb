class AddPublisherColumnToTitles < ActiveRecord::Migration
  def change
    add_reference :titles, :publisher, index: true
  end
end
