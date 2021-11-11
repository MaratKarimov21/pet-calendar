class FilteredEventsQuery < BaseQuery
    private
    def by_date(relation, value)
      relation.where(date: value)
    end

    def by_date_from(relation, value)
      relation.where("date >= ?", value)
    end

    def by_date_until(relation, value)
      relation.where("date <= ?", value)
    end
  end