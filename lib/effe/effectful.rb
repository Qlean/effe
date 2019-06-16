module Effe
  module Effectful
    def Effectful(value, effects)
      Aware.new(value, effects)
    end
  end
end

# class A
#   include Effe::Effectful.for(:call)
#
#   register_effects [:callbacks]
#
#   def call
#     val
#   end
# end
#
# class B
#   include Effe::Effectful
#
#   def call
#     Effectful(val, [:callbacks])
#   end
# end
