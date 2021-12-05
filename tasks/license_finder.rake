task license_finder: :environment do
  sh 'bundle', 'exec', 'license_finder'
end
