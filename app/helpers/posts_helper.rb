module PostsHelper

	def previous_post(id)
		prev_id = id-1
		prev = Post.find_by_id(prev_id) 
		puts prev
		if prev != nil
			return prev
		else
			return false
		end
	end
	def next_post(id)
		prev_id = id+1
		prev = Post.find_by_id(prev_id) 
		puts prev
		if prev != nil
			return prev
		else
			return false
		end
	end
end
