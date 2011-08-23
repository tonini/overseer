module Overseer
  module Dsl
    def test(desc, &block)
      Overseer.build_test(desc, &block)
    end

    def before(&block)
      Overseer.build_before(&block)
    end

    def after(&block)
      Overseer.build_after(&block)
    end
  end
end
