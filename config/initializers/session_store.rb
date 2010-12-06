# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_organizations_session',
  :secret      => 'c4f280873d81fdd3c032777633bcb8d3a3fd2d92630d0019c3f49c5a7ed8e9a5252fc6315965012866881a86caf580755664d53d4e5e5bc92f002136e6fbf44d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
