class Hostname < ActiveRecord::Base
  attr_accessible :name, :primary

  belongs_to :host

  scope :primary_host, where(:primary => true)
  scope :other_hosts, where(:primary => false)
end
