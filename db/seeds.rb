require_relative('../models/transaction.rb')
require_relative('../models/cargo.rb')

Transaction.delete_all() #transaction is dependant on cargo so needs to be dropped first.
Cargo.delete_all()


cargo1 = Cargo.new({'description' => 'Space Food'})
cargo2 = Cargo.new({'description' => 'Rocket Fuel'})
cargo3 = Cargo.new({'description' => 'Ammunition'})
cargo4 = Cargo.new({'description' => 'Spaceship Docking Tax'})
cargo5 = Cargo.new({'description' => 'Gardulla'})

cargo1.save()
cargo2.save()
cargo3.save()
cargo4.save()
cargo5.save()


transaction1 = Transaction.new({'vendor_name' => 'Mos Eisley Cantina 2', 'planet_name' => 'Mercury',
'value' => 100, 'cargo_id' => cargo5.id})
transaction2 = Transaction.new({'vendor_name' => 'Olympus Mons Market', 'planet_name' => 'Mars',
'value' => 50, 'cargo_id' => cargo1.id})
transaction3 = Transaction.new({'vendor_name' => 'Amendardes Ammo', 'planet_name' => 'Venus',
'value' => 1000, 'cargo_id' => cargo3.id})
transaction4 = Transaction.new({'vendor_name' => 'Plutoid Docking Company', 'planet_name' => 'Pluto',
'value' => 75, 'cargo_id' => cargo4.id})
transaction5 = Transaction.new({'vendor_name' => 'Sea of Tranquillity Service Station', 'planet_name' => 'Moon',
'value' => 500, 'cargo_id' => cargo2.id})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
