module ApplicationHelper
    COLORS = %w(#f2b736 #c5523f #499255 #1875e5).freeze
    def user_color(user)
        COLORS[user.id % COLORS.size]
    end

    def user_initials(user)
        user.user_name.split.map{|name| name[0...1].upcase}.join
    end

end
