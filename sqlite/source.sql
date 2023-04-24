--
-- SQLiteStudio v3.4.4 生成的文件，周日 4月 23 00:54:21 2023
--
-- 所用的文本编码：System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- 表：albums
CREATE TABLE IF NOT EXISTS albums (
    album_id         INT           NOT NULL,
    name             VARCHAR (255) NOT NULL,
    user_id          INT           NOT NULL
                                   REFERENCES Users (userid),
    date_of_creation DATE          NOT NULL,
    PRIMARY KEY (
        album_id
    ),
    FOREIGN KEY (
        user_id
    )
    REFERENCES Users (userid) 
);

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       1,
                       'happy day',
                       1,
                       '2022-01-23'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       2,
                       'lovely story',
                       2,
                       '2022-02-12'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       3,
                       'downtown views',
                       3,
                       '2022-02-15'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       4,
                       'lakeside walk',
                       4,
                       '2022-03-02'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       5,
                       'latenight jog',
                       5,
                       '2022-03-04'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       6,
                       'spring break',
                       6,
                       '2022-03-12'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       7,
                       'friend union',
                       7,
                       '2022-03-14'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       8,
                       'christmas',
                       8,
                       '2022-05-12'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       9,
                       'LA trip',
                       9,
                       '2022-06-29'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       10,
                       'summer break',
                       10,
                       '2022-07-03'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       11,
                       'sunset on beach',
                       11,
                       '2022-07-18'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       12,
                       'family vacation',
                       12,
                       '2022-08-02'
                   );

INSERT INTO albums (
                       album_id,
                       name,
                       user_id,
                       date_of_creation
                   )
                   VALUES (
                       13,
                       'city skyline',
                       13,
                       '2022-09-22'
                   );


-- 表：comments
CREATE TABLE IF NOT EXISTS comments (
    comment_id   INTEGER PRIMARY KEY,
    text         TEXT,
    date_created TEXT,
    photo_id     INTEGER REFERENCES photo (photo_id) 
                         NOT NULL,
    user_id      INTEGER REFERENCES Users (userid) 
                         NOT NULL
);

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         1,
                         'love that',
                         '2022/4/11',
                         10,
                         1
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         2,
                         'What book you are reading',
                         '2022/5/21',
                         11,
                         2
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         3,
                         'hhhh that''s funny',
                         '2022/5/2',
                         12,
                         3
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         4,
                         'which mall you guys went to ',
                         '2022/4/5',
                         13,
                         4
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         5,
                         'what place is this',
                         '2022/6/16',
                         14,
                         5
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         6,
                         'that''s beautiful',
                         '2022/7/2',
                         15,
                         6
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         7,
                         'nightnight ',
                         '2022/7/21',
                         16,
                         7
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         8,
                         'marry christmas',
                         '2022/7/24',
                         17,
                         8
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         9,
                         'looks delicious',
                         '2022/9/2',
                         18,
                         9
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         10,
                         'have a nice trip',
                         '2022/10/11',
                         19,
                         10
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         11,
                         'this is amazing!',
                         '2022/11/5',
                         20,
                         11
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         12,
                         'I wish I was there',
                         '2022/12/1',
                         21,
                         12
                     );

INSERT INTO comments (
                         comment_id,
                         text,
                         date_created,
                         photo_id,
                         user_id
                     )
                     VALUES (
                         13,
                         'cannot wait to go back',
                         '2022/12/10',
                         22,
                         13
                     );


-- 表：friend
CREATE TABLE IF NOT EXISTS friend (
    users_id  INT  NOT NULL
                   REFERENCES Users (userid),
    friend_id INT  NOT NULL
                   REFERENCES Users (userid),
    form_date DATE NOT NULL,
    FOREIGN KEY (
        users_id
    )
    REFERENCES Users (userid),
    FOREIGN KEY (
        friend_id
    )
    REFERENCES Users (userid) 
);

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       1,
                       2,
                       '2021-02-23'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       2,
                       3,
                       '2022-04-12'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       3,
                       4,
                       '2018-12-22'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       4,
                       5,
                       '2021-02-16'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       5,
                       6,
                       '2019-12-09'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       6,
                       7,
                       '2018-11-29'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       7,
                       8,
                       '2019-07-19'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       8,
                       9,
                       '2018-02-21'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       9,
                       10,
                       '2019-08-22'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       10,
                       11,
                       '2020-06-14'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       11,
                       12,
                       '2019-07-13'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       12,
                       13,
                       '2020-07-14'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       13,
                       14,
                       '2020-04-16'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       14,
                       15,
                       '2020-05-17'
                   );

INSERT INTO friend (
                       users_id,
                       friend_id,
                       form_date
                   )
                   VALUES (
                       15,
                       1,
                       '2020-06-20'
                   );


-- 表：likes
CREATE TABLE IF NOT EXISTS likes (
    user_id  INTEGER REFERENCES Users (userid) 
                     NOT NULL,
    photo_id INTEGER REFERENCES photo (photo_id) 
                     NOT NULL
);

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      1,
                      10
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      2,
                      11
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      3,
                      12
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      4,
                      13
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      5,
                      14
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      6,
                      15
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      7,
                      16
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      8,
                      17
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      9,
                      18
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      10,
                      19
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      11,
                      10
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      12,
                      11
                  );

INSERT INTO likes (
                      user_id,
                      photo_id
                  )
                  VALUES (
                      13,
                      12
                  );


-- 表：photo
CREATE TABLE IF NOT EXISTS photo (
    photo_id      INT           NOT NULL,
    caption       VARCHAR (255),
    image_binary  MEDIUMBLOB,
    file_location VARCHAR (255),
    album_id      INT           NOT NULL
                                REFERENCES albums (album_id),
    PRIMARY KEY (
        photo_id
    ),
    FOREIGN KEY (
        album_id
    )
    REFERENCES albums (album_id) 
);

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      10,
                      'great time for traveling',
                      10000,
                      '/User/MyFile',
                      1
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      11,
                      'nice book',
                      10001,
                      '/User/MyFile',
                      2
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      12,
                      'interesting perspect',
                      10002,
                      '/User/MyFile',
                      2
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      13,
                      'shopping time',
                      10003,
                      '/User/MyFile',
                      3
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      14,
                      'nice river',
                      10004,
                      '/User/MyFile',
                      4
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      15,
                      'nice tree',
                      11011,
                      '/User/MyFile',
                      4
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      16,
                      'time for sleep',
                      12000,
                      '/User/MyFile',
                      6
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      17,
                      'christmas tree',
                      12011,
                      '/User/MyFile',
                      8
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      18,
                      'turkey',
                      14014,
                      '/User/MyFile',
                      8
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      19,
                      'Disney',
                      15011,
                      '/User/MyFile',
                      9
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      20,
                      'hiking trip',
                      16002,
                      '/User/MyFile',
                      10
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      21,
                      'beach day',
                      17001,
                      '/User/MyFile',
                      11
                  );

INSERT INTO photo (
                      photo_id,
                      caption,
                      image_binary,
                      file_location,
                      album_id
                  )
                  VALUES (
                      22,
                      'birthday cake',
                      19001,
                      '/User/MyFile',
                      13
                  );


-- 表：tag
CREATE TABLE IF NOT EXISTS tag (
    tag_name VARCHAR (255) NOT NULL,
    photo_id INTEGER       REFERENCES photo (photo_id) 
                           NOT NULL
);

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'travel',
                    10
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'life',
                    11
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'reading',
                    12
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'book',
                    13
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'shopping',
                    14
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'mall',
                    15
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'river',
                    16
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'life',
                    17
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'chill',
                    18
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'enjoy',
                    19
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'adventure',
                    20
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    'winter',
                    21
                );

INSERT INTO tag (
                    tag_name,
                    photo_id
                )
                VALUES (
                    '',
                    21
                );


-- 表：Users
CREATE TABLE IF NOT EXISTS Users (
    userid    INT           NOT NULL,
    email     VARCHAR (255) NOT NULL,
    firstName VARCHAR (255) NOT NULL,
    lastName  VARCHAR (255) NOT NULL,
    birthday  DATE          NOT NULL,
    gender    VARCHAR (255) NOT NULL,
    hometown  VARCHAR (255) NOT NULL,
    password  VARCHAR (255) NOT NULL,
    PRIMARY KEY (
        userid
    )
);

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      1,
                      'johnd@gmail.com',
                      'john',
                      'Dan',
                      '2000-01-01',
                      'M',
                      'New York',
                      '12345'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      2,
                      'Jamd@gmail.com',
                      'jam',
                      'Doe',
                      '1997-10-13',
                      'M',
                      'San Francisco',
                      'abced'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      3,
                      'zhangs@gmail.com',
                      'zhang',
                      'Sheng',
                      '1996-05-10',
                      'F',
                      'Beijing',
                      '1q2w3e'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      4,
                      'wangx@gmail.com',
                      'wang',
                      'Xu',
                      '1990-01-12',
                      'M',
                      'Shanghai',
                      'zxcwxc'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      5,
                      'Liam123@gmail.com',
                      'Liam',
                      'Jackson',
                      '2002-03-02',
                      'F',
                      'phoenix',
                      'qwe123'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      6,
                      'Noah21@gmail.com',
                      'Noah',
                      'Mason',
                      '2001-04-01',
                      'F',
                      'Tempe',
                      'aas123'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      7,
                      'michaell@gmail.com',
                      'michael',
                      'Lee',
                      '2003-11-07',
                      'M',
                      'New York',
                      'dpowjf'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      8,
                      'alexl@gmail.com',
                      'Alex',
                      'Lee',
                      '1995-06-18',
                      'F',
                      'Chicago',
                      '1923dcce'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      9,
                      'luxian@gmail.com',
                      'Lu',
                      'Xian',
                      '2001-01-13',
                      'M',
                      'Shandong',
                      '12sss29jd'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      10,
                      'jessicak@gmail.com',
                      'Jessica',
                      'Kim',
                      '1997-07-17',
                      'M',
                      'Toronto',
                      '1uw9122'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      11,
                      'alicew@gmail.com',
                      'Alice',
                      'Wei',
                      '2001-11-13',
                      'F',
                      'Shanghai',
                      '1ew32i20'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      12,
                      'samanLiu@gmail.com',
                      'Saman',
                      'Liu',
                      '1994-10-08',
                      'M',
                      'LosAngeles',
                      '1wsix2s21'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      13,
                      'emilyx@gmail.com',
                      'Emily',
                      'Xian',
                      '2003-11-12',
                      'F',
                      'Seattle',
                      '1w2w2se4'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      14,
                      'davidliu@gmail.com',
                      'David',
                      'Liu',
                      '1996-12-12',
                      'M',
                      'Chicago',
                      'sjs22e34jp'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      15,
                      'Sarahl@gmail.com',
                      'Sarah',
                      'Lee',
                      '2000-01-14',
                      'F',
                      'Beijing',
                      'i0oimmu'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      16,
                      'sarahjones@yahoo.com',
                      'sarah',
                      'Jones',
                      '1995-07-14',
                      'F',
                      'Los Angeles',
                      '90210'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      17,
                      'mikedavis@hotmail.com',
                      'mike',
                      'Davis',
                      '1988-12-05',
                      'M',
                      'Chicago',
                      '60601'
                  );

INSERT INTO Users (
                      userid,
                      email,
                      firstName,
                      lastName,
                      birthday,
                      gender,
                      hometown,
                      password
                  )
                  VALUES (
                      18,
                      'lisasmith@gmail.com',
                      'lisa',
                      'Smith',
                      '2002-03-22',
                      'F',
                      'Houston',
                      '77001'
                  );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
