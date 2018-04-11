# desc "Explaining what the task does"
# task :soshi do
#   # Task goes here
# end

namespace :soshi do
  desc "Install Soshi engine"
  task :install do
    puts "Installing Soshi engine..."
    system('bundle exec rails soshi:install:migrations')
    system('bundle exec rails acts_as_taggable_on_engine:install:migrations')
    puts 'Finish'
  end
end
