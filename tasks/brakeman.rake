if Gem::Specification.find_all_by_name('brakeman').present?
  namespace :brakeman do
    desc 'Check your code with Brakeman'
    task :check do
      require 'brakeman'
      r = Brakeman.run app_path: '.', print_report: true, pager: false
      exit Brakeman::Warnings_Found_Exit_Code unless r.filtered_warnings.empty?
    end
  end
end
