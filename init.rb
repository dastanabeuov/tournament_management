#Подклчение всех файлов
#Запуск программы
#Команда для запуска - terminal(ruby init.rb)
require_relative 'game'
require_relative 'interface'
require_relative 'team'

interface = Interface.new
game = Game.new(interface)
game.run