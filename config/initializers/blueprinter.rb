require 'oj'

# https://engineering.procore.com/introducing-blueprinter/
# https://gitter.im/blueprinter-gem/community?at=5c6080b228c89123cba80278
Blueprinter.configure do |config|
  config.generator = Oj
end