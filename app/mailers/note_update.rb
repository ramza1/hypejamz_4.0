class NoteUpdate < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.note_update.update_followers.subject
  #
  def update_followers(user, note)
    @note = note

    mail to: user.email, :subject => "#{user.name} don yarn for hypejamz.", :from => "Hypejamz"
  end

  def update_song_followers(user, song)
    @song = song
    mail to: user.email, :subject => "#{user.name} uploaded a new song on hypejamz.", :from => "Hypejamz"
  end

  def update_user_followers(user, picture)
    @picture = picture
    mail to: user.email, :subject => "#{user.name} uploaded a new photo on hyprjamz.", :from => "Hypejamz"
  end
end
