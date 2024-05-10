DEBUG = false   -- If you have any problem, please turn this to "true", and send us screenshot from your f8
aff = print

function print(text)
	if DEBUG then
		aff(text)
	end
end

function displayF8(text)
	aff(text)
end