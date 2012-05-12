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

ActiveRecord::Schema.define(:version => 20120510213303) do

  create_table "action_items", :force => true do |t|
    t.integer  "action_id"
    t.integer  "person_id"
    t.string   "opinion"
    t.string   "vote"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "action_items", ["action_id", "person_id"], :name => "index_action_items_on_action_id_and_person_id"

  create_table "actions", :force => true do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "upvote_count"
    t.integer  "downvote_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "actions", ["target_id"], :name => "index_actions_on_target_id"

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "location"
    t.integer  "person_id"
    t.string   "cover_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "albums", ["person_id"], :name => "index_albums_on_person_id"

  create_table "aspect_memberships", :force => true do |t|
    t.integer  "aspect_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "aspect_memberships", ["aspect_id", "person_id"], :name => "index_aspect_memberships_on_aspect_id_and_person_id"

  create_table "aspect_visibilities", :force => true do |t|
    t.integer  "aspect_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "aspect_visibilities", ["aspect_id", "post_id"], :name => "index_aspect_visibilities_on_aspect_id_and_post_id"

  create_table "aspects", :force => true do |t|
    t.boolean  "hidden",     :default => false
    t.string   "name",                          :null => false
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "aspects", ["user_id"], :name => "index_aspects_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "content",         :null => false
    t.integer  "commentary_id"
    t.string   "commentary_type"
    t.integer  "person_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comments", ["commentary_id"], :name => "index_comments_on_commentary_id"
  add_index "comments", ["person_id"], :name => "index_comments_on_person_id"

  create_table "contacts", :force => true do |t|
    t.boolean  "receive",    :default => false
    t.boolean  "share",      :default => false
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "conversation_statuses", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "person_id"
    t.boolean  "unread"
    t.boolean  "visibility"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => "no subject", :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "group_admins", :force => true do |t|
    t.integer  "group_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_admins", ["group_id", "person_id"], :name => "index_group_admins_on_group_id_and_person_id"

  create_table "group_memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_memberships", ["group_id", "person_id"], :name => "index_group_memberships_on_group_id_and_person_id"

  create_table "groups", :force => true do |t|
    t.string   "group_name", :null => false
    t.text     "descripton", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "caption"
    t.text     "location"
    t.integer  "album_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "images", ["album_id"], :name => "index_images_on_album_id"

  create_table "invitations", :force => true do |t|
    t.string   "email"
    t.text     "message"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invitations", ["person_id"], :name => "index_invitations_on_person_id"

  create_table "mentions", :force => true do |t|
    t.integer  "person_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mentions", ["person_id", "post_id"], :name => "index_mentions_on_person_id_and_post_id"

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id"
    t.text     "content",         :null => false
    t.integer  "person_id"
    t.boolean  "unread"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "messages", ["conversation_id"], :name => "index_messages_on_conversation_id"
  add_index "messages", ["person_id"], :name => "index_messages_on_person_id"

  create_table "notification_items", :force => true do |t|
    t.integer  "person_id"
    t.integer  "notification_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "notification_items", ["notification_id", "person_id"], :name => "index_notification_items_on_notification_id_and_person_id"

  create_table "notifications", :force => true do |t|
    t.string   "target_type"
    t.boolean  "read"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "profile_link", :null => false
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "post_type",  :null => false
    t.string   "url_title"
    t.string   "video_url"
    t.string   "photo_url"
    t.string   "link_url"
    t.text     "content",    :null => false
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["group_id"], :name => "index_posts_on_group_id"
  add_index "posts", ["person_id"], :name => "index_posts_on_person_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name",                           :null => false
    t.string   "last_name",                            :null => false
    t.text     "bio"
    t.date     "birthdate"
    t.string   "location"
    t.string   "gender"
    t.string   "education"
    t.string   "avatar"
    t.boolean  "allow_search",       :default => true
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["profile_id", "tag_id"], :name => "index_taggings_on_profile_id_and_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
