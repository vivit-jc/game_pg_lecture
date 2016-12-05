require 'dxruby'

CASTLE = Image.load('castle.png')
FOREST = Image.load('forest.png')
MOUNTAIN = Image.load('mountain.png')
LAND = Image.load('land.png')
HERO = Image.load('hero.png')
map = []
tile = [LAND, FOREST, MOUNTAIN, CASTLE]

open('map.txt') do |file|
  while l = file.gets
    map << l.strip.split('')
  end
end

x = 0
y = 0

Window.loop do
  20.times do |i|
    15.times do |j|
      Window.draw(i*32, j*32, tile[map[j][i].to_i])
    end
  end
  x += Input.x
  y += Input.y
  Window.draw(x, y, HERO)

end