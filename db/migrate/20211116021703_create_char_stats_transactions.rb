class CreateCharStatsTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :char_stats_transactions do |t|
      t.jsonb :diff, null: false, default: {}
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
