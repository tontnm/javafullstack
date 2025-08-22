https://dbdiagram.io/d/todos-6377b0acc9abfc611173bb1a

/*
Table users{
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  username varchar(30)
  bio varchar(400)
  avatar varchar(200)
  phone varchar(25)
  email varchar(40)
  password varchar(50)
  status varchar(50)
}

Table comments{
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  contents varchar(240)
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
}

Table posts{
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  url varchar(200)
  user_id integer [ref: > users.id]
  caption varchar(255)
  lat real
  lng real
}

Table likes{
  id serial [pk, increment]
  created_at timestamp
  user_id integer [ref: > users.id]
  comment_id integer [ref: > comments.id]
  post_id integer [ref: > posts.id]
}

Table photo_tags{
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
  caption varchar(255)
  x integer
  y integer
}

Table caption_tags{
  id serial [pk, increment]
  created_at timestamp
  user_id integer [ref: > users.id]
  post_id integer [ref: > posts.id]
}

Table hashtags{
  id serial [pk, increment]
  created_at timestamp
  title varchar(25)
}

Table hashtags_posts{
  id serial [pk, increment]
  hashtag_id integer [ref: > hashtags.id]
  post_id integer [ref: > posts.id]
}

Table followers{
  id serial [pk, increment]
  created_at timestamp
  leader_id integer [ref: > users.id]
  follower_id integer [ref: > users.id]
}
*/