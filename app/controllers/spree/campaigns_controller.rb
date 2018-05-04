module Spree
  class CampaignsController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionView::MissingTemplate, with: :render_404
    helper 'spree/products'

    def show
      @campaign = Spree::Campaign.available.friendly.find(params[:id])

      if @campaign.present? && @campaign.taxon.present?
        @taxon = @campaign.taxon
        @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
        @products = @searcher.retrieve_products
      else
        render_404
      end
    end
  end
end