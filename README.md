# Fake scrapper

Fake service that scrapes data from web pages—normally an intensive task, dependent on system resources and a reliable network connection. The goal here is to be able to request a number of URLs to be scraped, and have a GenStage data pipeline take care of the workload.

This is the result of following the book _Concurrent Data Processing in Elixir Fast, Resilient Applications with OTP, GenStage, Flow, and Broadway_ by Svilen Gospodinov

## Producer

The scraper will **scrape data from web page**s. At the beginning of our pipeline there's a producer stage that will be responsible for what web pages will be scraped. In other words, it will produce URLs for consumers interested in getting web pages to scrape.

## Handling demand

Demand can be changed on the `PageConsumer` module.

By configuring demand two things can be controlled: `max_demand` will set the maximum number of events the consumer can ask for, and `min_demand` will determine the lowest number of events available to the consumer before it can ask for more.

If we set `min_demand` to 0 and `max_demand` to 3, we are ensuring that the
consumer will take at least one event when it is available, up to three at a time.

If we set `max_demand` to 1 the events will be requested one by one, so it won't be processed in batches.

##### It all depends on the configuration that works best for the specific project

## How to interact with this project

Run the app with `iex -S mix`. The consumer will send demand as soon as it is initialized.

```Elixir
pages = ["google.com", "facebook.com", "apple.com", "netflix.com", "amazon.com"]

PageProducer.scrape_pages(pages)
```

We can see that `PageConsumer` immediately received the first three pages, which took a bit of time to process, judging by the timestamps. Since only two pages were available next, the consumer realized that it has capacity for one more page, so it immediately issued demand for another page, while starting work on the other two.
