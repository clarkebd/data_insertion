
# NOTE: script will automatically save generated emails to your clipboard when
# using on Mac.  Windows users will still have to copy/paste.

class Email

	print "\e[2J\e[f"

	@@iteration=0
	@@email = 'brian'
	@@emaildest = '@devmail.icontact.com'

		def pbcopy(i)
		 str = i.to_s
		 IO.popen('pbcopy', 'w') { |f| f << str }
		 str
		end

		def generate(choice)
			temp_list = []
			emails_list = []

				if choice==1
					puts pbcopy(@@email + @@iteration.to_s + @@emaildest + " \n")
					@@iteration+=1
						elsif choice==2
							puts " \nHow Many Emails Would You Like?"
							  howmany=gets.chomp.to_i
							puts "\nStarting iteration #?"
							  @@iteration=gets.chomp.to_i
							puts "\n"

								while howmany > 0
									newemail = @@email + @@iteration.to_s + @@emaildest
									emails_list.push newemail
									@@iteration+=1
									howmany-=1
								end
								
								temp_list = emails_list.join(", ")
								puts pbcopy(temp_list)
				end
		 choose()
		end

		def choose()
				menu = ['  1 - Single Email','  2 - Multiple Emails', '  (Any other # will Exit)', 'Choice?']

				puts "\nSelect one:"
				puts menu

				whattodo=gets.chomp.to_i
				exit if !(whattodo==1 || whattodo==2)

				generate(whattodo)
		end
end

Email.new.choose()
