class FilteredEventsQuery < BaseQuery
    private
    def by_date(relation, value)
      relation.where(date: value)
    end
  end