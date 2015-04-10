namespace :import do

  @harvest = Harvest.hardy_client(
                subdomain: ENV['HARVEST_SUBDOMAIN'],
                username: ENV['HARVEST_USERNAME'],
                password: ENV['HARVEST_PASSWORD'])

  def harvest_hash(obj)
    hash = obj.to_h
    mappings = {"created_at" => "harvest_created_at", "updated_at" => "harvest_updated_at"}
    hash.keys.each { |k| hash[ mappings[k] ] = hash.delete(k) if mappings[k] }
    hash.symbolize_keys
  end

  desc "Import Users"
  task users: :environment do
    users = @harvest.users.all

    puts "\nImporting #{users.count} users"
    puts "================="
    users.each do |user|
      if user.is_active?
        user.password = Devise.friendly_token[0,20]
        User.create_or_update(harvest_hash(user))
      end
    end
  end

end