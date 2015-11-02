namespace :db do

  desc "Dumps the database to db/hsfc.dump"
  task :dump => :environment do
    cmd = nil
    with_config do |app, host, db, user|
      cmd = "pg_dump --verbose --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/db/#{app}.dump"
    end
    puts cmd
    exec cmd
  end

  desc "Restores the database dump at db/hsfc.dump."
  task :restore => :environment do
    cmd = nil
    with_config do |app, host, db, user|
      cmd = "pg_restore --verbose --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/db/#{app}.dump"
    end
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    puts cmd
    exec cmd
  end

  desc "Print model counts for submission data"
  task :submission_stats_check => :environment  do
    require "#{Rails.root}/db/submission_stats_check.rb"
  end

  desc "Loads hsfc_submission_data_load.rb"
  task :submission_data_load_file => :environment  do
    require "#{Rails.root}/db/hsfc_submission_data_load.rb"
  end

  desc "Drops data from submission-related tables.rb"
  task :submission_data_destroy_file => :environment  do
    require "#{Rails.root}/db/hsfc_submission_data_destroy.rb"
  end

  desc "Loads submission-related data && shows relevant stats"
  task :submission_data_load => ['db:submission_data_load_file',
                                 'db:submission_stats_check']

  desc "Drops submission-related data && shows relevant stats"
  task :submission_data_destroy => ['db:submission_data_destroy_file',
                                    'db:submission_stats_check']

  private

  def with_config
    yield Rails.application.class.parent_name.underscore,
      ActiveRecord::Base.connection_config[:host],
      ActiveRecord::Base.connection_config[:database],
      ActiveRecord::Base.connection_config[:username]
  end

end