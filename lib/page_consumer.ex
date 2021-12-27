defmodule PageConsumer do
  use GenStage
  require Logger

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state)
  end

  def init(intital_state) do
    Logger.info("PageConsumer init")

    sub_opts = [{PageProducer, min_demand: 0, max_demand: 1}]
    {:consumer, intital_state, subscribe_to: sub_opts}
  end

  def handle_events(events, _from, state) do
    Logger.info("PageConsumer received #{inspect(events)}")

    # Pretending we're scraping webpages
    Enum.each(events, &(FakeScrapper.work(&1)))

    {:noreply, [], state}
  end
end
