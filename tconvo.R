library(httr)

load("twitter2.RData")
cap <- subset(capitol,is.na(in_reply_to_user_id))
scap <- subset(cap,public_metrics$reply_count>=100 & public_metrics$reply_count <= 500)
D <- dim(scap)[1]

# Replace the bearer token below with your own from the academic research project in your Twitter developer portal
bearer_token <- "AAAAAAAAAAAAAAAAAAAAAL7GQQEAAAAANGHkKf7etYb1JzDEDF%2FDc3Me8Go%3D0wqacHBN83OUw6MDS3aq8ADY5vRV11lKZKX1SbN1RCa8mHmseG" 

headers = c(
  `Authorization` = sprintf('Bearer %s', bearer_token)
)

data <- NULL

for(i in 1:D)
{
	cid = scap[i,"conversation_id"]
	q = paste0("conversation_id",":",cid)

params = list(
  `query` = q,
  `max_results` = '500',
  `start_time` = '2021-01-06T00:00:00Z',
  `tweet.fields` = 'created_at'
)

response <- httr::GET(url = 'https://api.twitter.com/2/tweets/search/all', httr::add_headers(.headers=headers), query = params)

fas_body <-
  content(
    response,
    as = 'parsed',
    type = 'application/json',
    simplifyDataFrame = TRUE
  )

	new <- fas_body$data
	new$convo <- cid
	data <- rbind(data,new[c("created_at","id","text","convo")])

	Sys.sleep(4)

}

save.image("tconvo.RData")

