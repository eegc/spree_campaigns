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

   context 'validation' do
    it { is_expected.to validate_uniqueness_of(:slug) }
  end
end
