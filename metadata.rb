maintainer       "MAEKAWA Tsuyoshi"
maintainer_email "main.xcezx@gmail.com"
license          "All rights reserved"
description      "Installs/Configures php-redis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "php"
depends "git"
depends "build-essential"

%{ debian ubuntu }.each do |os|
  supports os
end

recipe "php-redis", "Install redis extension from source."
