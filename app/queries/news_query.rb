class NewsQuery
  attr_reader :relation

  def initialize(relation = News.all)
    @relation = relation
  end

  def ordered_by_creation_time
    relation.order(created_at: :desc)
  end

  def recent
    self.ordered_by_creation_time.first(6)
  end
end
