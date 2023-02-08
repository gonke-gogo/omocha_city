class ToysController < ApplicationController

  def search
    begin
      @toys = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]) if params[:keyword].present?
    rescue StandardError => e
      render :search, status: :unprocessable_entity
    end
  end
end
