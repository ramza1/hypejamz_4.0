#property of rzaartz inc,copyright 2012    version 1.0
class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #note that immediately a user clicks d buynow button we are notified immediately.this controller's notify
  #method is called back as defined in ur routes.rb file and as specified in d buy now form.
  #add typhoeus,yajl-ruby to gem file,update ur route.rb eg match '/notify', :to => 'notifications#notify', :as=>"notification_url"
  #note that the url to this controller should only be restricted to vogue pay i.e vogue pay
  #can access this url only no other ip address or domain except vogue pays domain can post to this
  #method, may be a http access restriction or a white list of urls that an post. try n figure it out.
  def notify
      @transaction_id = params[:transaction_id]
      do_notify
  end

  private
  def do_notify
    hydra = Typhoeus::Hydra.new
    request = Typhoeus::Request.new("https://voguepay.com/?v_transaction_id=#{@transaction_id}&type=json")
    request.on_complete do |response|
        logger.info("#{response.request.url} in #{response.time} seconds")  #remove in production to avoid huge logs
              transaction = Yajl::Parser.parse(response.body)  #or Yajl::Parser.parse(response.body)

              #Now we have the following keys in our transaction hash  you can do whatever
              transaction[:merchant_id]
              transaction[:transaction_id]
              transaction[:email]
              transaction[:total]
              transaction[:merchant_ref]
              transaction[:memo]
              transaction[:status]
              transaction[:date]
              transaction[:referrer]
              transaction[:method]
              @plan = Plan.find_by_id(transaction[:merchant_ref])
              if(transaction[:total] == 0)
                logger.error "Invalid total for transaction:#{@transaction_id}"
                 #do not subscribe the user or generate invoice, notify user of error n cancel order
              elsif(transaction[:status] != 'Approved')
                logger.error "Failed transaction for transaction:#{@transaction_id}"
                 #do not subscribe the user or generate invoice, notify user of error n cancel order
              elsif(transaction[:total] >= @plan.naira_price.to_s)
                current_user.award_user_credits(@plan.hjc.to_i)
              end
        #note d merchant_ref could be d order_id of d order which relates the user n d product or d user n subscription plan
        #You can do anything you want now with the transaction details or the merchant reference.
        #You should query your database with the merchant reference and fetch the records you saved for this transaction.
        #then you should compare the transaction[:total] with the total from your database.*/
    end
    hydra.queue(request)
    hydra.run
  end
end
