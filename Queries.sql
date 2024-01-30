/* Fetch all users name from database */
SELECT user_name 
FROM users ;

/* Fetch all tweets of user by user id most recent tweets first */
SELECT content 
FROM tweets 
WHERE user_id = 1 
ORDER BY tweet_id DESC ;

/* Fetch like count of particular tweet by tweet id */
SELECT COUNT(*) 
AS like_count 
FROM likes 
WHERE tweet_id = 1 ;

/* Fetch retweet count of particular tweet by tweet id */
SELECT COUNT(*) 
AS retweet_count 
FROM retweets 
WHERE tweet_id = 1 ;

/* Fetch comment count of particular tweet by tweet id */
SELECT COUNT(T1.comment_id) 
AS comment_count
FROM tweets T1, tweets T2 
WHERE T1.comment_id = T2.tweet_id
AND T2.Tweet_id = 2 ;

/* Fetch all user’s name who have retweeted particular tweet by tweet id */
SELECT U.user_name 
FROM users U
JOIN retweets R
ON U.user_id = R.user_id 
WHERE R.tweet_id = 1;

/* Fetch all commented tweet’s content for particular tweet by tweet id */
SELECT T1.content 
FROM tweets T1, tweets T2 
WHERE T1.comment_id = T2.tweet_id
AND T2.Tweet_id = 2 ;

/* Fetch user’s timeline (All tweets from users whom I am following with tweet content and user name who has tweeted it) */
SELECT T.content, U.user_name 
FROM tweets T 
JOIN users U
ON T.user_id = U.user_id
JOIN follow F
ON U.user_id = F.following_id 
WHERE F.follower_id = 1
ORDER BY T.tweet_id DESC; 