#Основная часть программы
#Разработайте программное обеспечение,
#которое можно использовать для управления #подсчетом турниров - подготовьте и заполните расписание турниров. 
#Пользователь может ввести список команд.
#Вместе участвуют 16 команд.
#Команды случайным образом делятся на 2 подразделения - A и B (по 8 команд в каждой).
#В каждом дивизионе команды играют друг против друга.
#Лучшие 4 команды из каждого дивизиона встречаются в плей-офф.
#Исходное расписание плей-офф составлено по принципу - лучшая команда играет против худшей команды.
#Победившая команда остается играть дальше, но проигравшая команда выходит из игры.
#Общая победившая команда - тот, кто выигрывает все игры в плей-офф.

class Game
	attr_accessor :teams, :group_a, :group_b, :group_play_off

	def initialize(interface)
		@interface = interface
		@teams = []
		@group_a = []
		@group_b = []
		@group_play_off = []
	end

	def run
		item = 1
		@interface.welcome
		@interface.quastion_auto_generate
		choice = gets.chomp
		if choice == "нет"
			16.times do
				print "#{item}) "
		  	@interface.enter_name
		  	name = gets.chomp
		  	@teams << Team.new(name)
		  	item += 1
			end
		elsif choice == "да"
			@interface.massage_generate_team
			16.times do
				puts "#{item}) команда "
				@teams << Team.new(('a'..'z').to_a.shuffle[0..7].join)
				item += 1
			end
		else
			@interface.error_massage
		end
		init_group_and_point(@teams)
	end

	def init_group_and_point(teams)
		@interface.massage_list_group
		teams.shuffle!
		@group_a, @group_b = teams.each_slice(8).to_a
		@interface.list_group_a(@group_a)
		@interface.list_group_b(@group_b)
		random_point(@group_a)
		random_point(@group_b)
		result_game_group(@group_a, @group_b)
	end

	def random_point(group)
		group.each do |team|
			team.point = rand(10)
		end
	end

	def result_game_group(group1, group2)
		@interface.massage_game_group
		win_group_1 = group1.max_by(4, &:point)
		win_group_2 = group2.max_by(4, &:point)
		@interface.list_group_a(win_group_1)
		@interface.list_group_b(win_group_2)
		play_off(win_group_1, win_group_2)
	end

	def add_play_off_group(group_play_off, group)
		group.each { |team| group_play_off << team }
	end

	def play_off(win_group_1, win_group_2)
		add_play_off_group(group_play_off, win_group_1)
		add_play_off_group(group_play_off, win_group_2)
		random_point(group_play_off)
		play_off_game = group_play_off.max_by(4, &:point)
		@interface.list_playo_off(play_off_game)

		random_point(play_off_game)
		play_off_game = play_off_game.max_by(2, &:point)
		@interface.list_playo_off(play_off_game)
		final(play_off_game)
	end

	def final(play_off_game)
		@interface.massage_final
		random_point(play_off_game)
		play_off_game = play_off_game.max_by(1, &:point)
		@interface.list_final_result(play_off_game)
	end

end
