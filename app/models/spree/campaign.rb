class Spree::Campaign < Spree::Base

  validates_uniqueness_of :slug

  belongs_to :taxon
end
