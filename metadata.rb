name             'firefox'
maintainer       'Rally Software Development Corp'
maintainer_email 'rteabeault@rallydev.com'
license          'MIT'
description      'Installs/Configures firefox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.1.0'

depends 'ark', '~> 0.3'
depends 'apt', '~> 2.3'
