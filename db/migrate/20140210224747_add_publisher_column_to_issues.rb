class AddPublisherColumnToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :publisher, index: true
  end
end
