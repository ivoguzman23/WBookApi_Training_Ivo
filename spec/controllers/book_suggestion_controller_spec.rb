# frozen_string_literal: true

require 'rails_helper'
require './spec/shared_contexts/shared_context'

RSpec.describe BookSuggestionController, type: :controller do
  describe 'GET #index' do
    context 'When get all book suggestions' do
      let!(:book_suggestion) { build(:book_suggestion) }
      subject do
        get :index
      end

      it 'responds all the book suggestions json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'When create a book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion) } 
      let!(:params) do 
        {
          "bookSuggestion": {
              "author": book_suggestion.author,
              "title": book_suggestion.title,
              "link": book_suggestion.link,
              "publisher": book_suggestion.publisher,
              "year": book_suggestion.year
          }
        } 
      end

      before do
        post :create, params: params
      end

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When the author is nil' do
      let!(:book_suggestion) { build(:book_suggestion, author: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end

    context 'When the link is nil' do
      let!(:book_suggestion) { build(:book_suggestion, link: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end

    context 'When the title is nil' do
      let!(:book_suggestion) { build(:book_suggestion, title: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end
  end
end
