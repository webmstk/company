user = User.find_or_initialize_by(login: 'admin')
user.password = ENV['ADMIN_PASSWORD']
user.save