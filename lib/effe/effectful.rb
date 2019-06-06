module Effe
  module Effectful
    class Some
      include Effectful

      attr_reader :value, :effects

      def initialize(value, effects)
        @value = value
        @effects = effects
      end

      def bind(&block)
        effectful = block.call(self)
        value = effectful.value
        new_effects = effects + effectful.effects
        Effectful(value, new_effects)
      end
    end

    def Effectful(value, effects)
      Some.new(value, effects)
    end
  end
end
