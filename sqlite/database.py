import sqlite3


def show_user():
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT * FROM Users");
    tag=(c.fetchall())
    for tags in tag:
        print(tags)
    conn.commit()
    conn.close()
        

def register_user(first_name, last_name, email, password, date_of_birth=None):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # Check if user already exists
    c.execute("SELECT * FROM Users WHERE email=?", (email,))
    if c.fetchone():
        print("Error: User already exists with this email address.")
        return

    # Insert user information into Users table
    c.execute("INSERT INTO Users (firstName, lastName, email, password, birthday) VALUES (?, ?, ?, ?, ?)",
              (first_name, last_name, email, password, date_of_birth))
    conn.commit()
    conn.close()
    print("User registered successfully.")

def add_friend(user_id, friend_id):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # Check if user and friend exist
    c.execute("SELECT * FROM Users WHERE userid=?", (user_id,))
    if not c.fetchone():
        print(f"Error: User with userid {user_id} does not exist.")
        return
    c.execute("SELECT * FROM Users WHERE userid=?", (friend_id,))
    if not c.fetchone():
        print(f"Error: User with userid {friend_id} does not exist.")
        return

    # Insert friendship into Friends table
    c.execute("INSERT INTO friend (users_id, friend_id) VALUES (?, ?)", (user_id, friend_id))
    conn.commit()
    conn.close()
    print("Friend added successfully.")

def search_users(query):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # Search for users by first name, last name, or email address
    c.execute("SELECT * FROM Users WHERE firstName LIKE ? OR lastName LIKE ? OR email LIKE ?",
              (f"%{query}%", f"%{query}%", f"%{query}%"))
    users = c.fetchall()
    for user in users:
        print(user)
    conn.close()

def list_friends(user_id):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT u.userid, u.firstName, u.lastName FROM Users u INNER JOIN friend f ON u.userid = f.friend_id WHERE f.users_id = ?", (user_id,))
    result = c.fetchall()
    conn.close()
    if len(result) == 0:
        print("You have no friends.")
    else:
        print("Your friends:")
        for friend in result:
            print("User ID: ", friend[0])
            print("Name: ", friend[1], friend[2])

def get_top_users():
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT Users.userid, Users.firstName, Users.lastName, COUNT(DISTINCT photo.photo_id) AS num_photos, COUNT(DISTINCT comments.comment_id) AS num_comments FROM Users LEFT JOIN (SELECT * FROM photo INNER JOIN albums ON photo.album_id = albums.album_id) AS photo ON Users.userid = photo.user_id LEFT JOIN comments ON Users.userid = comments.user_id GROUP BY Users.userid ORDER BY num_photos + num_comments DESC LIMIT 10")
    top_users = c.fetchall()
    conn.close()
    print(top_users)
    return top_users
    
def login(email, password):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT * FROM Users WHERE email=? AND password=?", (email, password))
    user = c.fetchone()
    conn.close()
    return user

def logout():
    pass

import sqlite3

# create new album
def create_album(user_id, album_name):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("INSERT INTO albums (name, user_id, date_of_creation) VALUES (?, ?, datetime('now'))", (album_name, user_id))
    album_id = c.lastrowid
    conn.commit()
    conn.close()
    return album_id

# delete album and its photos
def delete_album(user_id, album_name):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("DELETE FROM albums WHERE user_id=? AND name=?", (user_id, album_name))
    conn.commit()
    conn.close()

# upload new photo
def upload_photo(caption, image_binary, file_location, album_id):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # check if album belongs to user
    c.execute("SELECT user_id FROM albums WHERE album_id=?", (album_id,))
    result = c.fetchone()
    # insert photo into database
    c.execute("INSERT INTO photo (caption, image_binary, file_location, album_id) VALUES (?, ?, ?, ?)", (caption, image_binary, file_location, album_id))
    photo_id = c.lastrowid
    conn.commit()
    conn.close()
    return photo_id

# delete photo and its likes/comments
def delete_photo(image_binary):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("DELETE FROM photo WHERE image_binary = ?", (image_binary,))
    conn.commit()
    conn.close()

# browse all photos
def browse_photos():
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT * FROM photo")
    photos = c.fetchall()
    conn.close()
    print(photos)
    return photos

# browse user's albums and photos
def browse_user_albums(user_id):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    c.execute("SELECT * FROM albums WHERE user_id=?", (user_id,))
    albums = c.fetchall()
    user_albums = []
    for album in albums:
        c.execute("SELECT * FROM photo WHERE album_id=?", (album[0],))
        photos = c.fetchall()
        user_albums.append((album, photos))
    conn.close()
    print(user_albums)
    return user_albums
    
def get_photos_by_tag(user_id, tag_name):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # join the photo, album, and tag tables to get all photos with the specified tag owned by the user
    c.execute('''SELECT p.photo_id, p.caption, p.image_binary, p.file_location
                 FROM photo p
                 JOIN albums a ON p.album_id = a.album_id
                 JOIN tag t ON p.photo_id = t.photo_id
                 WHERE a.user_id = ? AND t.tag_name = ?''', (user_id, tag_name))
    photos = c.fetchall()
    conn.close()
    print(photos)
    return photos
    
def view_all_photos_by_tag(tag_name):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # get all photos that contain the tag
    c.execute('''SELECT * FROM photo JOIN tag ON photo.photo_id = tag.photo_id 
                 WHERE tag.tag_name = ?''', (tag_name,))
    photos = c.fetchall()
    print(photos)
    return photos
    
def view_most_popular_tags():
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # get the most popular tags
    c.execute('''SELECT tag_name, COUNT(photo_id) as count FROM tag 
                 GROUP BY tag_name ORDER BY count DESC LIMIT 10''')
    tags = c.fetchall()
    print(tags)
    return tags

def photo_search(query, user_id=None):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # split the query into individual tags
    tags = query.split()
    # create a list of placeholders for the SQL query
    placeholders = ', '.join(['?' for tag in tags])
    # get all photos that contain all the specified tags
    if user_id:
        c.execute('''SELECT * FROM photo JOIN tag ON photo.photo_id = tag.photo_id 
                     WHERE tag.tag_name IN ({}) AND photo.user_id = ?
                     GROUP BY photo.photo_id HAVING COUNT(photo.photo_id) = ?'''.format(placeholders),
                  tags + [user_id, len(tags)])
    else:
        c.execute('''SELECT * FROM photo JOIN tag ON photo.photo_id = tag.photo_id 
                     WHERE tag.tag_name IN ({})
                     GROUP BY photo.photo_id HAVING COUNT(photo.photo_id) = ?'''.format(placeholders),
                  tags + [len(tags)])
    photos = c.fetchall()
    print(photos)
    return photos

def leave_comment(user_id, photo_id, comment_text):
    # connect to the database
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # insert the comment into the comments table
    c.execute("INSERT INTO comments (user_id, photo_id, text, date_created) VALUES (?, ?, ?, datetime('now'))", (user_id, photo_id, comment_text))
    # increment the user's contribution score by 1
    #c.execute('UPDATE users SET contribution_score = contribution_score + 1 WHERE id = ?', (user_id,))
    # commit the changes to the database
    conn.commit()
    # close the database connection
    conn.close()

def search_comments(query_text):
    # connect to the atabase
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    # search for users who have comments that match the query
    c.execute("SELECT Users.firstName, Users.lastName, COUNT(*) FROM comments INNER JOIN Users ON comments.user_id = Users.userid WHERE comments.text LIKE ? GROUP BY Users.userid ORDER BY COUNT(*) DESC", ('%'+query_text+'%',))
    matching_users = c.fetchall()
    # commit the changes to the database
    conn.commit()
    # close the database connection
    conn.close()
    # return the matching users
    print(matching_users)
    return matching_users
    

def like_photo(user_id, photo_id):
    # connect to the database
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()
    
    # insert the like into the likes table
    c.execute('INSERT INTO likes (user_id, photo_id) VALUES (?, ?)', (user_id, photo_id))
    
    # get the number of likes for the photo
    c.execute('SELECT COUNT(*) FROM likes WHERE photo_id = ?', (photo_id,))
    num_likes = c.fetchone()[0]
    
    # get the users who liked the photo
    c.execute('SELECT Users.firstName, Users.lastName FROM likes INNER JOIN Users ON likes.user_id = Users.userid WHERE likes.photo_id = ?', (photo_id,))
    users_liked = c.fetchall()
    
    # commit the changes to the database
    conn.commit()
    
    # close the database connection
    conn.close()
    
    # return the number of likes and users who liked the photo
    print(num_likes, users_liked)
    return num_likes, users_liked


def friend_recommendation(user_id):
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # Get the list of friends for the given user
    c.execute("SELECT friend_id FROM friend WHERE users_id=?", (user_id,))
    friends = [row[0] for row in c.fetchall()]

    # Get the list of friends of friends for the given user
    friend_of_friends = []
    for friend in friends:
        c.execute("SELECT friend_id FROM friend WHERE users_id=?", (friend,))
        friend_friends = [row[0] for row in c.fetchall()]
        friend_of_friends += friend_friends

    # Count the occurrences of each friend of friend
    friend_counts = {}
    for friend in friend_of_friends:
        if friend != user_id and friend not in friends:
            if friend in friend_counts:
                friend_counts[friend] += 1
            else:
                friend_counts[friend] = 1

    # Sort the friends of friends by the number of times they appear
    recommended_friends = sorted(friend_counts.items(), key=lambda x: x[1], reverse=True)

    # Print the recommended friends
    print("Recommended friends for user {}: ".format(user_id))
    for friend, count in recommended_friends:
        print(friend)

    conn.close()
    
def recommend_similar_photos(user_id):
    # connect to database
    conn = sqlite3.connect('data.sqlite')
    c = conn.cursor()

    # get the five most commonly used tags among the user's photos
    c.execute("SELECT tag_name, COUNT(*) AS tag_count FROM tag "
              "JOIN photo ON tag.photo_id = photo.photo_id "
              "JOIN albums ON photo.album_id = albums.album_id "
              "WHERE albums.user_id = ? "
              "GROUP BY tag_name "
              "ORDER BY tag_count DESC "
              "LIMIT 5", (user_id,))
    top_tags = [row[0] for row in c.fetchall()]

    # perform a disjunctive search through all photos for the top five tags
    c.execute("SELECT photo.caption, COUNT(*) AS match_count FROM tag "
              "JOIN photo ON tag.photo_id = photo.photo_id "
              "WHERE tag_name IN ({}) "
              "GROUP BY photo.photo_id "
              "ORDER BY match_count DESC, LENGTH(photo.caption) "
              .format(','.join('?' for _ in top_tags)), top_tags)
    recommended_photos = [row[0] for row in c.fetchall()]

    # close database connection
    conn.close()
    print(recommended_photos)
    return recommended_photos