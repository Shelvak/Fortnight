require "fortnight/version"

module Fortnight
  
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def in_fortnight(year, month, options={})

      begin_of_month = Time.new(year, month)
      half_month = begin_of_month.advance(days: 14).end_of_day
      final_of_month = begin_of_month.end_of_month.end_of_day

      start = options[:half] == :second ? half_month : begin_of_month
      finish = options[:half] == :second ? final_of_month : half_month

      field = options[:field] || 'created_at'

      scope = where("#{field} >= :s AND #{field} <= :f", s: start, f: finish)
      scope = scope.order(options[:order]) if options[:order]

      scope
    end
    
    def last_fortnight
      today = Date.today
      date = today - 15.days

      if today.day >= 1 && today.day <= 15
        self.in_fortnight(date.year, date.month, half: :second)
      else
        self.in_fortnight(date.year, date.month)
      end
    end
  end

  def fortnight_in_words
    date = self.created_at.to_date
    month_begin = date.beginning_of_month
    half_month = month_begin.advance(days: 14)

    if date.day >= 1 && date.day <=15
      output = I18n.l(month_begin, format: :long)
      output << ' - '
      output << I18n.l(half_month.to_date, format: :long)
    else
      output = I18n.l((half_month + 1.day).to_date, format: :long)
      output << ' - '
      output << I18n.l(date.end_of_month, format: :long)
    end

    output
  end
end

