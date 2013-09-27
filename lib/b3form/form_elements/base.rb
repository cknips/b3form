module B3Form
  module FormElements
    class Base
      attr_reader :builder

      def initialize(builder)
        @builder = builder
      end
    end
  end
end
