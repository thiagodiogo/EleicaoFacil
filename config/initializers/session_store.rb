# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_EleicaoFacil_session',
  :secret      => 'b428861866b25f623f337d344c0aaa6d2f17e34c792ac27926ac26553c2fdf5dbe40ef6472097fadb596cb0b75969ad7a8e002b3757b1ae800f251fc4895280a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
