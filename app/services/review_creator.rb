class ReviewCreator
  def initialize(attrs)
    byebug
    @review = attrs[:review]
    @film_id = attrs[:film_id]
    @user_id = attrs[:user_id]
  end

  def call
    create_review
  end

  private

  attr_reader :review, :film_id, :user_id

  def create_review
    Review.create(body: review[:body], rating: review[:rating],
      film_id: film_id, user_id: user_id)
  end
end
