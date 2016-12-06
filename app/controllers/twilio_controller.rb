require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token

  # POST /twilio/voice
  def voice
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
  	end
 
  	render_twiml response
  end

  # POST /twilio/text
  def text
    #this is called by the app when it wants to send a text
    @guests = Guest.for_event(Event.find_by(id:request.headers['EventId'].to_s).id)
    mes = request.headers['message'].to_s

    #for g in @guests
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
      # send to g.phone
      #if g.phone
      #  phonenum = g.phone
      #end
      message = client.messages.create from: '+14122010448', to: '+1'+"2035601401", body: mes
      render plain: message.status
    #end


  end
end