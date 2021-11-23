module CharStatsTransactionConcern
  extend ActiveSupport::Concern

  class_methods do
    def char_stats
      select('id, key, value').from('char_stats_transactions, jsonb_each(diff)')
    end

    def aggregated_char_stats
      char_stats_query = <<-SQL
        SELECT key, SUM(value::int) AS value
        FROM (
          SELECT key, value from char_stats_transactions, jsonb_each(diff)
        ) sq
        GROUP BY key
        ORDER BY value DESC, key ASC      
      SQL
      connection.select_all(char_stats_query)
    end
  end
end
