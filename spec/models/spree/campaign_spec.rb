require 'spec_helper'

RSpec.describe Spree::Campaign, type: :model do
  context 'attributes' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:slug) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:published) }
    it { is_expected.to respond_to(:starts_at) }
    it { is_expected.to respond_to(:expires_at) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:taxon) }
  end

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  context 'class methods' do
    let(:campaign) { create(:campaign) }

    describe '.active' do
      it "is active without dates" do
        expect(Spree::Campaign.active).to include(campaign)
      end

      it "is active with correct dates" do
        campaign = create(:campaign, :active)
        expect(Spree::Campaign.active).to include(campaign)
      end

      it "is active if not published" do
        campaign.update published: false
        expect(Spree::Campaign.active).to include(campaign)
      end

      it "is not active outdated" do
        campaign = create(:campaign, :expired)
        expect(Spree::Campaign.active).not_to include(campaign)
      end
    end

    describe ".available" do
      it "is available without dates" do
        campaign.update(published: true)
        expect(Spree::Campaign.available).to include(campaign)
      end

      it "is available with correct dates" do
        campaign = create(:campaign, :active)
        campaign.update(published: true)
        expect(Spree::Campaign.available).to include(campaign)
      end

      it "is not available outdated" do
        campaign = create(:campaign, :expired)
        campaign.update(published: true)
        expect(Spree::Campaign.available).not_to include(campaign)
      end

      it "is not available if not published" do
        expect(Spree::Campaign.available).not_to include(campaign)
      end
    end
  end
end
