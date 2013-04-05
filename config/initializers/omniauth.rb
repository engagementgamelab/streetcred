Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :foursquare, 'RO02GQEU04XS1WJ1RVXQPLLMS1PJSB1PWKS3NFQPH5ZB3XMZ', 'KDPJY0KOUNZJVANSYWOY32DWXXSCQBZOTKE1PWVYPRM21ABZ'
  provider :foursquare, ENV['FOURSQUARE_ID'], ENV['FOURSQUARE_SECRET']
end