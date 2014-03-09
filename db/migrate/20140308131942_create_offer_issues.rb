class CreateOfferIssues < ActiveRecord::Migration
  def change
    create_table :offer_issues do |t|
      t.references :offer, index: true
      t.references :issue, index: true

      t.timestamps
    end
  end
end
