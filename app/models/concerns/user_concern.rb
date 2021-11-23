module UserConcern
  extend ActiveSupport::Concern

  def add_char_stats
    add_transaction(char_count(:+))
  end

  def update_char_stats
    return unless previous_changes.key?('email')

    add_transaction(char_count_diff(char_count(:+), char_count(:-, previous_changes['email'].first)))
  end

  def remove_char_stats
    add_transaction(char_count(:-))
  end

  private

  def add_transaction(char_diff)
    CharStatsTransaction.create!(diff: char_diff)
  end

  def char_count_diff(old_char_count, new_char_count)
    new_char_count.merge(old_char_count) do |key, oldval, newval|
      oldval + newval
    end
  end

  def char_count(operator, str = email)
    str.chars.each_with_object({}) do |char, acc|
      acc[char] = 0 unless acc.key?(char)
      acc[char] = acc[char].send(operator, 1)
    end
  end
end
