module HomeHelper
    def other_user(conversation)
        conversation.messages.where.not(user_id: current_user.id)&.first&.user
    end
end
