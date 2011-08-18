module Overseer
  module Color
    extend self

    COLORS = {
      :black             =>   "\e[30m",
      :red               =>   "\e[31m",
      :green             =>   "\e[32m",
      :yellow            =>   "\e[33m",
      :blue              =>   "\e[34m",
      :magenta           =>   "\e[35m",
      :cyan              =>   "\e[36m",
      :white             =>   "\e[37m",
      :bright_black      =>   "\e[90m",
      :bright_red        =>   "\e[91m",
      :bright_green      =>   "\e[92m",
      :bright_yellow     =>   "\e[93m",
      :bright_blue       =>   "\e[94m",
      :bright_magenta    =>   "\e[95m",
      :bright_cyan       =>   "\e[96m",
      :bright_white      =>   "\e[97m"
    }

    COLORS.each do |color, ansi_code|
      define_method color do |string|
        "#{ansi_code}#{string}\e[0m"
      end
    end
  end
end
