module UsersHelper
	def user_posts?
		@user.posts.any?
	end

	def user_comments?
		@user.comments.any?
	end

	def user_favorites?
		@user.favorites.any?
	end
end
