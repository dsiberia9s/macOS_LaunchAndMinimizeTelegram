on appIsOpened(appName)
	try
		tell application "System Events"
			tell process appName
				get properties
				tell window 1
					get properties
					return true
				end tell
			end tell
		end tell
	end try
	return false
end appIsOpened

on runApp(appName)
	try
		tell application appName to launch
	end try
end runApp

on hideApp(appName)
	try
		tell application "System Events" to set visible of process appName to false
	end try
end hideApp

on startApp(appName)
	runApp(appName)
	repeat while appIsOpened(appName) = false
		delay 0.1
	end repeat
	hideApp(appName)
	return true
end startApp

on run argv
	startApp("Telegram")
end run