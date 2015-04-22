#
# Lync Status
#  - Returns current Microsoft Lync status, if running
#
# @author Jwalanta Shrestha <jwalanta@gmail.com>
#
if application "Microsoft Lync" is running then
	tell application "System Events"
		tell process "Microsoft Lync"
			# loop through all possible windows
			repeat with x from 1 to 100
				try
					set status to title of menu button 1 of window x
					return status
				on error errMsg
					# pass		
				end try
			end repeat
		end tell
	end tell
end if

