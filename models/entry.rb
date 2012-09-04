class Entry < ActiveRecord::Base
  before_create :default_values
  def default_values
    self.uuid ||= Entry.new_uuid
  end

  def self.new_uuid
    # Only works in Ruby > 1.9.2
    # Returns 10 hex chars
    return SecureRandom.hex(10).to_s
  end
end
