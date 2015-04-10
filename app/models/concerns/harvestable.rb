module Harvestable
  extend ActiveSupport::Concern


  module ClassMethods

    def create_or_update(hash)
      obj = begin find(hash[:id]) rescue new end;
      password = hash[:password]

      obj.attributes = hash.reject{|k,v| !obj.attributes.keys.member?(k.to_s) }
      obj.password = password unless password.nil? || !obj.new_record?

      state = "unnchaged"
      message = "error"

      if obj.errors.any?
        message = "Errors for #{hash[:id]}: #{obj.errors}"
      else
        state = "#{obj.new_record? ? "created" : "updated"}"
        obj.save!
      end
      message = "[#{state}] - #{obj.id} | #{obj}" unless obj.errors.any?
      puts message
    end
  end

end