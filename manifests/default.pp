
class packitin {
  notice("installing packitin")
}

class selector {
  case $::role {
    'database': { include packitin_database }
    'app': { include packitin }
  }
}

include selector
