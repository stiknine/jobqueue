(*
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
*)

-- setup jobqueue system
-- all queue folders are contained in a folder called jobqueues on the desktop
-- save this script as an application or the install function will not work

-- set administrator password to not be prompted for authentication
property admin_password : ""


-- Start jobsetup app
activate
display dialog "Create a jobqueue or install jobqueue scripts?" & return & ¬
	"(Installing scripts requires authentication and OS X 10.4.x or above.)" buttons {"Quit", "Install Scripts", "Create Queue"} default button 3 cancel button 1 with title "jobqueue Setup" with icon 1

if the button returned of the result is "Create Queue" then
	-- create jobqueue folders
	-- Setup Folders Actions for the created jobqueue
	my create_jobqueue()
else if the button returned of the result is "Install scripts" then
	-- copy joqueue scripts to /Library/Scripts/Folder Actions Scripts/
	-- you need administrator privileges to copy scritps to /Library/Scripts/Folder Action scripts/
	my install_jobqueue()
else
	-- user canceled
end if

--
-- create jobqueue folders
--
on create_jobqueue()
	tell application "Finder"
		activate
		
		-- get name for jobqueue, cancel or open Folder Actions Setup app
		display dialog "Name for jobqueue \"folder name\":" default answer "" with title "Queue Name"
		-- name of jobqueue
		set jobname to text returned of the result
		-- folder name to hold the queues, created on the desktop
		set jobqueue to "jobqueues"
		-- check if name is empty
		if jobname is not "" then
			try
				-- create new jobqueue in the jobqueues folder on the desktop
				make folder at (path to desktop folder) with properties {name:jobqueue}
				make folder at the result with properties {name:jobname}
				
				set queue_path to the result
			on error
				-- create jobqueues folder if does not exist
				set the result to folder jobqueue of folder (path to desktop folder)
				
				try
					make folder at the result with properties {name:jobname}
				on error
					set the result to ""
				end try
			end try
			
			-- create queue folders
			if the result is "" then
				-- jobqueue exists
				display dialog "Queue already exists. Please use a different name..." buttons {"OK"} ¬
					default button 1 with title "Queue Exists" with icon 2 giving up after 5
				my create_jobqueue()
			else
				-- get path to new jobqueue
				set queue_path to the result
				
				-- jobqueue folders
				set queue_folder to jobname & "_queue"
				set job_queues to {queue_folder, "completed", "waiting", "log", "error"}
				
				repeat with q in job_queues
					if contents of q is queue_folder then
						
						set q_scpt to "jobqueue.scpt" as text
						set p_scpt to "jobprocess.scpt" as text
						set fa_path to queue_path as text
						set jq_path to ((queue_path as string) & q) as text
						set fa_name to name of alias fa_path
						set jq_name to q
						
						try
							-- create queue folder
							make folder at queue_path with properties {name:q}
							set queue_path to the result
							
							-- setup Folder Actions
							activate
							display dialog "Do you want to setup Folder Actions now?" buttons {"Create Queue", "Quit", "OK"} ¬
								default button 3 cancel button 2 with title "Setup Folder Actions" with icon 1
							
							if the button returned of the result is "OK" then
								try
									tell application "System Events"
										-- create jobqueue Folder Actions
										make new folder action at end of folder actions with properties {path:fa_path}
										make new folder action at end of folder actions with properties {path:jq_path}
										
										-- attach scripts to folder actions
										(*tell folder action fa_name
											make new script at end of scripts with properties {name:q_scpt}
										end tell
										
										tell folder action jq_name
											make new script at end of scripts with properties {name:p_scpt}
										end tell*)
									end tell
									
									-- open Folder Actions Setup application
									my openFAS()
								end try
							else if the button returned of the result is "Create Queue" then
								-- create jobqueue folders
								-- Setup Folders Actions for the created jobqueue
								my create_jobqueue()
							else
								-- user canceled
							end if
							
						end try
					else
						try
							-- create other folders
							make folder at queue_path with properties {name:q}
						end try
					end if
				end repeat
			end if
		else
			-- jobqueue needs a name
			display dialog "Please choose a name for the queue..." buttons {"OK"} ¬
				default button 1 with title "Queue Name" with icon 2 giving up after 5
			my create_jobqueue()
		end if
	end tell
end create_jobqueue

--
-- copy jobqueue scripts to the main Library Folder Action Scripts folder
-- using do shell script to install scripts
--
on install_jobqueue()
	try
		-- get current logged in user name
		set user_name to do shell script "whoami"
		set jobqueue_scripts to {"jobqueue.scpt", "jobprocess.scpt"}
		set jobqueue_x_scripts to {"jobprocess_example.scpt", "jobprocess_cl.scpt", "jobprocess_image.scpt", "jobprocess_log.scpt"}
		-- path to Folder Actions
		set fas_path to the POSIX path of (path to Folder Action scripts from local domain)
		-- get the path to running application
		set this_path to do shell script "dirname " & the quoted form of the POSIX path of (path to me)
		
		-- create a POSIX path to the jobqueue scripts so we can copy all scripts at once
		set cp to ""
		set cpx to ""
		repeat with s in jobqueue_scripts
			set cp to cp & "'" & this_path & "/" & s & "' "
			set cpx to cpx & "'" & this_path & "/" & s & "' "
		end repeat
		-- with example scripts
		repeat with sx in jobqueue_x_scripts
			set cpx to cpx & "'" & this_path & "/examples/" & sx & "' "
		end repeat
		
		-- create a POSIX path to the jobqueue scripts so we can change permissions 
		set o to ""
		set ox to ""
		repeat with a in jobqueue_scripts
			set o to o & " '" & fas_path & a & "'"
			set ox to ox & " '" & fas_path & a & "'"
		end repeat
		-- with example scripts
		repeat with x in jobqueue_x_scripts
			set ox to ox & " '" & fas_path & x & "'"
		end repeat
		
		-- cp and chown commands
		-- using cp to copy scripts, need admin privileges 
		-- using chown to set users permissions so scripts are editable
		set cp_cmd to "cp " & cp & the quoted form of fas_path & " && chown " & user_name & o
		set cp_x_cmd to "cp " & cpx & the quoted form of fas_path & " && chown " & user_name & ox
		
		-- install example scripts?
		activate
		display dialog "Do you want to install the jobqueue example scripts?" & return ¬
			buttons {"Cancel", "No", "OK"} default button 3 with title "Example Scripts" with icon 1
		
		if the button returned of the result is "OK" then
			-- backup current jobprocess script
			my scpt_bak()
			
			-- run copy command, with examples
			activate
			do shell script cp_x_cmd password admin_password with administrator privileges
			
			-- copy successful			
			display dialog "Successfully copied: jobqueue.scpt, jobprocess.scpt and examples to folder: /Library/Scripts/Folder Action scripts/" buttons {"Setup Actions", "Create Queue", "Quit"} ¬
				default button 3 with title "Scripts Installed" with icon 1
			if the button returned of the result is "Create Queue" then
				-- create jobqueue folders
				my create_jobqueue()
			else if the button returned of the result is "Setup Actions" then
				-- open Folder Actions Setup application
				my openFAS()
			else
				-- user cancel
			end if
		else
			-- backup current jobprocess script
			my scpt_bak()
			
			-- run copy command, no examples
			activate
			do shell script cp_cmd password admin_password with administrator privileges
			
			-- copy successful			
			display dialog "Successfully copied: jobqueue.scpt, jobprocess.scpt to folder: /Library/Scripts/Folder Action scripts/" buttons {"Setup Actions", "Create Queue", "Quit"} ¬
				default button 3 with title "Scripts Installed" with icon 1
			if the button returned of the result is "Create Queue" then
				-- create jobqueue folders
				my create_jobqueue()
			else if the button returned of the result is "Setup Actions" then
				-- open Folder Actions Setup application
				my openFAS()
			else
				-- user cancel
			end if
		end if
		
		-- move jobwait script to the trash if it exists
		my mv_scpt()
	end try
end install_jobqueue

--
-- Open Folder Actions Setup app
-- note: need to launch the app, then activate it - this seems to force the app to the front
--
on openFAS()
	-- open Folder Actions Setup application
	tell application "Folder Actions Setup"
		-- launch app
		launch
		-- then activate app
		activate
	end tell
end openFAS

--
-- backup current jobprocess script in case it has been modified
--
on scpt_bak()
	try
		set jp_scpt to the POSIX path of (path to Folder Action scripts from local domain) & "jobprocess.scpt"
		
		-- rename current process script, append ".bak"
		set mv_cmd to "mv '" & jp_scpt & "' '" & jp_scpt & ".bak'"
		do shell script mv_cmd
	end try
end scpt_bak

--
-- move jobwait script to trash, script has been merged with the jobprocess script (v. 2.x.x)
--
on mv_scpt()
	try
		set scpt to (((path to Folder Action scripts from local domain) as string) & "jobwait.scpt") as alias
		
		tell application "Finder"
			move scpt to trash
		end tell
	end try
end mv_scpt

