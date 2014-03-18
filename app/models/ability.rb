class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, :all
       else
         can :read, Song
         can :read, Video
         can :read, Picture
         can :read, Event
         can :read, Story
         can :read, Album
       end

      if user.writter?
        can :create, Story
        can [:update, :destroy], Story do |story|   
          story.try(:user) == user
        end
      end

      if user.account_balance >= SONG_UPLOAD_CREDIT
       can :create, Song
      end

      if user.verified?
        can :create, Song
        can :sell_songs, Song
        can :sell_Album, Album
        can :create, Album
      end

      if user.account_balance >= 5
        can :create, Message
      end

      if user.account_balance >= WITHDRAW_AMOUNT
        can :create, WithdrawalRequest
      end

      if user.account_balance >= VERIFICATION_CREDIT
        can :create, Verification
      end

     if user
       can :create, Picture
       can :create, Note
       can :create, Video
       can :create, Event
       can :create, Album
       can :create, PaymentAddress
       can :create, Message
       can :read, Message do |message|
         message.try(:sender) == user || message.try(:receiver) == user
       end
       can [:update, :destroy], Comment do |comment|
         comment.try(:user) == user
       end
       can [:update, :destroy], Album do |album|
         album.try(:user) == user
       end
       can [:update, :destroy], Video do |video|
         video.try(:user) == user
       end
       can [:update, :destroy], Picture do |picture|
         picture.try(:user) == user
       end
       can [:update, :destroy], Note do |note|
         note.try(:user) == user
       end
       can [:update, :destroy], Event do |event|
         event.try(:user) == user
       end
       can [:update, :destroy], Song do |song|
         song.try(:user) == user
       end

       can [:update, :destroy, :read], PaymentAddress do |address|
         address.try(:user) == user
       end

     end

      if user.premium_user?
        can :sell_songs, Song
      end
  end
end
