# Cyclistic_Trip

This project was carried to complete the Google Data Analytics Certification on Coursera.

## Tasks:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to inﬂuence casual riders to become members?

## Stakeholders
1. Lily Moreno, the director of marketing and (supposedly) the manager, who is responsible for the development of campaigns and initiatives to promote bike-sharing program.
2. Cyclistic marketing analytics team, who are responsible for collecting, analyzing, and reporting data that helps guide the Cyclistic marketing strategy.
3. Cyclistic executive team, who will decide whether to approve the recommended marketing program.

## Objectives:
1. A stakeholder believes that maximizing the number of annual members will be key to future growth. Therefore, converting casual riders into annual members is the priority here.
2. The data analyst should design marketing strategies aimed at converting casual riders into annual members, preferably using the digital media.

## Data Source and Tools
1. The data source was downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
2. The data is analyzed using R with packages: tidyverse, janitor, and lubridate.

## Results
![01_Number_of_rides_trend_day_of_the_week](https://user-images.githubusercontent.com/87055709/154297464-297c3194-34eb-4f50-9d83-f40622a3e495.png)

![02_Average_duration_trend_day_of_the_week](https://user-images.githubusercontent.com/87055709/154297484-79a04058-a3c8-4a2d-a1c9-2660fb68e765.png)

![03_Median_duration_trend_day_of_the_week](https://user-images.githubusercontent.com/87055709/154297504-fd9c914d-2f14-458d-b410-0d8f5cbef016.png)

![04_Average_duration_trend_by_month_membership](https://user-images.githubusercontent.com/87055709/154297539-433f3e78-e0f1-4c81-8a82-a46a9be7ff20.png)

![05_Average_duration_trend_by_month](https://user-images.githubusercontent.com/87055709/154297550-e31d4710-87ee-45d6-912c-61df8ef4483c.png)

![06_Median_duration_trend_by_month_membership](https://user-images.githubusercontent.com/87055709/154297565-a7b625b8-b73d-484f-b507-66402f05a8fd.png)

![07_Median_duration_trend_by_month](https://user-images.githubusercontent.com/87055709/154297581-04e5255a-f795-473c-b8dd-c27058e81bbc.png)

![08_Number_rides_trend_by_month_membership](https://user-images.githubusercontent.com/87055709/154297587-8d12030d-228b-4d5e-b772-6ef2a18b3080.png)

![09_Number_rides_trend_by_month](https://user-images.githubusercontent.com/87055709/154297603-1a1253b8-f796-4f3b-afe6-0aac25e3611f.png)

![10_Number_rides_station_most_uses](https://user-images.githubusercontent.com/87055709/154297614-61ebd50d-85f6-473c-831f-a45dfb6a2c20.png)

![11_Distribution_trip_duration](https://user-images.githubusercontent.com/87055709/154297630-ec5d244b-63c0-4a28-a834-f7d4b08a0b2f.png)



## Observations
From the visualizations above, it can be observed that:
1. The number of trips done by casuals tend to lower on weekdays and higher on weekends. This might suggest that members paid annual membership because they use the bike for work.
2. The number of trips done by casuals on weekdays are around half of those done by members. This might suggest that a proportion of casuals don't really need the bike for work on weekdays. That's probably why they prefer casual membership.
3. The number of trips done by casuals on weekdays are almost the same as those done by members on weekends. This might suggest that casuals use bike for recreational purpose over trip to work.
4. The average trip duration by casuals by day are around three times as much as those done by members.
5. Saturday and Sunday are the most popular day for bike riding for members since the average trip duration tend to get higher on these two days.
6. On the other hand, Saturday is the most popular day for bike riding for casuals since the average trip duration is peaked on Saturday.
7. From the histogram, it's clear that the majority of members only use the bike for less than 20 minutes. Meanwhile, the histogram of trip length for casuals have significantly fatter tail, that is, positively skewed.

## Recommendations
Considering the observations above, recommendations to the stakeholders are as follows:

1. If the stakeholders are doing ads in person, it is better doing it on weekends and outside winter seasons since the trip number from casuals on weekends and outside winter seasons are almost as high as those of members.
2. If the stakeholders want to get as much casuals to convert into members as possible, they might consider offering membership of bike use on weekends only with different (slightly lower) pricing from regular annual membership.
3. If the stakeholders want to get as much casuals to convert into members as possible, they might also consider limit the duration of bike use for single-ride pass, say, for the first 30 minutes (1800 seconds), and charging additional fee for trip more than 30 minutes, while not limiting the duration for members. This should push the casuals to consider full-day passes, since the average trip duration of casuals are around 2500 seconds (42 minutes). To convert full-day passes further into annual membership, the stakeholder might want to consider different (higher) pricing on full-day passes on weekends.
4. Although the task only requires me to provide 3 recommendation, if possible I would like to add one recommendation regarding the use of digital data. To understand the behaviors of the riders, the stakeholders might want to require the riders to install a mobile phone app by which Cyclistic can notify the users about any promotion or advertisements. The stakeholders might also want to install GPS trackers on the bikes to understand the riders better. I don't know whether the company has implemented this, but if not it might be useful to consider if it's not a violation of privacy. Also, the stakeholders might want to conduct marketing using social media, such as free-ride for users who post winning photo (uploaded in the users’ social media account) taken in various spots in the city. This will let the stakeholders identify which spots are better for marketing purpose.

## Personal Takeaways
It would be more interesting if I have the more completed data in order to:
* Distinguish single-ride passes from full-day passes in the datasets
* Observe how much the rider had to pay for every ride in the past into the datasets
* Add the riding data geolocation to understand the users' behaviors better.
