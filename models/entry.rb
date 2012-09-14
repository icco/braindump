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

  def self.get_unique(email, with_string = "")
    if with_string.empty?
      uuids = Entry.select(:uuid).uniq.where(:email => email)
    else
      uuids = Entry.select(:uuid).uniq.where(:email => email).where("text LIKE ?", "%##{with_string}%")
    end

    entries = []
    uuids.each do |uuid|
      entries.push Entry.where(:uuid => uuid.uuid).order("updated_at DESC").first
    end

    entries.sort! {|a,b|  b.created_at <=> a.created_at }

    return entries
  end
end
