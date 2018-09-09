library(data.table)

df_italy$DATE <- as.POSIXct(df_italy$DATE)
colnames(df_italy)[5] <- "Team"

# keep only rows of data with matches in mangers
df_mergeed <- df_italy %>%
  inner_join(manager) %>%
  filter(DATE > From & DATE < To) # %>%
#  filter( ang > angle_begin & ang < angle_end)


glimpse(df_italy)
glimpse(manager)

glimpse(df_mergeed)
# preparing for second manager team 
colnames(df_mergeed)[5] <- "HTeam"
colnames(df_mergeed)[6] <- "Team"
colnames(df_mergeed)[12] <- "Hmanager"

# doing the second manager join
df_merged <- df_mergeed %>%
  inner_join(manager) %>%
  filter(DATE > From & DATE < To)

View(df_merged)

# subseting and preparing for second join 
help("subset.data.frame")
df_mergeed <- subset(df_mergeed, select = -c(From:born))
View(df_mergeed)

#second join

df_merged <- df_mergeed %>%
  inner_join(manager) %>%
  filter(DATE > From & DATE < To)

glimpse(df_merged)
colnames(df_merged)

#pretifying the exisitng merged data 

df_merged <- subset(df_merged, select = -c(From:born))

glimpse(df_merged)

colnames(df_merged)[which(names(df_merged) == "Manager")] <- "Amanager"
