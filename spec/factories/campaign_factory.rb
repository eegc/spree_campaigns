FactoryGirl.define do
  factory :campaign, class: Spree::Campaign do
    name "Campaign00"
    description "Description campaign"

    trait :active do
      starts_at Time.zone.now.beginning_of_day
      expires_at (Time.zone.now + 1.week).end_of_day
    end

    trait :expired do
      starts_at (Time.zone.now - 2.week).beginning_of_day
      expires_at (Time.zone.now - 1.week).end_of_day
    end

  end
end
