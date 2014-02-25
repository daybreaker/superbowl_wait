# config/initializers/geocoder.rb
Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :bing,

  # IP address geocoding service (see below for supported options):
  # :ip_lookup => :maxmind,

  # to use an API key:
  :api_key => "AqYsmSdXaoIH19ovFvme0d33r7jYA6PovlEhTEPDL0m81TSjIuuDA_enCz3x1BcD",

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  # :units => :km,

)
