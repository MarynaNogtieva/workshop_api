
# https://ddnexus.github.io/pagy/extras/overflow - easy hadlinng oof overflowig pages
require 'pagy/extras/overflow'
# https://ddnexus.github.io/pagy/extras/array - adds a specialized pagination for arrays (only), 
# do not use this for data that comes from db or any other persistant storage
require 'pagy/extras/array'

# Pagy::VARS[:overflow] = :last_page
Pagy::VARS[:overflow] = :empty_page
