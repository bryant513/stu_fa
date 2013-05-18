class AdminPermission < ActiveRecord::Base
  CAN_OPTIONS = %w( manage create update read destroy)
  attr_accessible :can, :resource, :visible_fields
  validates :resource, :presence => true
  validates_inclusion_of :can, :in => CAN_OPTIONS

  has_and_belongs_to_many :admin_roles
end
