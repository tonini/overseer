module Overseer
  module Dsl
    def test(desc, &block)
      Overseer.build_test(desc, &block)
    end
  end
end
