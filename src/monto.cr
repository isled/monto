require "./monto/exceptions"
require "./monto/environment"
require "./monto/server/**"

# TODO: Write documentation for `Monto`
module Monto
  include Monto::Environment
  # TODO: Put your code here
  def self.ted
    puts "shuai"
  end
end
Monto::Server.start
