class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :admin_role_ids
  has_and_belongs_to_many :admin_roles

  rails_admin do

  end


  def permissions
    _perms = []
    self.admin_roles.each do |role|
      role.admin_permissions.each do |perm|
        _perms <<  perm
      end
    end
    _perms
  end

  def authority(&block)
    if block_given?
      self.permissions.each do |perm|
        block.call(perm.can, perm.resource)
      end
    end
  end
end
