# frozen_string_literal: true

module Rock
  class HardWorker
    include Sidekiq::Worker

    def perform(*args)
      # Do something
    end
  end
end
