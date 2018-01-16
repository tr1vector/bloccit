class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :favorites, dependent: :destroy

	before_save { self.email = email.downcase if email.present? }
	before_save { self.role ||= :member }
	before_save :format_name

	validates :name, length: { minimum: 1, maximum: 100 }, presence: true
	validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
	validates :password, length: { minimum: 6 }, allow_blank: true
	validates :email,
			  presence: true,
			  uniqueness: { case_sensitive: false },
			  length: { minimum: 3, maximum: 254 }

	has_secure_password

	enum role: [:member, :admin, :moderator]

	def format_name
		if name
			name_arr = []
			name.split.each do |word|
				if word =~ /[A-Z]/
					name_arr << word
				else
					name_arr << word.capitalize
				end
			end

			self.name = name_arr.join(" ")
		end
	end

	def favorite_for(post)
		favorites.where(post_id: post.id)
	end

	def avatar_url(size)
		gravatar_id = Digest::MD5::hexdigest(self.email).downcase
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
	end
end
