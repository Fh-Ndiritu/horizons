module HomeHelper
    def other_user(conversation)
       user = conversation.messages.where.not(user_id: current_user.id)&.first&.user
       return user if user.present?

        return conversation.product.user
    end
end
