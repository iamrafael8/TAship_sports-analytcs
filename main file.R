library(dplyr)
library(tidyr)
library(tidyr)


italy = f_data_sm[COUNTRY = "Italy",]
managers = read.csv("/Users/iamrafael8/Library/Containers/com.apple.mail/Data/Library/Mail Downloads/90F4B972-2A9E-4243-8E1F-00903EEBFABA/managers_df.csv")
head(managers)
help(dplyr)

library(tidyr)

#starting with italy filtering
df_italy <- f_data_sm %>%
  filter(COUNTRY == "Italy")
glimpse(df_italy)


#processing the managers df


glimpse(managers)

managers = separate(managers, Period, into = c("From", "To"), sep = "-")
manager = managers
manager$From = strptime(managers$From, "%d/%m/%Y")
manager$To = strptime(managers$To, "%d/%m/%Y")
glimpse(manager)


manager$From <- as.POSIXct(manager$From)
manager$To <- as.POSIXct(manager$To)


#adjusting tht team names 
#checking the number of teams
length(unique(df_italy$HOMETEAM))
length(unique(df_italy$AWAYTEAM))
length(unique(manager$Team))


unique(df_italy$HOMETEAM)

manager_93 <- manager %>%
  filter(From > "1993-08-29")


sort(unique(manager$Team))
sort(unique(df_italy$HOMETEAM))

# starting with patterns
manager$Team <- gsub("-calcio", "", manager$Team)
manager$Team <- gsub("calcio-", "", manager$Team)
manager$Team <- gsub("-fc", "", manager$Team)
manager$Team <- gsub("fc-", "", manager$Team)
manager$Team <- gsub("ac-", "", manager$Team)
manager$Team <- gsub("as-", "", manager$Team)
manager$Team <- gsub("us-", "", manager$Team)
manager$Team <- gsub("-cfc", "", manager$Team)
manager$Team <- gsub("ssc-", "", manager$Team)
manager$Team <- gsub("-roma", "", manager$Team)
manager$Team <- gsub("-roma", "", manager$Team)
manager$Team <- gsub("-1913", "", manager$Team)
manager$Team <- gsub("-1908", "", manager$Team)

# finishing with eceptions
manager$Team[manager$Team == "spal-2013-ferrara"] <- "Spal"
manager$Team[manager$Team == "hellas-verona"] <- "Verona"
manager$Team[manager$Team == "chievo-verona"] <- "Chievo"


#making everything capital letter
manager$Team <- manager$Team %>% sapply(stringr::str_to_title)





#checking the data cleaing


glimpse(manager)


colnames(df_italy)[5] <- "Team"

head(df_italy)


#BIG COMMENT  START 
#
#
# The joining of the data has been in the supporting inner join file 
#
#
#BIG COMMENT END

df_merged







