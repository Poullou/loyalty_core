class CreateCoreRetailers < ActiveRecord::Migration
  def up
    create_table :core_retailers do |t|
      t.string   :ref
      t.text     :ref_validator
      t.integer  :barcode_type
      t.string   :name
      t.string   :main_picture_url
      t.string   :front_card_picture_url
      t.string   :back_card_picture_url
      t.string   :main_picture_url
      t.integer  :precedence

      t.timestamps null: false
    end

    create_join_table :offers, :retailers, table_name: :core_offers_core_retailers do |t|
      t.index [:offer_id, :retailer_id], name: :index_core_offers_retailers
    end
  end

  def down
    drop_table :core_offers_core_retailers
    drop_table :core_retailers
  end
end
