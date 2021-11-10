class FilteredEventsQuery < BaseQuery
    private
    def by_date(relation, value)
      relation.where(date: value)
    end

    def by_from(relation, value)
      relation.where("date > ?", value)
    end

    def by_until(relation, value)
      relation.where("date < ?", value)
    end
  end