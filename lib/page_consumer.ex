defmodule FakeScrapper.PageConsumer do
  use GenStage
  require Logger

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state)
  end

  def init(intital_state) do
    Logger.info("PageConsumer init")
    {:consumer, intital_state, subscribe_to: [PageProducer]}
  end

  def handle_events(events, _from, state) do
    Logger.info("PageConsumer received #{inspect(events)}")

    # Pretending we're scraping webpages
    Enum.each(events, fn _page -> FakeScrapper.work() end)

    {:noreply, [], state}
  end
end
