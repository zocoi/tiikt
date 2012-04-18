class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  
  validates :email, :presence => true, :uniqueness => true
  
  has_many :tasks
  has_many :assignments, :dependent => :destroy
  has_many :assigned_tasks, :through => :assignments, :source => :task
  
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :friend, :class_name => 'User'
  
  def avatar_url
    if self.fb_uid
      self.facebook_avatar_url
    else
      self.gravatar_url
    end
  end
  
  def facebook_avatar_url
    "http://graph.facebook.com/#{self.fb_uid}/picture"
  end
  
  def gravatar_url(size=50)
    hash = Digest::MD5.hexdigest(self.email)
    "https://secure.gravatar.com/avatar/#{hash}?s=#{size}&d=mm"
  end
  
  def facebook_friends
    me = FbGraph::User.me(self.fb_access_token)
    friends = me.friends
  end
  
  # Called by user/omniauth_devise_controller#facebook to lookup an existing user for facebook.
  #
  # @omniauth [Hash] Omniauth provider hash @see https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
  # @user [User] The current logged in user.
  def self.find_or_create_for_facebook_oauth(access_token,signed_in_resource=nil)
    data = access_token['info']
    user = User.find_by_fb_uid(access_token["uid"])
    unless user
      user = User.find_or_create_by_email({
        :name => data["name"], 
        :email => data["email"], 
        :password => Devise.friendly_token[0,20],
        :fb_uid => access_token["uid"],
        :fb_access_token => access_token["credentials"]["token"]
      })
    end
    user
  end
  
  # Called via devise when new user registration flow begins.
  #
  # @params [Hash] Standard params via rails.
  # @session [Hash] Session containing Oauth hash from devise containing keys for devise.{provider}_data. e.g. "devise.facebook_data".
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]
        user.fb_uid = data["uid"]
        user.fb_access_token = data["credentials"]["token"]
        user.email  = data["user_info"]["email"]
        user.name   = data["user_info"]["name"]
      end
    end
  end
  
  def generate_friendships_from_facebook
    fb_uids = []
    self.facebook_friends.each do |friend|
      fb_uids << friend.identifier
    end
    friends = User.where(:fb_uid => fb_uids)
    friends.each do |friend|
      if friend
        self.friends << friend unless self.friends.exists?(friend)
        friend.friends << self unless friend.friends.exists?(self)
      end
    end
  end
  
  def as_json options={}
    super(options).merge({
    })
  end
  
  
end
