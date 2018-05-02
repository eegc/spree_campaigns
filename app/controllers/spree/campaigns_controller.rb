module Spree
  class CampaignsController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionView::MissingTemplate, with: :render_404

    def show
      @campaign = Spree::Campaign.available.friendly.find(params[:id])
      if @campaign && @campaign.taxon
        @taxon = @campaign.taxon
        redirect_to seo_url(@taxon)
      end

      return
    end
  end
end