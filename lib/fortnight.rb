require "fortnight/version"

module Fortnight
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def in_fortnight(year, month, options={})

      begin_of_month = Time.new(year, month)
      half_of_month = begin_of_month.advance(days: 14).end_of_day
      final_of_month = begin_of_month.end_of_month.end_of_day

      start = options[:half] == :second ? half_of_month : begin_of_month
      finish = options[:half] == :second ? final_of_month : half_of_month

      field = options[:field] || 'created_at'

      scope = where("#{field} >= :s AND #{field} <= :f", s: start, f: finish)
      scope = scope.order(options[:order]) if options[:order]
      scope
    end
  end
end

  