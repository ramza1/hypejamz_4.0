module ApplicationHelper
  def title(page_title, show_title = true)
    provide(:title) { page_title.to_s }
    @show_title = show_title
  end

  def avatar_url(message)
      default_url = "/assets/guest.png"
      gravatar_id = Digest::MD5.hexdigest(message.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

  def show_title?
    @show_title
  end

  def  nav_link(name, url)
    selected = url.all? { |key, value| params[key] == value }
    link_to(name, url, :class => (selected ? "youarehere tabs" : "tabs"))
  end

 def markdown(text)
   options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis]
   syntax_highlighter(Redcarpet.new(text, *options ).to_html).html_safe
 end

  def syntax_highlighter(html)
     doc = Nokogiri::HTML(html)
     doc.search("//pre[@lang]").each do |pre|
       pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
     end
    doc.to_s
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def pageless(total_pages, url=nil, container=nil)
    opts = {
      :totalPages => total_pages,
      :url        => url,
      :loaderMsg  => 'Loading more results'
    }

    container && opts[:container] ||= container

    javascript_tag("$('#results').pageless(#{opts.to_json});")
  end

  def subscribed(user, friend)
    if current_user
    user.is_friend?(friend)
    end
  end

  def me?
    current_user == @user
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def format_number(number)
    return if number.nil?
    if number < 1000
      number.to_s
    elsif number >= 1000 and number < 1000000
      "%.01fk" % (number/1000.0)
    elsif number >= 1000000
      "%.01fm" % (number/1000000.0)
    end
  end

  def h_what(text)
    text.humanize
  end

  def is_admin?
    current_user.admin?
  end

  def destroy_link_to(path, options)
    link_to path,
            :method => :delete,
            :confirm => t('delete_song_body', :item => options[:item]),
            "data-confirm-title" => t('destroy_confirm_title', :item => options[:item]),
            "data-confirm-cancel" => t('cancel', :item => options[:item]),
            "data-confirm-proceed" => t('proceed', :item => options[:item]),
            "data-confirm-proceed-class" => "btn-danger"
  end

  def can_withdraw
    current_user.account_balance >= WITHDRAW_AMOUNT
  end

end
