class CreateCoreOffers < ActiveRecord::Migration
  def up
    create_table :core_offers do |t|
      t.string   :ref
      t.integer  :status
      t.date     :started_at
      t.date     :ended_at
      t.date     :expired_at
      t.integer  :required_units
      t.integer  :discount_value
      t.integer  :discount_level
      t.boolean  :is_approved
      t.boolean  :is_best
      t.integer  :artisan_id
      t.boolean  :default_target
      t.integer  :precedence
      t.string   :name
      t.string   :title
      t.string   :subtitle
      t.text     :overview
      t.string   :main_picture_url
      t.text     :spotlight_picture_url

      t.timestamps null: false
    end
  end

  def down
    drop_table :core_offers
  end
end
