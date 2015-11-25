namespace :thin do
  commands = [:start, :stop, :restart]

  commands.each do |command|
    desc "thin #{command}"
    task command do
      on roles(:app) do
        within current_path do
          with rails_env: :production do
            execute :sudo, "/etc/init.d/thin #{command}"
          end
        end
      end
    end
  end
end