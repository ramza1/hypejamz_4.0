# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105133415) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "public"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "activities", ["item_id"], :name => "index_activities_on_item_id"
  add_index "activities", ["item_type"], :name => "index_activities_on_item_type"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "released_at"
    t.text     "about"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "album_art_file_name"
    t.string   "album_art_content_type"
    t.integer  "album_art_file_size"
    t.datetime "album_art_updated_at"
    t.boolean  "approved",                                              :default => false
    t.boolean  "for_sale",                                              :default => false
    t.decimal  "price",                  :precision => 10, :scale => 0
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "user_id"
    t.date     "released_date"
    t.integer  "comments_count",                                        :default => 0
    t.integer  "download_count",                                        :default => 0
  end

  create_table "artist_hype_requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "tellar_no"
    t.string   "bank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artist_hypes", :force => true do |t|
    t.string   "neme"
    t.datetime "start"
    t.datetime "ene"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "club_name"
  end

  add_index "artists", ["club_id"], :name => "index_artists_on_club_id"
  add_index "artists", ["user_id"], :name => "index_artists_on_user_id"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "story_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["story_id"], :name => "index_categories_on_story_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "user_id"
    t.string   "commentable_type", :default => "", :null => false
    t.integer  "commentable_id",                   :null => false
    t.string   "name"
    t.string   "email"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "downloads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.string   "ip"
    t.decimal  "hjc",        :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "downloads", ["song_id"], :name => "index_downloads_on_song_id"
  add_index "downloads", ["user_id"], :name => "index_downloads_on_user_id"

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "event_file_name"
    t.string   "event_content_type"
    t.integer  "event_file_size"
    t.datetime "event_updated_at"
    t.string   "eve_file_name"
    t.string   "eve_content_type"
    t.integer  "eve_file_size"
    t.datetime "eve_updated_at"
    t.boolean  "public"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "reminder"
    t.integer  "event_attendees_count", :default => 0
    t.integer  "privacy"
    t.integer  "comments_count",        :default => 0
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "favourites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "liked_song_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "favourites", ["liked_song_id"], :name => "index_favourites_on_liked_song_id"
  add_index "favourites", ["user_id"], :name => "index_favourites_on_user_id"

  create_table "featured_songs", :force => true do |t|
    t.integer  "song_id"
    t.integer  "position"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "featured_users", :force => true do |t|
    t.integer  "user_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "featured_users", ["user_id"], :name => "index_featured_users_on_user_id"

  create_table "feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "feeds", ["activity_id"], :name => "index_feeds_on_activity_id"
  add_index "feeds", ["user_id", "activity_id"], :name => "index_feeds_on_user_id_and_activity_id"
  add_index "feeds", ["user_id"], :name => "index_feeds_on_user_id"

  create_table "flaggings", :force => true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flaggings"

  create_table "flags", :force => true do |t|
    t.text     "comment"
    t.integer  "flaggable_id"
    t.string   "flaggable_type"
    t.integer  "user_id"
    t.string   "role",           :default => "abuse"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "flags", ["flaggable_type", "flaggable_id"], :name => "index_flags_on_flaggable_type_and_flaggable_id"
  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hype_managers", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "hype_type"
  end

  create_table "hypes", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "hype_manager_id"
    t.integer  "song_id"
    t.integer  "song_hype_id"
    t.integer  "artist_hype_id"
  end

  add_index "hypes", ["hype_manager_id"], :name => "index_hypes_on_hype_manager_id"
  add_index "hypes", ["user_id"], :name => "index_hypes_on_user_id"

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "identifier"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "impressions", :force => true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "session_hash"
    t.string   "ip_address"
    t.string   "message"
    t.string   "referrer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.integer  "receiver_id"
    t.boolean  "read",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "sender_id"
  end

  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "music_genres", :force => true do |t|
    t.integer  "song_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "music_genres", ["genre_id"], :name => "index_music_genres_on_genre_id"
  add_index "music_genres", ["song_id"], :name => "index_music_genres_on_song_id"

  create_table "notes", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "comments_count", :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "allow_comments", :default => true
    t.boolean  "fans_only",      :default => true
  end

  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "titie"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payment_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "alternate_phone_number"
    t.boolean  "verified",               :default => false
    t.string   "verification_code",                         :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "payment_addresses", ["user_id"], :name => "index_payment_addresses_on_user_id"

  create_table "pictures", :force => true do |t|
    t.text     "caption"
    t.integer  "event_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.integer  "song_id"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.decimal  "dollar_price", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "naira_price",  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "hjc"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.boolean  "yes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "replies", ["song_id"], :name => "index_replies_on_song_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "song_hypes", :force => true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.string   "name"
    t.string   "art_file_name"
    t.string   "art_content_type"
    t.integer  "art_file_size"
    t.datetime "art_updated_at"
    t.string   "album"
    t.time     "duration"
    t.integer  "play_count",                                     :default => 0
    t.integer  "download_count",                                 :default => 0
    t.integer  "countdown_score",                                :default => 0
    t.string   "genre"
    t.string   "title"
    t.integer  "comments_count",                                 :default => 0
    t.boolean  "approved",                                       :default => false
    t.integer  "yes_count",                                      :default => 0
    t.integer  "no_count",                                       :default => 0
    t.integer  "replies_count",                                  :default => 0
    t.boolean  "mp3_processing"
    t.boolean  "art_processing"
    t.boolean  "for_sale",                                       :default => false
    t.string   "price"
    t.integer  "flags_count"
    t.integer  "downloads_count",                                :default => 0
    t.integer  "trends_count",                                   :default => 0
    t.string   "permalink"
    t.decimal  "rating_average",   :precision => 6, :scale => 2, :default => 0.0
  end

  add_index "songs", ["user_id"], :name => "index_songs_on_user_id"

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.boolean  "active",          :default => false
    t.string   "site_url"
    t.string   "image_url"
    t.boolean  "force_top",       :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "ad_file_name"
    t.string   "ad_content_type"
    t.integer  "ad_file_size"
    t.datetime "ad_updated_at"
    t.boolean  "header_position", :default => false
    t.boolean  "top_ad",          :default => false
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "clip_file_name"
    t.string   "clip_content_type"
    t.integer  "clip_file_size"
    t.datetime "clip_updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "comments_count",    :default => 0
  end

  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "story_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["story_id"], :name => "index_taggings_on_story_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trends", :force => true do |t|
    t.string   "ip"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trends", ["song_id"], :name => "index_trends_on_song_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "",    :null => false
    t.string   "encrypted_password",                                    :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "username"
    t.string   "name"
    t.string   "permalink"
    t.string   "real_name"
    t.boolean  "admin",                                                 :default => false
    t.text     "about"
    t.string   "twitter_username"
    t.string   "facebook_username"
    t.string   "rpx_identifier"
    t.integer  "songs_count",                                           :default => 0
    t.integer  "videos_count",                                          :default => 0
    t.boolean  "artist",                                                :default => false
    t.integer  "notes_count",                                           :default => 0
    t.integer  "pictures_count",                                        :default => 0
    t.boolean  "icon_processing"
    t.boolean  "writter",                                               :default => false
    t.integer  "comments_count",                                        :default => 0
    t.boolean  "premium_user",                                          :default => false
    t.boolean  "gold_user",                                             :default => false
    t.decimal  "account_balance",        :precision => 10, :scale => 0, :default => 0
    t.integer  "favourites_count",                                      :default => 0
    t.integer  "payment_address_id"
    t.string   "image"
    t.boolean  "verified",                                              :default => false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["payment_address_id"], :name => "index_users_on_payment_address_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "verifications", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "verifications", ["user_id"], :name => "index_verifications_on_user_id"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "yt_video_id"
    t.boolean  "is_complete",       :default => false
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "shot_file_name"
    t.string   "shot_content_type"
    t.integer  "shot_file_size"
    t.datetime "shot_updated_at"
    t.time     "duration"
    t.integer  "comments_count",    :default => 0
    t.string   "permalink"
  end

  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"

  create_table "withdrawal_requests", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "withdrawal_requests", ["user_id"], :name => "index_withdrawal_requests_on_user_id"

end
