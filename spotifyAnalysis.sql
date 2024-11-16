SELECT *
FROM spotify;

/*how many records are there in the dataset*/
SELECT COUNT(*)
FROM spotify;

/*Exploring patterns in audio features and popularity of songs to analyze trends and preferences of the audience*/
/*Creating specific ranges in streams to get a more cleaner and efficient analysis and count how many songs there are for each range.*/
WITH range_ AS (
	SELECT *,
		CASE 
		WHEN streams BETWEEN 0 AND 100000000 THEN 'Below 100 Million'
		WHEN streams BETWEEN 100000000 AND 250000000 THEN '100 Million to 250 Million'
		WHEN streams BETWEEN 250000000 AND 500000000 THEN '250 Million to 500 Million'
		WHEN streams BETWEEN 500000000 AND 1000000000 THEN '500 Million to 1 Billion'
		WHEN streams BETWEEN 1000000000 AND 2000000000 THEN '1 Billion to 2 Billion'
		WHEN streams BETWEEN 2000000000 AND 3000000000 THEN '2 Billion to 3 Billion'
		WHEN streams > 3000000000 THEN 'Over 3 Billion'
		ELSE 'Null'
	END AS streams_range
	FROM spotify
	)
SELECT streams_range, 
	COUNT(*) AS num_of_songs
FROM range_
WHERE streams IS NOT NULL
GROUP BY streams_range
ORDER BY num_of_songs DESC;

/*For each streams range, checking the score of bpm, danceability, valence, energy, etc...*/
WITH range_ AS (
	SELECT *,
		CASE 
		WHEN streams BETWEEN 0 AND 100000000 THEN 'Below 100 Million'
		WHEN streams BETWEEN 100000000 AND 250000000 THEN '100 Million to 250 Million'
		WHEN streams BETWEEN 250000000 AND 500000000 THEN '250 Million to 500 Million'
		WHEN streams BETWEEN 500000000 AND 1000000000 THEN '500 Million to 1 Billion'
		WHEN streams BETWEEN 1000000000 AND 2000000000 THEN '1 Billion to 2 Billion'
		WHEN streams BETWEEN 2000000000 AND 3000000000 THEN '2 Billion to 3 Billion'
		WHEN streams > 3000000000 THEN 'Over 3 Billion'
		ELSE 'Null'
	END AS streams_range
	FROM spotify
	)
SELECT streams_range, 
	ROUND(AVG(bpm), 2) AS avg_bpm,
	ROUND(AVG(danceability), 2) AS avg_danceability,
	ROUND(AVG(valence), 2) AS avg_valence,
	ROUND(AVG(energy), 2) AS avg_energy,
	ROUND(AVG(acoustiness), 2) AS avg_acoustiness,
	ROUND(AVG(instrumentalness), 2) AS avg_instrumentalness,
	ROUND(AVG(liveness), 2) AS avg_liveness,
	ROUND(AVG(speechiness), 2) AS avg_speechiness
FROM range_
WHERE streams IS NOT NULL
GROUP BY streams_range
ORDER BY COUNT(*);
/*The average metrics are higher across the board as the range of streams go up. The more played a song is, the higher bpm it has,
higher the danceability, valence and energy score it has. People tend to listen to a song more often if it matches those metrics stirctly 
according to these findings. There is also a strong negative correlation between the amount of times a song is played and the average
liveness score so this finding indicates that a vast majority of people dont prefer the presence of live performance elements in
songs. Also a strong negative correlation between the amount of times a song is played and the average speechiness score so this indicates
the less the amount of spoken words in a song, the more people will listen to it.*/

/*Analyzing the performance songs on different platforms*/
WITH range_ AS (
	SELECT *,
		CASE 
		WHEN streams BETWEEN 0 AND 100000000 THEN 'Below 100 Million'
		WHEN streams BETWEEN 100000000 AND 250000000 THEN '100 Million to 250 Million'
		WHEN streams BETWEEN 250000000 AND 500000000 THEN '250 Million to 500 Million'
		WHEN streams BETWEEN 500000000 AND 1000000000 THEN '500 Million to 1 Billion'
		WHEN streams BETWEEN 1000000000 AND 2000000000 THEN '1 Billion to 2 Billion'
		WHEN streams BETWEEN 2000000000 AND 3000000000 THEN '2 Billion to 3 Billion'
		WHEN streams > 3000000000 THEN 'Over 3 Billion'
		ELSE 'Null'
	END AS streams_range
	FROM spotify
	)
SELECT streams_range,
	released_year,
	ROUND(AVG(in_spotify_playlists), 2) AS avg_spotify_playlists,
	ROUND(AVG(in_spotify_charts), 2) AS avg_spotify_charts,
	ROUND(AVG(in_apple_playlists), 2) AS avg_apple_playlists,
	ROUND(AVG(in_apple_charts), 2) AS avg_apple_charts,
	ROUND(AVG(in_deezer_playlists), 2) AS avg_deezer_playlists,
	ROUND(AVG(in_deezer_charts), 2) AS avg_deezer_charts,
	ROUND(AVG(in_shazam_charts), 2) AS avg_shazam_charts
FROM range_
WHERE streams IS NOT NULL AND released_year > 2013
GROUP BY streams_range, released_year
ORDER BY avg_spotify_playlists DESC;
/*The most popular songs from the last few years have a bigger presence on the playlists across all platforms. The songs with the most streams 
have the most number of playlists in spotify, apple music and deezer. The chart presence and rank position are more prevelant for
songs with more streams as well.*/

/*Artists impact on streams*/
SELECT TOP 10 artist_name,
	COUNT(*) AS num_of_songs,
	FORMAT(ROUND(AVG(streams), 2), 'N') AS avg_streams
FROM spotify
GROUP BY artist_name
ORDER BY num_of_songs DESC;
/*The top 10 artists with the most number of hits are Taylor Swift, Weeknd, Bad Bunny, SZA, Harry Styles, Kendrick Lamar, Morgan Wallen,
Ed sheeran, BTS, and Drake/21 Savage. They all have an average of atleast 200,000,000 streams a song, meaning that they have a dedicated 
market where every single song that they release will have atleast a moderate amount of success with a chance of being a huge hit.*/