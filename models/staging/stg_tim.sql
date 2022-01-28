
select timestamps as Timestamp, EXTRACT(HOUR FROM timestamp) AS Hour,
          EXTRACT(MINUTE FROM timestamps) AS Minute,
          EXTRACT(SECOND FROM timestamps) AS Second, 
          EXTRACT(YEAR FROM timestamps) AS year, 
          DATE(timestamps) as Date,
          category as class,
          col_count as Count,
          location  as Branch          
           FROM {{ source('public','on_timhortons_1903_9_maidstone') }}

