# frozen_string_literal: true

class RentPolicy < ApplicationPolicy
  def index?
    return true if user.present? && user == record[0].user
  end
end
