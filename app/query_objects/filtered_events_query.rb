class FilteredEventsQuery < BaseQuery
    private
    def by_date(relation, value)
      relation.where(date: value)
    end

    def by_diprosone(relation, from, to)
      relation.where("date > ? and date < ?", from.to_s, to.to_s)
    end
  end