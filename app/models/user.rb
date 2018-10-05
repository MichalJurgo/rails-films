# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string
#  lastname               :string
#  birthday               :date
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles                  :string
#

class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[admin editor], multiple: false) ##
  ############################################################################################

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  validates :firstname, :lastname, length: { maximum: 30 }

  has_many :friendships
  has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :active_friends, -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true }) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false }) }, through: :received_friendships, source: :user

  has_many :libraries, dependent: :destroy
  has_many :films_seen, -> { Library.seen }, through: :libraries, source: :film
  has_many :films_to_see, -> { Library.to_see }, through: :libraries, source: :film

  has_many :news, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.first_name   # assuming the user model has a name
      user.lastname = auth.info.last_name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def name
    if !firstname.nil? || !lastname.nil?
      "#{firstname} #{lastname}"
    else
      'User'
    end
  end

  def friends
    active_friends | received_friends
  end

  def pending
    pending_friends | requested_friendships
  end

  def friends_with?(user)
    friends.include?(user)
  end

  def friendship_with(user)
    Friendship.where('user_id = ? OR friend_id = ?', user.id, user.id).first
  end

  def friendship_requests
    Friendship.where(friend_id: id, accepted: false)
  end

  def films
    films_seen | films_to_see
  end

  def film_review(film)
    reviews.where(film: film)
  end

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end

  def reviews_feed
    friends_ids = friends.map(&:id)
    Review.where('user_id IN (?)', friends_ids)
  end
end
