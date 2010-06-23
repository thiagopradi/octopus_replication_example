require "octopus"
namespace :db do
  desc 'Build the databases for tests'
  task :build_databases do
    mysql_user = ENV['MYSQL_USER'] || "root"

    (1..4).each do |idx|
      %x( echo "create DATABASE octopus_replication_#{idx} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci " | mysql --user=#{mysql_user})
    end
  end

  desc 'Drop the tests databases'
  task :drop_databases do
    mysql_user = ENV['MYSQL_USER'] || "root"

    (1..4).each do |idx|
      %x( mysqladmin --user=#{mysql_user} -f drop octopus_replication_#{idx} )
    end
  end

  desc 'Create tables on tests databases'
  task :create_tables do
    [:slave1, :slave2, :slave3, :slave4].each do |shard_symbol|
      ActiveRecord::Base.using(shard_symbol).connection.create_table(:schema_migrations) do |u|
        u.string :version, :unique => true, :null => false
      end
    end
  end
  
  desc 'Prepare the test databases'
  task :prepare => [:drop_databases, :build_databases, :create_tables]
end



