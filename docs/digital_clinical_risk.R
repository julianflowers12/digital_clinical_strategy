## digital clinical strategy

library(myScrapers); library(pdftools); library(tidyverse)

url <- "https://www.nhsx.nhs.uk/key-tools-and-info/digital-clinical-safety-strategy/"

dcs <- get_page_text(url)

## DCB0129: Clinical Risk Management: its Application in the Manufacture of Health IT Systems

url1 <- "https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0129-clinical-risk-management-its-application-in-the-manufacture-of-health-it-systems"

dcb129 <- get_page_docs(url1)

dcb129 <- paste0("https://digital.nhs.uk", dcb129)

dcb129_text <- map(dcb129, pdf_text)


##  DCB0160: Clinical Risk Management: its Application in the Deployment and Use of Health IT Systems

url2 <- "https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0160-clinical-risk-management-its-application-in-the-deployment-and-use-of-health-it-systems"
dcb160 <- get_page_docs(url2)

dcb160 <- paste0("https://digital.nhs.uk", dcb160)


dcb160_text <- map(dcb160, pdf_text)

dcb129_text %>%
  enframe() %>%
  unnest("value") %>%
  mutate(value = str_squish(value)) %>%
  View()

## data saves lives

url3 <- "https://www.gov.uk/government/publications/data-saves-lives-reshaping-health-and-social-care-with-data-draft/data-saves-lives-reshaping-health-and-social-care-with-data-draft"

data_saves_lives <- get_page_text(url3) %>%
  enframe() %>%
  unnest("value")



