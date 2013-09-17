def db_config
  YAML.load_file(File.join(Rails.root, "config/database.yml"))
end

def schema_file
  File.join(Rails.root, "db/schema.sql")
end

namespace :mysql_agent do
  # for mysql only
  desc "migrate db, export the schema and migration records of the database"
  task :migrate => [ "db:migrate" ] do
    raise Exception, "mysqldump is reqired" unless `which mysqldump` != ""
    config = db_config[Rails.env]

    # dump schema
    system("mysqldump -u #{config['username']} " + 
           "--skip-comments " +
           "-p#{config['password']} -d -R #{config['database']} > #{schema_file}") 

    # dump migration records
    system("mysqldump -u #{config['username']} " + 
           "--skip-comments " +
           "-p#{config['password']} #{config['database']} schema_migrations " +
           ">> #{schema_file}") 

    puts "ok"
  end

  namespace :schema do
    desc "load schema.sql, including schema and migration records"
    task :load do
      config = db_config[Rails.env]
      system("cat #{schema_file} | " + 
             "mysql -u #{config['username']} -p#{config['password']} " + 
             "#{config['database']}")

      p "ok"
    end

  end


end

