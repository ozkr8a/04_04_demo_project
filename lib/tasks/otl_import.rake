# This rake task will help import the SQL database backup file included
# with the exercise files.
#
# If you want to make your database look exactly like mine at the
# start of a movie--and lose all of your current data in the process--
# then run this script.  It is especially useful if your data gets
# too far out of synch or if you are jumping around in the exercise files.
#
# This file should go in the lib/tasks folder of your Rails application.
# To use it, from the command line, navigate to the root of your Rails
# application and then run "rails otl:import" and enter the database
# information at each prompt.
namespace :otl do

  desc "Import project SQL data."
  task :import do
    db_name = 'demo_project_development'
    db_user = 'rails_user'
    db_pass = 'secretpassword'
    puts
    puts "-" * 60
    puts "Ruby on Rails SQL Import Task"
    puts
    puts "This task will help import the SQL database backup file included "
    puts "with the exercise files."
    puts
    puts "You must have already created a database before using this import."
    puts "Example: CREATE DATABASE #{db_name};"
    puts "         GRANT ALL PRIVILEGES ON *.* "
    puts "         TO '#{db_user}'@'localhost' IDENTIFIED BY '#{db_pass}';"
    puts "Refer to videos on installing MySQL and configuring the database"
    puts "if you need more help."
    puts
    puts "If you have any problems with this script the same import can "
    puts "also be run directly from the command line using:"
    puts "  mysql -u #{db_user} -p #{db_name} < db/#{db_name}.sql"
    puts "Then enter the correct MySQL password when prompted."
    puts "-" * 60
    puts
    puts "Importing the new database data will wipe out any existing database data."
    puts
    print "Proceed? (yes/no) > "
    response = STDIN.gets.chomp
    if !['y', 'yes'].include?(response.downcase)
      puts "Exiting import without any changes."
    else
      puts "-" * 60
      puts "\nYou can choose the default settings by just hitting return."
      print "Enter database hostname: (localhost) > "
      response = STDIN.gets.chomp
      host = response.blank? ? 'localhost' : response

      print "Enter database name: (#{db_name}) > "
      response = STDIN.gets.chomp
      database = response.blank? ? db_name : response

      print "Enter database username: (rails_user) > "
      response = STDIN.gets.chomp
      username = response.blank? ? db_user : response

      default_file = File.join("db", "#{db_name}.sql")
      print "Enter import file path: (#{default_file}) > "
      response = STDIN.gets.chomp
      import_file = response.blank? ? default_file : response

      puts
      puts "Please enter the correct MySQL password for the user '#{username}'"
      puts "and hit return (for security, you will not see what you type)."
      import_command = "mysql -h #{host} -u #{username} -p #{database} < #{import_file}"
      verbose(false) do
        sh import_command do |ok, res|
          if ok
            puts "\nImport complete.\n\n"
          else
            puts "\nImport failed.\n\n"
          end
        end
      end
    end

  end

end
