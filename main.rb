#!/usr/bin/env ruby
#coding:utf-8

class Hash
	def add key,ini,val
		self[key] = ini unless has_key? key
		self[key] << val
	end
end


commit = `git log --oneline`.inject([]) { |list,e| list << e.split(/ /)[0] }
updates = Hash.new



(0...(commit.size-1)).each { |n|
	puts "-"  * 20
	puts "HEAD~#{n}(#{commit[n]}) to HEAD~#{n+1}(#{commit[n+1]})"

	info   = `git show HEAD --pretty="%cd,%an" --quiet`
	files  = `git diff --name-only HEAD~#{n}..HEAD~#{n+1}`

	puts info, files
	files.each { |path|
		updates.add(path.chomp,[],n)
	}
}


puts "-"  * 20
puts "--- csv"
print "HEAD~{n},"

(0...commit.size-1).each { |commit_no|
	print "#{commit_no},"
}
puts
updates.each { |path,nums|
	print path + ","
	(0...commit.size-1).each { |commit_no|
		print ( (nums.include? commit_no ) ? "o" : "x")
		print ","
	}
	puts ""
}

