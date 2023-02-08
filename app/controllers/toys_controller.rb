class ToysController < ApplicationController

  def search
    if params[:keyword]
      @toys = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
