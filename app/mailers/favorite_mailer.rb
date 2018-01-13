class FavoriteMailer < ApplicationMailer
	default from: "tr1vector@outlook.com"

	def new_comment(user, post, comment)
		headers["Message-ID"] = "<comments/#{comment.id}@guarded-ridge-24909.herokuapp.com>"
		headers["In-Reply_To"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"
		headers["References"] = "<post/#{post.id}@guarded-ridge-24909.herokuapp.com>"

		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, bcc: "fricke9523@msn.com", subject: "New comment on #{post.title}")
	end
end
