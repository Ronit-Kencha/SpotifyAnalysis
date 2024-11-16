# SpotifyAnalysis
This repository contains analysis of a dataset that provides insights on the most famous songs on Spotify till 2023 and contains information such as streaming statistics, playlists presence, platforms presence, and various audio features such as danceability, valence, energy, bpm, acoustiness, instrumentalness, liveness, and speechiness. Analysis is conducted on MS SQL Server to explore findings on this data such as potential patterns between audio features and song popularity, platform presence, and other factors to see if there are any factors that come into play to make a song more popular not only on Spotify, but other platforms.

![spotify_github](https://github.com/user-attachments/assets/b28a6d0c-9114-41fe-b42f-c1ad3da47eb0)

**RESULTS** 

1) There is a strong negative correlation between the amount of times a song is played and the average liveness score so this finding indicates that a vast majority of people dont prefer the presence of live performance elements in songs.
2) There is also a strong negative correlation between the amount of times a song is played and the average speechiness score so this indicates the less the amount of spoken words in a song, the more people will listen to it.
3) The most popular songs from the last few years have a bigger presence on the playlists across all platforms. The songs with the most streams have the most number of playlists in spotify, apple music and deezer. The chart presence and rank position are more prevelant for songs with more streams as well.
4) The top 10 artists with the most number of hits are Taylor Swift, Weeknd, Bad Bunny, SZA, Harry Styles, Kendrick Lamar, Morgan Wallen, Ed sheeran, BTS, and Drake/21 Savage. They all have an average of atleast 200,000,000 streams a song, meaning that they have a dedicated market where every single song that they release will have atleast a moderate amount of success with a chance of being a huge hit.

**TECHNIQUES USED**
1. Analyzed the dataset using MS SQL server for a thorough and in-depth exploration of potential trends and patterns
2. Used CTE to create ranges within data for simpler analysis
3. Downloaded dataset from Kaggle to a .txt file and used SSIS for transformation and loading the dataset into SQL server.
