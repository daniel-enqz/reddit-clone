class Link < ApplicationRecord
  IMAGE_FORMATS = %w(.jpg .gif .png)
  validates :title, :url, presence: true
  validates :url, uniqueness: true

  def image?
    url.end_with? *IMAGE_FORMATS
  end
  def upvote
    self.upvotes += 1
    save
  end

  def downvote
    self.downvotes += 1
    save
  end

  def score
    upvotes - downvotes
  end

  def self.hottest_first
    all.sort_by(&:score).reverse
  end
end
