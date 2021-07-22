# frozen_string_literal: true

class OpenLibraryController < ApplicationController
  include AsyncRequest::ApplicationHelper

  def book_info
    id = execute_async(OpenLibraryService, params[:bibkeys])
    render json: { id: id, url: async_request.job_url(id) }, status: :accepted
  end
end
