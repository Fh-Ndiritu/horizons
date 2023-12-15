class SearchController < ApplicationController
    def conversations
        if not conversation_params[:query].empty?
            from_messages = Message.search(conversation_params[:query]).pluck(:conversation_id)
            from_product    = Conversation.search(conversation_params[:query]).pluck(:id)
            @conversations = Conversation.where(id: from_messages.concat(from_product)).includes(:product)
        else
            @conversations = Conversation.all.includes(:product)
        end

        respond_to do |format|
            format.html{ render '/conversations/index'}
            format.turbo_stream
        end
    end



    private 

    def conversation_params 
        #content can be username, prod_title or message_content
        params.permit(:query)
    end
end


