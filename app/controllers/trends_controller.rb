class TrendsController < ApplicationController
    def index
        # ソート内容分岐
        if params[:sort] == '1'
            sort = 'now'
        elsif params[:sort] == '2'
            sort = 'rank'
        elsif params[:sort] == '3'
            sort = 'word'
        elsif params[:sort] == '4'
            sort = 'tweetcount'
        else
            sort = 'now'
        end

        # 降順昇順分岐
        if params[:order] == 'desc'
            order = 'DESC'
        elsif params[:order] == 'asc'
            order = 'ASC'
        else
            order = 'DESC'
        end

        #都市分岐
        if params[:city] == '大阪'
            @city = '大阪'
        elsif params[:city] == '東京'
            @city = '東京'
        elsif params[:city] == '日本'
            @city = '日本'
        else
            @city = '日本'
        end

        if params[:tag] == '1'
            @word  = params[:search]
            @date  = params[:date]
            if @word.nil? || @word.empty?
                @trends = Trend.where("now LIKE ?","%#{@date}%").where(city: "#{@city}").limit(100).order("#{sort} #{order}").page(params[:page]).per(100)
            elsif @date.empty? || @date.nil?
                @trends = Trend.where("word LIKE ?","%#{@word}%").limit(100).where(city: "#{@city}").order("#{sort} #{order}").page(params[:page]).per(100)
            else
                @trends = Trend.where("word LIKE ?","%#{@word}%").where("now LIKE ?","%#{@date}%").where(city: "#{@city}").limit(100).order("#{sort} #{order}").page(params[:page]).per(100)
            end
        else
            @trends = Trend.where(city: "#{@city}").limit(100).order("#{sort} DESC").page(params[:page]).per(100)
        end
    end

    def tallying
        # ソート内容分岐
        if params[:sort] == '1'
            sort = 'word'
        elsif params[:sort] == '2'
            sort = 'count'
        else
            sort = 'count'
        end

        # 降順昇順分岐
        if params[:order] == 'desc'
            order = 'DESC'
        elsif params[:order] == 'asc'
            order = 'ASC'
        else
            order = 'DESC'
        end

        #都市分岐
        if params[:city] == '大阪'
            @city = '大阪'
        elsif params[:city] == '東京'
            @city = '東京'
        elsif params[:city] == '日本'
            @city = '日本'
        else
            @city = '日本'
        end
        if params[:date].nil? || params[:date].empty?
            @date = Date.today
        else
            @date = params[:date]
        end
        @trends = Trend.select("word, count(word) as count, url, city").where(city: "#{@city}").where("now LIKE ?", "#{@date}%").group("word").order("#{sort} #{order}").page(params[:page]).per(100)
    end

    def show
        # ソート内容分岐
        if params[:sort] == '1'
            sort = 'now'
        elsif params[:sort] == '2'
            sort = 'city'
        else
            sort = 'now'
        end

        # 降順昇順分岐
        if params[:order] == 'desc'
            order = 'DESC'
        elsif params[:order] == 'asc'
            order = 'ASC'
        else
            order = 'DESC'
        end

        @word = params["word"]
        @trends = Trend.where(word: params[:word]).page(params[:page]).order("#{sort} #{order}").per(100)
    end
end
