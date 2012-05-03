require 'refinerycms-core'

module Refinery
  module Djatoka
    class Engine < ::Rails::Engine
      include Refinery::Engine
      engine_name :refinery_djatoka
    end
  end
end