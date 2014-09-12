class ApiKeysController < ApplicationController
  def create
    @key = ApiKey.create
    respond_to do |format|
      format.js
    end
  end
end
