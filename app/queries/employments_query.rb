class EmploymentsQuery
  attr_reader :relation

  def initialize(relation = Employment.all)
    @relation = relation
  end

  def as_actor
    relation.where(job: 'actor')
  end

  def as_director
    relation.where(job: 'director')
  end

  def as_screenwriter
    relation.where(job: 'screenwriter')
  end
end
