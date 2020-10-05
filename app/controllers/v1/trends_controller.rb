class V1::TrendsController < ApplicationController
    def index
        trends = Trend.all.limit(100).order('id DESC')
        render json: trends
    end

    def search
        content = params[:word]
        trends = Trend.search(content)
        render json: trends
    end
end
