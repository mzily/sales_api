class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def random
    respond_with Merchant.random
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(find_param)
  end

  def find_all
    respond_with Merchant.where(find_param.keys.first => find_param.values.first)
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  private

    def find_param
      attributes = %w[id name created_at updated_at]
      params.select { |key, value| attributes.include?(key) }
    end
end
