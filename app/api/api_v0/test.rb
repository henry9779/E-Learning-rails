# frozen_string_literal: true

module ApiV0
  class Test < Grape::API
    desc 'Ping pong'
    get :ping do
      { data: 'pong' }
    end
  end
end
