import database

#database.show_user()

#register user
#database.register_user("john","Dan","johnd@gmail.com","12345")
#database.register_user("justin","Doe","johnde@gmail.com","13456")

#adding and listing friends
#database.add_friend("9","10")
#database.search_users("john")
#database.list_friends("2")

#user activity
#database.get_top_users()

#login and out
#database.login("johnd@gmail.com","12345")
#database.logout()


#photo and album creating and browing
#database.create_album("1","great")
#database.browse_user_albums("1")
#database.delete_album("1","great")
#database.browse_user_albums("1")
#database.upload_photo("1","1","1","1")
#database.browse_photos()
#database.delete_photo("1")
#database.browse_photos()

#tagviewing and photo search
#database.get_photos_by_tag("1","travel")
#database.view_all_photos_by_tag("travel")
#database.view_most_popular_tags()
#database.photo_search("travel")

#comments
#database.leave_comment("1","10","qqq",)
#database.search_comments("qqq")
#database.like_photo("1","10")

#recommendation
#database.friend_recommendation("1")
database.recommend_similar_photos("2")