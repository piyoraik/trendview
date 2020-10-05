class Trend < ApplicationRecord
    self.table_name = 'twitter_trend'

    def self.search(content)
        Trend.where('word LIKE ?', '%' + content + '%').limit(100).order('id DESC')
    end
end
