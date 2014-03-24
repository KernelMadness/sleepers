name             'sleepers'
maintainer       'Denis Rizaev'
maintainer_email 'dsrizaev@gmail.com'
license          'All rights reserved'
description      'Installs full-stack rails app server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.12'

depends 'apt'
depends 'bluepill'
depends 'htop'
depends 'git'
depends 'curl'
depends 'user'
depends 'sudo'
depends 'postgresql'
depends 'nginx'
depends 'ruby_build'