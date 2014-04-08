#UPCASE

def upcase s
	i = 0
	while i < s.size
		if s[i].ord > 64 && s[i].ord < 91

		else
			s[i] = (s[i].ord-32).chr
		end
		
		i += 1
	end
end


phrase = "introducao a ruby finalizada"


upcase(phrase)
puts phrase