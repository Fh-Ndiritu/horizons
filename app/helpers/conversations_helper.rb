module ConversationsHelper

    def nice_date(date_time)
        time_now = DateTime.now.utc
        time = case time_now
            when ->(time_now){date_time+1.days > time_now}
                "Today"
            when ->(time_now){time_now-1.week < date_time}
                date_time.strftime("%A")
            when ->(time_now){time_now-1.month < date_time}
                "#{time_ago_in_words(date_time)} ago"
            when ->(time_now){time_now - 1.year < date_time}
                date_time.strftime("%B")
            else 
                date_time.strftime("%Y")
        end

    end
end
