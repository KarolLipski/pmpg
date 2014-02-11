class CreateIssueFrequencies < ActiveRecord::Migration
  def change
    create_table :issue_frequencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
