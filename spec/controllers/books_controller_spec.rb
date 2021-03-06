# frozen_string_literal: true

require 'rails_helper'
require './spec/shared_contexts/shared_context'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    context 'When get all the books' do
      let!(:books) { create_list(:book, 5) }

      it 'responds with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When get a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responds with the book json' do
        expected = book.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a book does not exist' do
      let!(:book) { create(:book, id: 1) }

      before do
        get :show, params: { id: 5 }
      end

      it 'responds with 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
