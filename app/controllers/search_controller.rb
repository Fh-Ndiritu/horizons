class SearchController < ApplicationController
    def conversations
        messages = Message.search(conversation_params[:query])
        @conversations = Conversation.search(conversation_params[:query]).concat(
            Conversation.where(id: messages.pluck(:conversation_id))
        )
        @conversations
    end



    private 

    def conversation_params 
        #content can be username, prod_title or message_content
        params.permit(:query)
    end
end


