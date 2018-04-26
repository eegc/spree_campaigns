FactoryGirl.define do
  factory :campaigns, class: Spree::Campaign do
    association :taxon, factory: :taxon
  end
end
