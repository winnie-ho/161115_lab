require ('pry-byebug')
require_relative ('models/hunted_aliens')

HuntedAlien.delete_all()

hunted_alien1=HuntedAlien.new({
  "name"=>"Davros",
  "species"=> "Dalek",
  "bounty"=>1000000,
  "danger_level"=>"ermagherd"
  })


hunted_alien2=HuntedAlien.new({
  "name"=>"Little Green Man",
  "species"=> "Squeezer",
  "bounty"=>60000,
  "danger_level"=>"suuupper nice"
  })

hunted_alien1.save()
hunted_alien2.save()

hunted_alien1.name = "ET"
hunted_alien1.update()

all_aliens = HuntedAlien.all()

binding.pry
nil