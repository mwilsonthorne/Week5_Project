require_relative('../models/transaction.rb')
require_relative('../models/cargo.rb')


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



# transaction1 = Transaction.new({'vendor_name' => 'Mos Eisley Cantina 2', 'planet_name' => 'Mars',
# 'value' => 1000,
#
#
#   })
