class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user_id,       presence: true
  validates :product_id,    presence: true
  validates :text,          presence: true

  def author
    user
  end

  def to_s
    "#{author}: #{text}"
  end
end
