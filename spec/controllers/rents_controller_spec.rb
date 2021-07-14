# frozen_string_literal: true

require 'rails_helper'
require './spec/shared_contexts/shared_context'

describe RentsController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the users rents' do
      let!(:rents) { create_list(:rent, 3, user: user) }

      before do
        get :index, params: { id: user.id }
      end

      it 'responses with the users rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
