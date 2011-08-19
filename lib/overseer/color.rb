module Overseer
  module Color
    extend self

    COLORS = {
      :red               =>   "\e[31m",
      :green             =>   "\e[32m",
      :bright_black      =>   "\e[90m",
      :bright_red        =>   "\e[91m",
      :bright_green      =>   "\e[92m",
    }

    COLORS.each do |color, ansi_code|
      define_method color do |string|
        "#{ansi_code}#{string}\e[0m"
      end
    end
  end
end
