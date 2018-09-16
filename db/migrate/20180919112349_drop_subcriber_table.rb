class DropSubcriberTable < ActiveRecord::Migration[5.2]
  def change
    drop_tbale :subscriptions do |t|
      t.string "target_type", null: false	
      t.bigint "target_id", null: false	
      t.string "key", null: false	
      t.boolean "subscribing", default: true, null: false	
      t.boolean "subscribing_to_email", default: true, null: false	
      t.datetime "subscribed_at"	
      t.datetime "unsubscribed_at"	
      t.datetime "subscribed_to_email_at"	
      t.datetime "unsubscribed_to_email_at"	
      t.text "optional_targets"	
      t.datetime "created_at", null: false	
      t.datetime "updated_at", null: false	
      t.index ["key"], name: "index_subscriptions_on_key"	
      t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true	
      t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
    end
  end
end
