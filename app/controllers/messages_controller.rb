class MessagesController < ApplicationController 
    before_action :set_conversation

    def create 
        @message = @conversation.messages.new(message_params)
        if @message.save 
            respond_to do |format|
                format.html{ redirect_to conversations_path}
                format.turbo_stream
            end
        else

        end
    end



    private

    def message_params
        params.require(:message).permit(:content).merge(user: current_user)
    end

    def set_conversation
        conversation_id = params[:conversation_id]
        redirect_to home_path unless conversation_id
        @conversation = Conversation.find(conversation_id)
    end
    
end