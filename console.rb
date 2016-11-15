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

hunted_alien3=HuntedAlien.new({
  "name"=>"Big Green Man",
  "species"=> "Gremlin",
  "bounty"=>248404,
  "danger_level"=>"Baaad"
  })

hunted_alien1.save()
hunted_alien2.save()
hunted_alien3.save()

hunted_alien1.name = "ET"
hunted_alien1.bounty = 1
hunted_alien1.update()

hunted_alien2.danger_level = "nasty"
hunted_alien2.update()

hunted_alien1.delete

all_aliens = HuntedAlien.all()

binding.pry
nil