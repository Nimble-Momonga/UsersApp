class CharStat < ApplicationRecord
  include ::CharStatConcern

  # def self.flush_transactions
  #   return unless CharStatsTransaction.any?

  #   transaction do
  #     current_keys = all.pluck(:key)

  #     for_delete, char_stats = CharStatsTransaction.char_stats.map { |x| [x.id, x.attributes.slice('key', 'value')] }.transpose
  #     for_delete.uniq!
  #     for_update, for_create = sum(char_stats).partition { |x| current_keys.include?(x[:key]) }

  #     asdf(for_create)
  #     farlopa(for_update)
  #     CharStatsTransaction.where(id: for_delete).delete_all
  #   end
  # end

  # def self.asdf(for_create)
  #   return if for_create.empty?

  #   insert_all(for_create)
  # end

  # def self.farlopa(for_update)
  #   return if for_update.empty?

  #   for_update = Hash[for_update.map { |x| [x[:key], x[:value]] }]
  #   keys_for_update, values_for_update = where(key: for_update.keys).map { |x| [x.id, { key: x.key, value: x.value + for_update[x.key]}] }.transpose
  #   update(keys_for_update, values_for_update)
  # end

  # def self.sum(char_stats)
  #   char_stats.group_by { |x| x['key'] }
  #             .map { |k, x| { key: k, value: x.reduce(0) { |acc, y| acc + y['value'] } } }
  # end
end
