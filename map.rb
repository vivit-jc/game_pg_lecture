require 'dxruby'

#四方を向くようにする
class Sprite
  attr_accessor :direction

  def move(x,y)
    self.x += x
    self.y += y
    if x > 0 
      @direction = 2
    elsif x < 0 
      @direction = 1
    elsif y > 0 
      @direction = 0
    elsif y < 0 
      @direction = 3
    end
    self.image = HERO[@direction]
 end

end

CASTLE = Image.load('img/castle.png')
FOREST = Image.load('img/forest.png')
MOUNTAIN = Image.load('img/mountain.png')
LAND = Image.load('img/land.png')
HERO = Image.load_tiles('img/hero.png',1,4)
CAVE = Image.load('img/cave.png')
CAVE_MAP = Image.load_tiles('img/cave_map.png',3,4)

map = {:field => [], :cave => []}
current_map = :field
tile = {:field => [LAND, FOREST, MOUNTAIN, CASTLE], :cave => CAVE_MAP}

open('field.txt') do |file|
  while l = file.gets
    map[:field] << l.strip.split('')
  end
end

open('cave.txt') do |file|
  while l = file.gets
    map[:cave] << l.strip.split('')
  end
end

hero = Sprite.new(0,0)
hero.direction = 0
cave_entrance = Sprite.new(300,200,CAVE)

Window.loop do
  20.times do |i|
    15.times do |j|
      Window.draw(i*32, j*32, tile[current_map][map[current_map][j][i].to_i])
    end
  end
  cave_entrance.draw
  hero.move(Input.x,Input.y)
  hero.draw
  if hero === cave_entrance
    current_map = :cave
    hero.x = 320
    hero.y = 480
  end

end