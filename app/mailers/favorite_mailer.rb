class FavoriteMailer < ApplicationMailer
	default from: "tr1vector@outlook.com"

	def new_comment(user, post, comment)
		headers["Message-ID"] = "<comments/#{comment.id}@guarded-ridge-24909.herokuapp.com>"
		headers["In-Reply_To"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"
		headers["References"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"

		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, bcc: "tr1vector@outlook.com", subject: "New comment on #{post.title}")
	end

	def new_post(post)
		headers["Message-ID"] = "<posts/#{post.id}@guarded-ridge-24909.herokuapp.com>"
		headers["In-Reply_To"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"
		headers["References"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"

		@post = post

		mail(to: post.user.email, bcc: "fricke9523@msn.com", subject: "You're following, #{post.title}")
	end
end
