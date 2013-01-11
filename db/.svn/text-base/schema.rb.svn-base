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

ActiveRecord::Schema.define(:version => 20110714050836) do

  create_table "albums", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "flag"
    t.string   "name"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cadds", :force => true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.string   "link"
    t.string   "body"
    t.string   "ephoto_file_name"
    t.string   "ephoto_content_type"
    t.integer  "ephoto_file_size"
    t.datetime "ephoto_updated_at"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccomments", :force => true do |t|
    t.integer  "content_id"
    t.string   "type_"
    t.integer  "flag"
    t.integer  "is_spam"
    t.integer  "is_abuse"
    t.integer  "noof_dislike"
    t.integer  "noof_like"
    t.integer  "postedagainst"
    t.integer  "profile_id"
    t.string   "text_"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ccomments", ["content_id"], :name => "index_ccomments_on_content_id"

  create_table "cevents", :force => true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.string   "link"
    t.date     "fromdate"
    t.date     "todate"
    t.string   "plan"
    t.string   "where"
    t.string   "street"
    t.string   "citytown"
    t.string   "moreinfo"
    t.integer  "flag_invitemembersofhosts"
    t.integer  "flag_view"
    t.integer  "flag_showgroup"
    t.string   "ephoto_file_name"
    t.string   "ephoto_content_type"
    t.integer  "ephoto_file_size"
    t.datetime "ephoto_updated_at"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", :force => true do |t|
    t.text     "to"
    t.string   "from"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_name"
  end

  create_table "clinks", :force => true do |t|
    t.integer  "content_id"
    t.string   "link"
    t.string   "title"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinks", ["content_id"], :name => "index_clinks_on_content_id"

  create_table "contacts", :force => true do |t|
    t.integer  "profile_id"
    t.string   "email_id"
    t.string   "email_type"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["profile_id"], :name => "index_contacts_on_profile_id"

  create_table "contents", :force => true do |t|
    t.integer  "album_id"
    t.integer  "profile_id"
    t.integer  "poster_id"
    t.integer  "flag"
    t.integer  "cposted_sharedwithflag"
    t.integer  "group_id"
    t.string   "name"
    t.string   "album"
    t.string   "group"
    t.string   "type_"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["poster_id"], :name => "index_contents_on_poster_id"
  add_index "contents", ["profile_id"], :name => "index_contents_on_profile_id"

  create_table "cphotos", :force => true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cphotos", ["content_id"], :name => "index_cphotos_on_content_id"

  create_table "cpolls", :force => true do |t|
    t.integer  "content_id"
    t.string   "question"
    t.boolean  "allow_options"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpolls", ["content_id"], :name => "index_cpolls_on_content_id"

  create_table "cpoptions", :force => true do |t|
    t.integer  "cpoll_id"
    t.integer  "option"
    t.string   "optiontext"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpoptions", ["cpoll_id"], :name => "index_cpoptions_on_cpoll_id"

  create_table "cpshares", :force => true do |t|
    t.integer  "cpoll_id"
    t.integer  "profile_id"
    t.integer  "option"
    t.boolean  "isanswered"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpshares", ["cpoll_id"], :name => "index_cpshares_on_cpoll_id"

  create_table "csharedwiths", :force => true do |t|
    t.integer  "content_id"
    t.integer  "group_id"
    t.integer  "profile_id"
    t.string   "type_"
    t.integer  "flag"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "csharedwiths", ["content_id"], :name => "index_csharedwiths_on_content_id"

  create_table "cstatuses", :force => true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.string   "text_"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cstatuses", ["content_id"], :name => "index_cstatuses_on_content_id"

  create_table "ctags", :force => true do |t|
    t.integer  "cphoto_id"
    t.string   "label"
    t.integer  "width"
    t.integer  "height"
    t.integer  "top"
    t.integer  "left"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ctags", ["cphoto_id"], :name => "index_ctags_on_cphoto_id"

  create_table "cvideos", :force => true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.string   "inthisvideo"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.string   "video_file_path"
    t.integer  "video_file_size"
    t.string   "video_tfile_name"
    t.string   "video_tcontent_type"
    t.string   "video_tfile_path"
    t.integer  "video_tfile_size"
    t.string   "desc"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cvideos", ["content_id"], :name => "index_cvideos_on_content_id"

  create_table "friend_profile_groups", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "profile_group_id"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer "profile_id"
    t.string  "friend_id"
    t.string  "status"
    t.string  "desc"
  end

  add_index "friends", ["profile_id"], :name => "index_friends_on_profile_id"

  create_table "groups", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "flag_privacy"
    t.integer  "flag_notifications"
    t.integer  "flag_chat"
    t.integer  "flag_showgroup"
    t.integer  "flag_email"
    t.integer  "flag_sms"
    t.string   "gphoto_file_name"
    t.string   "gphoto_content_type"
    t.integer  "gphoto_file_size"
    t.datetime "gphoto_updated_at"
    t.string   "desc"
    t.boolean  "is_default"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "group_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcomments", :force => true do |t|
    t.integer  "cphoto_id"
    t.string   "type_"
    t.integer  "flag"
    t.integer  "profile_id"
    t.integer  "is_spam"
    t.integer  "is_abuse"
    t.integer  "noof_dislike"
    t.integer  "noof_like"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pemails", :force => true do |t|
    t.integer  "profile_id"
    t.string   "email"
    t.string   "type_"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pemails", ["profile_id"], :name => "index_pemails_on_profile_id"

  create_table "photoalbums", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "flag"
    t.string   "name"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photoalbums", ["profile_id"], :name => "index_photoalbums_on_profile_id"

  create_table "pneighbours", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "type_"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pneighbours", ["profile_id"], :name => "index_pneighbours_on_profile_id"

  create_table "pphones", :force => true do |t|
    t.integer  "profile_id"
    t.string   "phoneno"
    t.string   "type_"
    t.string   "countrycode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pphones", ["profile_id"], :name => "index_pphones_on_profile_id"

  create_table "profile_activities", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "title"
    t.string   "type_"
    t.string   "sport"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_activities", ["profile_id"], :name => "index_profile_activities_on_profile_id"

  create_table "profile_books", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "auther"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_books", ["profile_id"], :name => "index_profile_books_on_profile_id"

  create_table "profile_employer_projects", :force => true do |t|
    t.integer  "profile_employer_id"
    t.string   "project"
    t.string   "with"
    t.date     "duration"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_employers", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "position"
    t.string   "city"
    t.string   "project"
    t.date     "fromdate"
    t.date     "todate"
    t.string   "website"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "with"
    t.boolean  "iscurrent"
    t.string   "desc"
    t.date     "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_employers", ["profile_id"], :name => "index_profile_employers_on_profile_id"

  create_table "profile_games", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "artist"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_games", ["profile_id"], :name => "index_profile_games_on_profile_id"

  create_table "profile_groups", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_groups", ["profile_id"], :name => "index_profile_groups_on_profile_id"

  create_table "profile_interests", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "title"
    t.string   "type_"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_interests", ["profile_id"], :name => "index_profile_interests_on_profile_id"

  create_table "profile_movies", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "novel"
    t.string   "artist"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_movies", ["profile_id"], :name => "index_profile_movies_on_profile_id"

  create_table "profile_musics", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "album"
    t.string   "artist"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_musics", ["profile_id"], :name => "index_profile_musics_on_profile_id"

  create_table "profile_play_sports", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_play_sports", ["profile_id"], :name => "index_profile_play_sports_on_profile_id"

  create_table "profile_player_sports", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "title"
    t.string   "sport"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_player_sports", ["profile_id"], :name => "index_profile_player_sports_on_profile_id"

  create_table "profile_ppl_inspirations", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "title"
    t.string   "reason"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_ppl_inspirations", ["profile_id"], :name => "index_profile_ppl_inspirations_on_profile_id"

  create_table "profile_relations", :force => true do |t|
    t.integer  "profile_id"
    t.string   "is_family"
    t.string   "family_name"
    t.string   "family_relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_relations", ["profile_id"], :name => "index_profile_relations_on_profile_id"

  create_table "profile_team_sports", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "game"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "desc"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_team_sports", ["profile_id"], :name => "index_profile_team_sports_on_profile_id"

  create_table "profile_universities", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "concentration"
    t.date     "todate"
    t.date     "fromdate"
    t.string   "classname"
    t.string   "website"
    t.string   "attendedfor"
    t.string   "logo"
    t.string   "logo_path"
    t.string   "with"
    t.boolean  "iscurrent"
    t.string   "desc"
    t.date     "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_universities", ["profile_id"], :name => "index_profile_universities_on_profile_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "yahoo_id"
    t.string   "yahoo_pass"
    t.string   "hotmail_id"
    t.string   "hotmail_pass"
    t.string   "gmail_id"
    t.string   "gmail_pass"
    t.string   "skype_id"
    t.string   "skype_pass"
    t.string   "contact_currentcity"
    t.string   "contact_email"
    t.string   "contact_screenname"
    t.string   "contact_messenger"
    t.string   "contact_phone"
    t.string   "contact_mobile"
    t.string   "contact_countrycode"
    t.string   "contact_zipcode"
    t.string   "contact_address"
    t.string   "contact_town"
    t.string   "contact_neighbour"
    t.string   "contact_website"
    t.string   "tv"
    t.string   "favour_quotes"
    t.string   "political_views"
    t.string   "political_views_desc"
    t.integer  "total_friends"
    t.integer  "featured_friends"
    t.string   "religion"
    t.string   "religion_name"
    t.string   "religion_logo"
    t.string   "religion_logo_path"
    t.string   "religion_desc"
    t.boolean  "show_birthdate"
    t.boolean  "show_gender"
    t.string   "gender"
    t.string   "relation_status"
    t.string   "interested_in"
    t.string   "languages"
    t.string   "aboutme"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "pscreens", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "type_"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pscreens", ["profile_id"], :name => "index_pscreens_on_profile_id"

  create_table "pwebsites", :force => true do |t|
    t.integer  "profile_id"
    t.string   "website"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pwebsites", ["profile_id"], :name => "index_pwebsites_on_profile_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "gender"
    t.date     "birth_date"
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "perishable_token",    :default => "", :null => false
    t.integer  "last_chat_count",     :default => 0
    t.integer  "status",              :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
