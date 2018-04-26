class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :spree_campaigns do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :published, default: false
      t.datetime :starts_at
      t.datetime :expires_at
      t.references :taxon

      t.timestamps null: false
    end

    add_index :spree_campaigns, :taxon_id
    add_foreign_key :spree_campaigns, :spree_taxons, column: :taxon_id
  end
end
