# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_allhailzirakh_session',
  :secret      => 'd87d16ef5090d725348d9ed9f28018c06fb4d985f7e48ff885eb96b5cc678f0bfed17e9b928e5bf125f9ce029eda13503d20c0d2ede0c2b31ab24ec7e9774d0b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
