
library(dplyr)
library(lubridate)

df <- read.csv("your_file_path_here.csv")

df <- df %>%
  mutate(Dateofassessment = as.Date(Dateofassessment, format = "%m/%d/%y")) %>% #change format according to what is in your file
  filter(!is.na(Dateofassessment))

df <- df %>%
  arrange(ID, Dateofassessment) %>%
  group_by(ID) %>%
  mutate(visit = paste0("V", row_number())) %>%   #you can remove the "V" if you want
  ungroup()

print(df)

write.csv(df, "your_new_file_path_here.csv", row.names = FALSE)
            
