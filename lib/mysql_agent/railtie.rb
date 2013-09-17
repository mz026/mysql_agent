require 'mysql_agent'
require 'rails'
module MysqlAgent
  class Railtie < Rails::Railtie
    railtie_name :mysql_agent

    rake_tasks do
      load "tasks/mysql_agent.rake"
    end
  end
end
