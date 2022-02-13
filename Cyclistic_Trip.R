# load packages
library(tidyverse)
library(janitor)
library(lubridate)


# import data
trip_2019q3 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/Divvy_Trips_2019_Q3.csv"
)

trip_2019q4 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/Divvy_Trips_2019_Q4.csv"
)

trip_2020q1 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/Divvy_Trips_2020_Q1.csv"
)

trip_202004 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202004-divvy-tripdata.csv"
)

trip_202005 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202005-divvy-tripdata.csv"
)

trip_202006 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202006-divvy-tripdata.csv"
)

trip_202007 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202007-divvy-tripdata.csv"
)

trip_202008 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202008-divvy-tripdata.csv"
)

trip_202009 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202009-divvy-tripdata.csv"
)

trip_202010 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202010-divvy-tripdata.csv"
)

trip_202011 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202011-divvy-tripdata.csv"
)

trip_202012 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202012-divvy-tripdata.csv"
)

trip_202101 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202101-divvy-tripdata.csv"
)

trip_202102 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202102-divvy-tripdata.csv"
)

trip_202103 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202103-divvy-tripdata.csv"
)

trip_202104 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202104-divvy-tripdata.csv"
)

trip_202105 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202105-divvy-tripdata.csv"
)

trip_202106 <- read.csv(
  "D:/WIDI/Program/R/Capstone/Cyclistic-Trip-Data/202106-divvy-tripdata.csv"
)


# create a function to check the column names of each data frame
# using a function inspired by a code chunk created by LyzandeR in https://stackoverflow.com/questions/26566251/how-to-check-if-a-two-data-frame-have-the-same-column-names
col_names_checkers <- function(x, y){
  for (i in names(x)) {
    if (!(i %in% names(y))){
      print('Warning: names are not the same')
      break
    }
    else if (i == tail(names(y), n = 1)){
      print('All names are identical')
    }
  }
}

# check the names of all data frames one by one whether they are identical
# use the data frames from Q12020 as the pivot
col_names_checkers(trip_2020q1, trip_202004)
col_names_checkers(trip_2020q1, trip_2019q3)
col_names_checkers(trip_2020q1, trip_2019q4)
col_names_checkers(trip_2020q1, trip_202005)
col_names_checkers(trip_2020q1, trip_202006)
col_names_checkers(trip_2020q1, trip_202007)
col_names_checkers(trip_2020q1, trip_202008)
col_names_checkers(trip_2020q1, trip_202009)
col_names_checkers(trip_2020q1, trip_202010)
col_names_checkers(trip_2020q1, trip_202011)
col_names_checkers(trip_2020q1, trip_202012)
col_names_checkers(trip_2020q1, trip_202101)
col_names_checkers(trip_2020q1, trip_202102)
col_names_checkers(trip_2020q1, trip_202103)
col_names_checkers(trip_2020q1, trip_202104)
col_names_checkers(trip_2020q1, trip_202105)
col_names_checkers(trip_2020q1, trip_202106)

# the structures and column names are different between 2019 data and 2020 data onwards
# change the column names first in data frame in 2019 using the column names in 2020 onwards
trip_2019q3_2 <- rename(trip_2019q3,
                        ride_id = trip_id,
                        rideable_type = bikeid,
                        started_at = start_time,
                        ended_at = end_time,
                        start_station_name = from_station_name,
                        start_station_id = from_station_id,
                        end_station_name = to_station_name,
                        end_station_id = to_station_id,
                        member_casual = usertype
)

trip_2019q4_2 <- rename(trip_2019q4,
                        ride_id = trip_id,
                        rideable_type = bikeid,
                        started_at = start_time,
                        ended_at = end_time,
                        start_station_name = from_station_name,
                        start_station_id = from_station_id,
                        end_station_name = to_station_name,
                        end_station_id = to_station_id,
                        member_casual = usertype
)


# check if all have the same data frame structure so it can bind together
#
# inspired by a code chunk created by Sam Firke in https://stackoverflow.com/questions/53264993/comparing-column-names-in-r-across-various-data-frames
all_trip <- list(
  trip_2019q3_2,
  trip_2019q4_2,
  trip_2020q1,
  trip_202004,
  trip_202005,
  trip_202006,
  trip_202007,
  trip_202008,
  trip_202009,
  trip_202010,
  trip_202011,
  trip_202012,
  trip_202101,
  trip_202102,
  trip_202103,
  trip_202104,
  trip_202105,
  trip_202106
)

compare_df_cols(all_trip)
compare_df_cols_same(all_trip)

# apparently there are two columns with different data type
# also there are some columns that exist in 2019 data but does not exist in 2020 data. The opposite is also true.
# focus on the columns/variables that exist in all data frames
# check the structure of data frames with that are different
str(trip_2020q1)
str(trip_202106)

# the columns that have different data type are end_station_id and start_station_id

# now check if there are missing values in the variables

# create a function is.missing using the code chunk written by sbha in https://stackoverflow.com/questions/8317231/elegant-way-to-report-missing-values-in-a-data-frame
is_missing <- function(x){
  missing_strs <- c('', 'null', 'na', 'nan', 'inf', '-inf', '-9', 'unknown', 'missing')
  ifelse((is.na(x) | is.nan(x) | is.infinite(x)), TRUE,
         ifelse(trimws(tolower(x)) %in% missing_strs, TRUE, FALSE))
}

# now check for missing values in a data frame, say, trip_202004
summarize_all(trip_202004, ~sum(is_missing(.)))

# it seems that there are many values in variable start_station_name, start_station_id, end_station_name, and end_station_id that are left blank
# this limitation means that we can't get the full picture of where the bike rides started from and where they ended

# now to check if there are missing values in other variables in other data frames as well
# to know percentage-wise
summarize_all(trip_202106, ~sum(is_missing(.) / nrow(trip_202106)))
summarize_all(trip_202105, ~sum(is_missing(.) / nrow(trip_202105)))
summarize_all(trip_202104, ~sum(is_missing(.) / nrow(trip_202104)))
summarize_all(trip_202103, ~sum(is_missing(.) / nrow(trip_202103)))
summarize_all(trip_202102, ~sum(is_missing(.) / nrow(trip_202102)))
summarize_all(trip_202101, ~sum(is_missing(.) / nrow(trip_202101)))
summarize_all(trip_202012, ~sum(is_missing(.) / nrow(trip_202012)))
summarize_all(trip_202011, ~sum(is_missing(.) / nrow(trip_202011)))
summarize_all(trip_202010, ~sum(is_missing(.) / nrow(trip_202010)))
summarize_all(trip_202009, ~sum(is_missing(.) / nrow(trip_202009)))
summarize_all(trip_202008, ~sum(is_missing(.) / nrow(trip_202008)))
summarize_all(trip_202007, ~sum(is_missing(.) / nrow(trip_202007)))
summarize_all(trip_202006, ~sum(is_missing(.) / nrow(trip_202006)))
summarize_all(trip_202005, ~sum(is_missing(.) / nrow(trip_202005)))
summarize_all(trip_202004, ~sum(is_missing(.) / nrow(trip_202004)))

# it's clear that lots of missing data come from variables: start_station_name, start_station_id, end_station_name, and end_station_id
# although there are missing values in some variables, the number for individual month is not significant. It will be checked again later after all data has been aggregated.
# also, the only pattern that can be captured from the missing values percentage is that the percentage is significantly higher in the months since September 2020.
# this fact is interesting but it will not be explored further in this analysis as it's not the main concern and not included in the business task.

# now to make all the data frames have the same structure, change all variables with different data type

trip_2019q3_3 <- mutate(trip_2019q3_2, ride_id = as.character(as.integer(ride_id)), start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)), rideable_type = as.character(as.integer(rideable_type)))
trip_2019q4_3 <- mutate(trip_2019q4_2, ride_id = as.character(as.integer(ride_id)), start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)), rideable_type = as.character(as.integer(rideable_type)))
trip_2020q1_2 <- mutate(trip_2020q1, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202004_2 <- mutate(trip_202004, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202005_2 <- mutate(trip_202005, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202006_2 <- mutate(trip_202006, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202007_2 <- mutate(trip_202007, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202008_2 <- mutate(trip_202008, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202009_2 <- mutate(trip_202009, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202010_2 <- mutate(trip_202010, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))
trip_202011_2 <- mutate(trip_202011, start_station_id = as.character(as.integer(start_station_id)), end_station_id = as.character(as.integer(end_station_id)))

# create a list again that consists of all the manipulated data frames
all_trip_2 <- list(
  trip_2019q3_3,
  trip_2019q4_3,
  trip_2020q1_2,
  trip_202008_2,
  trip_202009_2,
  trip_202010_2,
  trip_202011_2,
  trip_202012,
  trip_202101,
  trip_202102,
  trip_202103,
  trip_202104,
  trip_202105,
  trip_202106
)

# check for inconsistencies in variables data type
compare_df_cols(all_trip_2)

# now that all variables that exist in all data frames have the same data type, it can be stacked
stack_trip <- bind_rows(
  trip_2019q3_3,
  trip_2019q4_3,
  trip_2020q1_2,
  trip_202004_2,
  trip_202005_2,
  trip_202006_2,
  trip_202007_2,
  trip_202008_2,
  trip_202009_2,
  trip_202010_2,
  trip_202011_2,
  trip_202012,
  trip_202101,
  trip_202102,
  trip_202103,
  trip_202104,
  trip_202105,
  trip_202106
)

# check for missing values percentage again
summarize_all(stack_trip, ~sum(is_missing(.) / nrow(stack_trip)))

# there are around 5-6% missing values in station variables and less than 1% in end_lat and end_lng variables. The stakeholder might want to know these facts.
# also the missing values in different variables are expected because of different column number and different variables, which can be deleted to make things easier and those variables are not needed for this analysis.

stack_trip_2 <- stack_trip %>% 
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, tripduration))

# now inspect the new data frames
colnames(stack_trip_2)
nrow(stack_trip_2)
dim(stack_trip_2)
head(stack_trip_2)
str(stack_trip_2)
summary(stack_trip_2)

# make sure that there are only 2 entries in the member variable
member_casual_n <- data.frame(table(stack_trip$member_casual))

# there are currently 4 types of membership in the stacked table, but there should be only 2 types of membership.
# Replace "Subscriber" with "member" and "Customer" with "casual".

stack_trip_3 <- stack_trip_2 %>% 
  mutate(member_casual = recode(member_casual,
                                "Subscriber" = "member",
                                "Customer" = "casual"))

# check again
member_casual_n <- data.frame(table(stack_trip_3$member_casual))

# it can be confirmed that there are only two entries in variable member_casual

# Curious about the number of stations:
start_station_name_n <- data.frame(table(stack_trip$start_station_name))
end_station_name_n <- data.frame(table(stack_trip$end_station_name))

# check whether all trips started and ended in the same day
# using codes from https://www.statmethods.net/input/dates.html
date_start <- as.Date(stack_trip_3$started_at)
date_end <- as.Date(stack_trip_3$ended_at)

day_start <- format(as.Date(date_start))
day_end <- format(as.Date(date_end))

identical(day_start, day_end)

# apparently there are some trips that started and ended in different day

# add another column in the table and name it trip_length and calculate the trip duration to put there
# using codes from https://stat.ethz.ch/R-manual/R-devel/library/base/html/difftime.html
stack_trip_3$trip_length <- difftime(stack_trip_3$ended_at, stack_trip_3$started_at)

# check the structure again
str(stack_trip_3)

# convert the data type into numeric
is.factor(stack_trip_3$trip_length)
stack_trip_3$trip_length <- as.numeric(as.character(stack_trip_3$trip_length))

# check if numeric
is.numeric(stack_trip_3$trip_length)

# check the general descriptive statistics of the trip length
summary(stack_trip_3$trip_length)

# Whoops, there are trips with negative trip_length. Moreover, there is also a trip with 9387024 seconds (108 days).
# I don't know what happened to the trip in the latter case, but for now I will just filter out the negative values.
# At the same time, I will filter out the trip that started from "HQ QH"

# from the guide, filter out the trips that started in "HQ QR" since it means that the bike is taken out of docks and checked for quality
stack_trip_4 <- stack_trip_3[!(stack_trip_3$start_station_name == "HQ QR" | stack_trip_3$end_station_name == "HQ QR" | stack_trip_3$trip_length < 0), ]

# check again for all stations
summary(stack_trip_4$trip_length)
start_station_name_n <- data.frame(table(stack_trip_4$start_station_name))
end_station_name_n <- data.frame(table(stack_trip_4$end_station_name))

# let's add additional variables of started_date and ended_date and separate the year, month, day, and day of the week for each variables.
# I think we only need the started_date, but I'm also curious with ended_date.

stack_trip_4$start_date <- as.Date(stack_trip_4$started_at)
stack_trip_4$start_day <- format(as.Date(stack_trip_4$start_date), "%d")
stack_trip_4$start_month <- format(as.Date(stack_trip_4$start_date), "%m")
stack_trip_4$start_year <- format(as.Date(stack_trip_4$start_date), "%Y")
stack_trip_4$start_day_of_week <- format(as.Date(stack_trip_4$start_date), "%A")

stack_trip_4$end_date <- as.Date(stack_trip_4$ended_at)
stack_trip_4$end_day <- format(as.Date(stack_trip_4$end_date), "%d")
stack_trip_4$end_month <- format(as.Date(stack_trip_4$end_date), "%m")
stack_trip_4$end_year <- format(as.Date(stack_trip_4$end_date), "%Y")
stack_trip_4$end_day_of_week <- format(as.Date(stack_trip_4$end_date), "%A")

# now compare members and casual users

aggregate(stack_trip_4$trip_length ~ stack_trip_4$member_casual, FUN = mean)
aggregate(stack_trip_4$trip_length ~ stack_trip_4$member_casual, FUN = median)
aggregate(stack_trip_4$trip_length ~ stack_trip_4$member_casual, FUN = max)
aggregate(stack_trip_4$trip_length ~ stack_trip_4$member_casual, FUN = min)

# it seems that on average casual users used the bike more than twice the member users.

# check the average ride time by each day for members and casual users
aggregate(stack_trip_4$trip_length ~ stack_trip_4$member_casual + stack_trip_4$start_day_of_week, FUN = mean)

# analyze ridership data by type and weekday
stack_trip_day_summary <- stack_trip_4 %>% 
  mutate(start_weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, start_weekday) %>% 
  summarize(start_number_of_rides = n(), trip_average_duration = mean(trip_length), trip_median_duration = median(trip_length)) %>% 
  arrange(member_casual, start_weekday)

# visualize the number of rides by type and day of the week
ggplot(data = stack_trip_day_summary, aes(x = start_weekday, y = start_number_of_rides, fill = member_casual)) + geom_col(position = "dodge")

# visualize the average duration by type and day of the week
ggplot(data = stack_trip_day_summary, aes(x = start_weekday, y = trip_average_duration, fill = member_casual)) + geom_col(position = "dodge")

# visualize the median duration by type and day of the week to avoid skewed data from outliers
ggplot(data = stack_trip_day_summary, aes(x = start_weekday, y = trip_median_duration, fill = member_casual)) + geom_col(position = "dodge")


# I want to know the difference in trend since the coronavirus pandemic
# using the code inspired by sbha in https://stackoverflow.com/questions/18115550/combine-two-or-more-columns-in-a-dataframe-into-a-new-column-with-a-new-name/40994869
stack_trip_month_summary <- stack_trip_4 %>% 
  mutate(start_month_year = paste(start_year, start_month, sep = "-")) %>% 
  group_by(start_month_year, member_casual) %>% 
  summarize(number_of_rides_in_a_month = n(), trip_average_duration_in_a_month = mean(trip_length), trip_median_duration_in_a_month = median(trip_length)) %>% 
  arrange(start_month_year, member_casual)
stack_trip_month_summary_2 <- stack_trip_4 %>% 
  mutate(start_month_year = paste(start_year, start_month, sep = "-")) %>% 
  group_by(start_month_year) %>% 
  summarize(number_of_rides_in_a_month = n(), trip_average_duration_in_a_month = mean(trip_length), trip_median_duration_in_a_month = median(trip_length)) %>% 
  arrange(start_month_year)


# visualize the result of the average duration
# using the code inspired by Jonathan Chang in https://stackoverflow.com/questions/1330989/rotating-and-spacing-axis-labels-in-ggplot2
ggplot(data = stack_trip_month_summary, aes(x = start_month_year, y = trip_average_duration_in_a_month, fill = member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggplot(data = stack_trip_month_summary_2, aes(x = start_month_year, y = trip_average_duration_in_a_month)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
# the average duration of the trip overall seems to be related to seasons.
# In November, December, and January, the trip duration tend to decline. It might be related to winter season. The trip duration is higher in other seasons.
# The trip duration doesn't seem to have apparent relationship with pandemic.

# let's check the median trip duration by month
ggplot(data = stack_trip_month_summary, aes(x = start_month_year, y = trip_median_duration_in_a_month, fill = member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggplot(data = stack_trip_month_summary_2, aes(x = start_month_year, y = trip_median_duration_in_a_month)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

# there is no apparent difference between mean and median metric for both casuals and members grouped by months.
# however there is much difference between mean and median metric for casuals and members grouped by months.
# This means that there must be outliers in the trip duration, that is, some users may use the bike too long.


# visualize the result of the number of trips in a month
ggplot(data = stack_trip_month_summary, aes(x = start_month_year, y = number_of_rides_in_a_month, fill = member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggplot(data = stack_trip_month_summary_2, aes(x = start_month_year, y = number_of_rides_in_a_month)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
# as expected, the number of trips tend to decline at the beginning of lockdown policy in the state, as shown in the chart.
# The number of trips is lower in April 2020 (beginning of lockdown) and February 2021 (subsequent wave of coronavirus in the US)

# I will focus on the difference in trip duration and trip number in weekdays and weekends.
ggplot(data = stack_trip_day_summary, aes(x = start_weekday, y = start_number_of_rides, fill = member_casual)) + geom_col(position = "dodge")
ggplot(data = stack_trip_day_summary, aes(x = start_weekday, y = trip_average_duration, fill = member_casual)) + geom_col(position = "dodge")

# Now group the mean duration, median duration, and number of trips grouped by starting station and membership type
stack_trip_station_summary <- stack_trip_4 %>% 
  mutate(start_weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, start_weekday, start_station_name) %>% 
  summarize(start_number_of_rides = n(), trip_average_duration = mean(trip_length), trip_median_duration = median(trip_length)) %>% 
  arrange(member_casual, start_weekday, start_station_name)
stack_trip_station_summary_2 <- stack_trip_4 %>% 
  mutate(start_weekday = wday(started_at, label = TRUE)) %>% 
  group_by(start_weekday, start_station_name) %>% 
  summarize(start_number_of_rides = n(), trip_average_duration = mean(trip_length), trip_median_duration = median(trip_length)) %>% 
  arrange(start_weekday, desc(start_number_of_rides))

# Plot the total number of rides grouped by day of the week and starting station in a heatmap chart
# first of all convert the long data into short data
# also filter out the station that has number of rides below 6000 in one day and those from unknown station as well
# code inspired from Giovanni Colitti in https://stackoverflow.com/questions/59327101/pivot-wider-does-not-seem-to-work-with-missing-values-how-to-turn-spread-into
stack_trip_station_summary_2_number_of_rides <- stack_trip_4 %>% 
  mutate(start_weekday = wday(started_at, label = TRUE)) %>% 
  group_by(start_weekday, start_station_name) %>% 
  summarize(start_number_of_rides = n()) %>% 
  ungroup() %>% 
  pivot_wider(names_from = start_weekday,
              values_from = start_number_of_rides,
              names_repair = "minimal") %>% 
  mutate(total_ride = Sun + Mon + Tue + Wed + Thu + Fri + Sat) %>% 
  filter((Sun > 6000 | Mon > 6000 | Tue > 6000 | Wed > 6000 | Thu > 6000 | Fri > 6000 | Sat > 6000) & !(start_station_name == "")) %>% 
  arrange(desc(total_ride))

# plot it in a heatmap chart
# first convert the data to long, code inspired by https://tidyr.tidyverse.org/reference/pivot_longer.html
stack_trip_station_summary_2_number_of_rides_long <- stack_trip_station_summary_2_number_of_rides %>% 
  pivot_longer(!start_station_name, names_to = "day_of_the_week", values_to = "rides_number")

# I don't know the easier way to do this so I'm going to replace the values one by one. This is so that the resulting heatmap is ordered properly
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Mon"] <- "(1) Monday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Tue"] <- "(2) Tuesday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Wed"] <- "(3) Wednesday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Thu"] <- "(4) Thursday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Fri"] <- "(5) Friday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Sat"] <- "(6) Saturday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "Sun"] <- "(7) Sunday"
stack_trip_station_summary_2_number_of_rides_long$day_of_the_week[stack_trip_station_summary_2_number_of_rides_long$day_of_the_week == "total_ride"] <- "(8) Total Ride in one Week"

# now plot into heatmap
# codes inspired from https://jcoliver.github.io/learn-r/006-heatmaps.html
ggplot(stack_trip_station_summary_2_number_of_rides_long, aes(x = day_of_the_week, y = start_station_name, fill = rides_number)) +
  geom_tile() +
  scale_x_discrete(position = "top") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0)) +
  scale_fill_gradient(name = "rides_number",
                      low = "#FFFFFF",
                      high = "#012345")

# From the heatmap the stakeholder can prioritize to put ads in the stations with darker colors.

# Try creating histogram from grouped data
# codes taken from https://stackoverflow.com/questions/34774120/set-number-of-bins-for-histogram-directly-in-ggplot
stack_trip_5 <- stack_trip_4
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Monday"] <- "(1) Monday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Tuesday"] <- "(2) Tuesday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Wednesday"] <- "(3) Wednesday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Thursday"] <- "(4) Thursday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Friday"] <- "(5) Friday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Saturday"] <- "(6) Saturday"
stack_trip_5$start_day_of_week[stack_trip_5$start_day_of_week == "Sunday"] <- "(7) Sunday"


ggplot(data = stack_trip_5, aes(x = trip_length)) +
  geom_histogram(bins = 120, fill = "white", color = "black") + 
  xlim(0, 4500) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  facet_grid(start_day_of_week ~ member_casual)


# observation:
# 1) The number of trips done by casuals tend to lower on weekdays and higher on weekends. This might suggest that members paid annual membership because they use the bike for work.
# 2) The number of trips done by casuals on weekdays are around half of those done by members. This might suggest that some part of casuals don't really need the bike for work on weekdays. That's probably why they prefer casual membership.
# 3) The number of trips done by casuals on weekdays are almost the same as those done by members on weekends. This might suggest that casuals use bike for recreational purpose.
# 4) The average trip duration done by casuals by day are around three times as much as those done by members.
# 5) Saturday and Sunday are the most popular day for bike riding for members since the average trip duration tend to get higher on these two days.
# 6) Meanwhile Saturday is the most popular day for bike riding for casuals since the average trip duration is peaked on Saturday.
# 7) From the histogram, it's clear that the majority of members only use the bike for less than 20 minutes. Meanwhile the histogram of trip length for casuals have significantly fatter tail, with positive skewness.


# recommendation:
# 1) if the stakeholders are doing ads in person, better doing it on weekends since the trip number from casuals on weekends are almost as high as those of members.
# 2) if the stakeholders want to get as much casuals to convert into members as possible, they might consider offering membership of bike use on weekends only with different pricing from regular membership.
# 3) if the stakeholders want to get as much casuals to convert into members as possible, they might also consider limit the duration of bike use for casuals, say, the first 30 minutes (1800 seconds), and charging additional fee for trip more than 30 minutes, while not limiting the duration for members. This should push the casuals to consider annual membership, since the average trip duration of casuals are around 2500 seconds (42 minutes). This is also supported by the histogram that casuals use the bike for significantly longer than members.


# Next step: do the same analysis grouped by stations. The ads or promotion done in person can be focused on stations with the most bike use. (Use heat map chart)
# Next step: use median instead of mean since mean might be skewed.