# Be sure to restart your server when you modify this file.

MyBlog::Application.config.session_store :cookie_store, key: '_myBlog_session'

#MyBlog::Application.config.time_start = "13:30"
# lines = File.readlines("tr.ini")
# for line in lines
# 	data_array = line.split(";")
# 	MyBlog::Application.config.time_start	= data_array[0]
# 	MyBlog::Application.config.time_stop	= data_array[1]
# 	MyBlog::Application.config.duration		= data_array[2]
# 	MyBlog::Application.config.upper_limit	= data_array[3]
# 	MyBlog::Application.config.ext_duration	= data_array[4] || 300
# 	MyBlog::Application.config.specprice	= data_array[5] || 10
# 	MyBlog::Application.config.ext_stop_time = data_array [6]
# end
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# MyBlog::Application.config.session_store :active_record_store
