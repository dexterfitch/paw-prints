class User < ActiveRecord::Base
  attr_accessor :password

  validates_confirmation_of :password
  before_save :encrypt_password

  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates_uniqueness_of :email

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end



  # validates_attachment :avatar, :presence => true,
  #                       :content_type => { :content_type => "image/jpeg" },
  #                       :size => { :in => 0..10.kilobytes }
  # has_attached_file :avatar,
  #                   :path => "../../public/system/users/avatars/:attachment/:id/:style/:filename",
  #                   :url => "/system/users/avatars/:attachment/:id/:style/:filename",
  #                   :styles => { :medium => "300x300>", :thumb => "100x100>" },
  #                   :default_url => "/images/:style/missing.png"
