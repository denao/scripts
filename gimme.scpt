on run argv
  set maquina to item 1 of argv
	if maquina is not "" then
		
		tell application "Growl"
			set the allNotificationsList to {"gimme script"}
			register as application ¬
				"gimme script" all notifications allNotificationsList default notifications allNotificationsList icon of application "iTerm"
			notify with name "gimme script" title "Gimme" description "Connecting to " & maquina & "..." application name "gimme script"
		end tell
		
		tell application "iTerm"
			activate
			set myterm to (first terminal)
			tell myterm
				set mysession to (make new session at the end of sessions)
				tell mysession
					set name to "" & maquina & ""
					exec command "ssh -v " & maquina
				end tell
			end tell
		end tell
	end if
end run
