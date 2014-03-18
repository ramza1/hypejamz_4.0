module ActivitiesHelper
  def feed_message(activity, recent = false)
    person = activity.user
    case activity_type(activity)
    when "Note"
      note = activity.item
      user = note.user
      view_blog = blog_link("#{person.name}'s yarn", user)
      if recent
        %(new yarn posted  #{post_link(user, note)})
      else
        %(#{person_link_with_image(person)} posted
          #{post_link(note)} &mdash; #{view_blog})
      end
    when "Comment"
      parent = activity.item.commentable
      parent_type = parent.class.to_s
      case parent_type
      when "Note"
        post = activity.item.commentable
        user = post.user
        if recent
          %(made a comment to #{someones(user, person)} yarn
            #{post_link(post)})
        else
          %(#{person_link_with_image(person)} made a comment to
            #{someones(user, person)} yarn
            #{post_link(post)})
        end
      when "User"
        if recent
          %(commented on #{wall(activity)})
        else
          %(#{person_link_with_image(activity.item.user)}
            commented on #{wall(activity)})
        end
      when "Song"
        post = activity.item.commentable
        user = post.user
       if recent
          %(made a comment to #{someones(user, person)} song
            #{title_link(post)})
       else
          %(#{person_link_with_image(person)} made a comment to
            #{someones(user, person)} song
            #{title_link(post)})
       end

      when "Story"
        post = activity.item.commentable
       if recent
          %(made a comment to a story
            #{story_link(post)})
       else
          %(#{person_link_with_image(person)} made a comment to
            a story
            #{story_link(post)})
       end

      end
    when "Event"
      # TODO: make recent/long versions for this
      event = activity.item.commentable
      commenter = activity.item.commenter
      %(#{person_link_with_image(commenter)} commented on
        #{someones(event.person, commenter)} event:
        #{event_link(event.title, event)}.)
    when "Connection"
      if activity.item.contact.admin?
        if recent
          %(joined the system)
        else
          %(#{person_link_with_image(activity.item.person)}
            has joined the system)
        end
      else
        if recent
          %(connected with #{person_link_with_image(activity.item.contact)})
        else
          %(#{person_link_with_image(activity.item.person)} and
            #{person_link_with_image(activity.item.contact)} have connected)
        end
      end
    when "Song"
      if recent
        %(new song was uploaded #{title_link(activity.item)})
      else
        %(#{person_link_with_image(person)} uploaded a new song
          #{title_link(activity.item)})
      end
    when "Topic"
      if recent
        %(new discussion topic #{topic_link(activity.item)})
      else
        %(#{person_link_with_image(person)} created the new discussion topic
          #{topic_link(activity.item)})
      end
    when "Person"
      if recent
        %(description changed)
      else
        %(#{person_link_with_image(person)}'s description changed)
      end
    when "Gallery"
      if recent
        %(new gallery #{gallery_link(activity.item)})
      else
        %(#{person_link_with_image(person)} added a new gallery
          #{gallery_link(activity.item)})
      end
    when "Picture"
      if recent
        %(added new #{photo_link(activity.item)})
      else
        %(#{person_link_with_image(person)} added a new
          #{photo_link(activity.item)})
      end
    when "Event"
      event = activity.item
      %(#{person_link_with_image(person)} has created a new event:
        #{event_link(event.title, event)}.)
    when "EventAttendee"
      event = activity.item.event
      %(#{person_link_with_image(person)} is attending
        #{someones(event.person, person)} event:
        #{event_link(event.title, event)}.)
    else
      raise "Invalid activity type #{activity_type(activity).inspect}"
    end
  end

  def minifeed_message(activity)
    person = activity.user
    case activity_type(activity)
    when "Note"
      %(#{person_link(person)}'s has dropped a new
        #{yarn_link("yarn", activity.item)}.)
    when "Comment"
      parent = activity.item.commentable
      parent_type = parent.class.to_s
      case parent_type
      when "User"
        %(#{person_link(activity.item.user)} commented on
          #{wall(activity)}.)
      when "Event"
        event = activity.item.commentable
        %(#{person_link(activity.item.commenter)} commented on
          #{someones(event.person, activity.item.user)} #{event_link("event", event)}.)
      when "Song"
        song = activity.item.commentable
        %(#{person_link(activity.item.user)} commented on
          #{someones(song.user, activity.item.user)} #{song_link("song", song)}.)
      when "Note"
        note = activity.item.commentable
        %(#{person_link(activity.item.user)} commented on
          #{someones(note.user, activity.item.user)} #{note_link("yarn", note)}.)
      end
    when "Person"
      %(#{person_link(person)}'s description changed)
    when "Picture"
      %(#{person_link(person)} added new
        #{photo_link(activity.item)})
    when "Event"
      %(#{person_link(person)}'s has created a new
        #{event_link("event", activity.item)}.)
    when "Song"
      %(#{person_link(person)} has uploaded a new
        #{song_link("song", activity.item)}.)
    when "EventAttendee"
      event = activity.item.event
      %(#{person_link(person)} is attending
        #{someones(event.person, person)} #{event_link("event", event)}.)
    else
      raise "Invalid activity type #{activity_type(activity).inspect}"
    end
  end

  def person_link(text, person = nil, html_options = nil)
    if person.nil?
      person = text
      text = person.name
    elsif person.is_a?(Hash)
      html_options = person
      person = text
      text = person.name
    end
    # We normally write link_to(..., person) for brevity, but that breaks
    # activities_helper_spec due to an RSpec bug.
    link_to((text), person, html_options)
  end

  def yarn_link(text, note)
    link_to(text, note_path(note), :remote => true, :rel => "facebox")
  end

  def song_link(text, song)
    link_to(text, song_path(song))
  end

  def note_link(text, note)
    link_to(text, note_path(note))
  end

  def post_link(text, note = nil)
    if note.nil?
      note = text
      text =  truncate(note.body, :length => 200, :omission => '...' )
    end
    link_to(text, note_path(note), :rel => "facebox", :remote => true)
  end

  def title_link(text, song = nil)
    if song.nil?
      song = text
      text = song.title
    end
    link_to(text, song_path(song))
  end

  def story_link(text, story = nil)
    if story.nil?
      story = text
      text = story.title
    end
    link_to(text, story_path(story))
  end

  def photo_link(text, photo= nil)
    if photo.nil?
      photo = text
      text = "photo"
    end
    link_to((text), picture_path(photo))
  end

  def someones(user, commenter, link = true)
    link ? "#{person_link(user)}'s" : "#{h user.name}'s"
  end

  def blog_link(text, user)
    link_to(text, user_profile_path(user))
  end

  # Same as person_link except sets up HTML needed for the image on hover effect
  def person_link_with_image(text, person = nil, html_options = nil)
    if person.nil?
      person = text
      text = person.name.humanize
    elsif person.is_a?(Hash)
      html_options = person
      person = text
      text = person.name
    end
    '<span class="imgHoverMarker">' + image_tag(person.icon(:thumb)) + person_link(text, person, html_options) + '</span>'
  end

  def wall(activity)
    commenter = activity.user
    user = activity.item.commentable
    link_to("#{someones(user, commenter, false)} wall",
            user_path(user, :anchor => "tWall"))
  end
  private

    # Return the type of activity.
    # We switch on the class.to_s because the class itself is quite long
    # (due to ActiveRecord).
    def activity_type(activity)
      activity.item.class.to_s
    end
end
