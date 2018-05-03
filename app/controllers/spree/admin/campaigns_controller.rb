module Spree
  module Admin
    class CampaignsController < ResourceController
      def index
        params[:q] ||= {}

        # As date params are deleted if @show_only_completed, store
        # the original date so we can restore them into the params
        # after the search
        starts_at_gt = params[:q][:starts_at_gt]
        expires_at_lt = params[:q][:expires_at_lt]

        if params[:q][:starts_at_gt].present?
          params[:q][:starts_at_gt] = Time.zone.parse(params[:q][:starts_at_gt]).beginning_of_day rescue ""
        end

        if params[:q][:expires_at_lt].present?
          params[:q][:expires_at_lt] = Time.zone.parse(params[:q][:expires_at_lt]).end_of_day rescue ""
        end

        @search = @collection.ransack(params[:q])
        @collection = @search.result.
                      page(params[:page]).
                      per(params[:per_page] || Spree::Config[:admin_products_per_page])

        # Restore dates
        params[:q][:starts_at_gt] = starts_at_gt
        params[:q][:expires_at_lt] = expires_at_lt
      end

      protected

      def find_resource
        Spree::Campaign.available.friendly.find(params[:id])
      end
    end
  end
end
