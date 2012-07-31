class Entry < ActiveRecord::Base
  def before_create
    if self.uuid.nil?
      self.uuid = Entry.new_uuid
    end
  end

  def self.new_uuid
    # Only works in Ruby > 1.9.2
    # Returns 24 hex chars
    return SecureRandom.hex(24)
  end
end
