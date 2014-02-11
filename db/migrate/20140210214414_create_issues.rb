class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.references :issue_frequency, index: true
      t.boolean :archive

      t.timestamps
    end
  end
end
