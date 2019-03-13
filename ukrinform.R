---
  title: "Scraper Example"
output: html_document
---
  
  ```{r setup, include=FALSE}
#install.packages('rvest')
library(rvest)
```

### web-scaraper for news site
Довідкова інформація
css-selectors: https://www.w3schools.com/cssref/css_selectors.asp

Нагадую! Конструкція у формі

data %>% function1() %>% function2() 

це конвейер, 1. який бере дані (об'єкт що розташований ліворуч),  2. трансформує їх за допомогою першої функції, 3. і результат передає в другу функцію (function2), яка їх знов таки трансформує у щось нове - так ми отримуємо кінцевий результат. У подібних конвеєрах кількість функцій, що перетворюють(трансформують дані) може бути довільною.
                                  
                                  ```{r get}
                                  url <- "https://www.ukrinform.ua/"
                                  content <- read_html(url)
                                  ### Title
                                  title <- content %>% html_nodes('div.othersBody div a') %>% html_text()
                                  ### Link to article
                                  # g! rvest href attribute (how to find function we need to extract attribute of a tag)
                                  link <- content %>% html_nodes('div.othersBody div a') %>% html_attr('href')
                               
                                  ```
                                  
                                  
                                  #### TODO: create dataframe from results and save it to csv file
                                  
                                  ```{r}
                                  df <- data.frame(headline = title, url = link)
                                  write.csv(df, 'ukrinform_news.csv')
                                  ```
                                  