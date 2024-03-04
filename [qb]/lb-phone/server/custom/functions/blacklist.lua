local blacklistLookup = {}

if Config.WordBlacklist?.Enabled then
	for i = 1, #Config.WordBlacklist.Words do
		blacklistLookup[Config.WordBlacklist.Words[i]] = true
	end
end

function ContainsBlacklistedWord(source, app, text)
	if not Config.WordBlacklist or not Config.WordBlacklist.Apps[app] or type(text) ~= "string" then
		return false
	end

	local blacklisted = false

	for word in text:gmatch("%S+") do
		if blacklistLookup[word] then
			blacklisted = true
			break
		end
	end

	if blacklisted then
		infoprint("warning", "Player %i (%s) tried to send a message containing a blacklisted word: %s", source, GetPlayerName(source), text)
	end

	return blacklisted
end
