module Destroyer
  class Settings < Hashr
    extend Hashr::EnvDefaults

    HOST = 'localhost:3000'

    define \
      name: 'Destroyer',
      host: HOST
  end

  def self.settings
    @settings ||= Settings.new
  end
end
