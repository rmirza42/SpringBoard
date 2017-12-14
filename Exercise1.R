
Exercise 1 code:

> datafr1 <- tbl_df(as.data.frame(refine_original))
> datafr1$company <- tolower(datafr1$company)
> datafr1$company <- gsub(".*ps.*", "philips", datafr1$company)
> datafr1$company <- gsub(".*ak.*", "akzo", datafr1$company)
> datafr1$company <- gsub(".*uni.*", "unilever", datafr1$company)
> datafr1 <- separate(datafr1, `Product code / number`, c("product_code","product_number"), sep = "-")
> datafr1 <- datafr1 %>% select(company:name) %>% 
            mutate(
               product_category = case_when(      
                    product_code == "p" ~ "Smartphone",   
                    product_code == "x" ~ "Laptop",   
                    product_code == "v" ~ "TV",   
                    product_code == "q" ~ "Tablet"   
                )
           )
> datafr1 <- unite(datafr1, "full_address", address, city, country, sep =",", remove = FALSE)
> for(t in unique(datafr1$company)) {
 datafr1[paste("company",t,sep="_")] <- ifelse(datafr1$company==t,1,0)      
 }
> for(t in unique(datafr1$product_category)) {
 datafr1[paste("product",t,sep="_")] <- ifelse(datafr1$product_category==t,1,0)
       }