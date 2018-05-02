class Spree::Campaign < Spree::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_uniqueness_of :slug
  validates_presence_of :name

  belongs_to :taxon

  scope :active    , -> { where("(starts_at IS NULL OR starts_at < ?) AND (expires_at IS NULL OR expires_at > ?)", Time.now, Time.now) }
  scope :available , -> { where(published: true).active }
end
