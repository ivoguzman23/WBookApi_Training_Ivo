# frozen_string_literal: true

class OpenLibraryWorker
  include Sidekiq::Worker

  def perform(bibkeys)
    OpenLibraryService.execute(bibkeys)
  end
end
