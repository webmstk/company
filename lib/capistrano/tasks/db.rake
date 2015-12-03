namespace :db do
  desc 'run rake db:seed'
  task :seed do
    on roles(:app) do
      within current_path do
        with rails_env: :production do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  desc 'run rake db:reset'
  task :reset do
    on roles(:app) do
      within current_path do
        with rails_env: :production do
          execute :rake, 'db:reset'
        end
      end
    end
  end
end