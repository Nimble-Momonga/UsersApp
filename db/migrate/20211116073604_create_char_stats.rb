class CreateCharStats < ActiveRecord::Migration[6.1]
  def change
    create_table :char_stats do |t|
      t.string :key, null: false
      t.integer :value, null: false, default: 0
    end
  end
end
