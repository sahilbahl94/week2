class PasswordChecker

	def check_password(email,password)
		if condition_match(email,password) && condition_length(password) && condition_type(password) && condition_case(password)
			true
		else
			false
		end
	end

	def condition_length(password)
		password.length > 7
	end

	def condition_type(password)
		password.match(/\w/) && password.match(/\d/) && password.match(/\W/)
	end

	def condition_case(password)
		password.match("[a-z]") && password.match("[A-Z]")
	end

	def condition_match(email,password)
		array = email.split("@")
		array[1] = email[1].gsub(".com", "")
		!password.include?(array[0]) || !password.include?(array[1])
	end
end





