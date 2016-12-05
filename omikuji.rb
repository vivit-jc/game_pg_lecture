require 'dxruby'

number = 0
count = 0
font = Font.new(32)

Window.loop do
  number = rand(100) if count%30 == 0
  count += 1
  Window.drawFont(100,100,number.to_s,font)
end