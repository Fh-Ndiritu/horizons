class SearchController < ApplicationController
    def conversations
        messages = Message.search(conversation_params[:content])
        @conversations = Conversations.search(conversation_params[:content]).or(
            Conversation.where(id: messages.pluck(:conversation_id))
        )
        abort @conversations.inspect
    end



    private 

    def conversation_params 
        #content can be username, prod_title or message_content
        params.require(:search).permit(:content)
    end
end


