(*
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
*)

-- queue jobs, starts first job automatically and queues all other jobs to waiting


-- dialog settings
-- display job dialogs - true, false
property job_dialogs : true
-- dialog display delay, in seconds
property job_dialogs_delay : 1
-- display error dialogs - true, false
property error_dialogs : true
-- error dialog display delay, in seconds
property error_dialogs_delay : 3


--
-- queue jobs for processing
--
on adding folder items to this_folder after receiving these_items
	tell application "Finder"
		activate
		
		-- get name
		set this_name to the name of item 1 in these_items
		-- get queue name
		set queue_folder to the name of folder this_folder & "_queue"
		-- get number of items
		set queue_items to the number of items in folder queue_folder of folder this_folder
		
		-- check file for processing
		if my checkName(this_name, this_folder) is true then
			try
				-- get name of first item
				set job_name to the name of item 1 in these_items
				
				-- only process one job at a time, check queue
				if the number of items in these_items is 1 and my checkQueue(queue_items) is true then
					
					-- show dialogs
					if job_dialogs is true then ¬
						display dialog "Processing... " & job_name ¬
							buttons {"Cancel", "OK"} default button 2 with title "Processing Job" giving up after job_dialogs_delay
					
					-- move job to process
					move these_items to folder queue_folder of folder this_folder
				else
					-- show dialogs
					if job_dialogs is true then ¬
						display dialog "Processing... " & job_name & return & ¬
							"queue other jobs to waiting..." buttons {"Cancel", "OK"} default button 2 ¬
							with title "Jobs Queued" giving up after job_dialogs_delay
					
					-- move to waiting
					repeat with j in these_items
						if j as string is not the first item of these_items as string then
							-- move other jobs to waiting queue
							try
								move j to folder "waiting" of folder queue_folder of folder this_folder
							on error number mn
								if the mn is -15267 then
									-- display error
									if error_dialogs is true then ¬
										display dialog "Job with the same name exists, moved to error queue..." buttons ¬
											{"Cancel", "Continue"} default button 2 with icon 1 with title "Error" giving up after error_dialogs_delay
									
									-- move job to error queue
									move j to folder "error" of folder queue_folder of folder this_folder
								end if
							end try
						else
							-- move first job to process, check queue
							if my checkQueue(queue_items) is true then
								-- process
								move j to folder queue_folder of folder this_folder
							else
								-- waiting
								move j to folder "waiting" of folder queue_folder of folder this_folder
							end if
						end if
					end repeat
				end if
			on error m number mn
				if the mn is -128 then
					-- user canceled
				else if the mn is -15267 then
					-- show error dialogs
					if error_dialogs is true then ¬
						display dialog "Job with the same name exists, moved to error queue..." buttons ¬
							{"Cancel", "Continue"} default button 2 with icon 1 with title "Error" giving up after error_dialogs_delay
					
					-- move job to error queue
					move these_items to folder "error" of folder queue_folder of folder this_folder
				else
					-- display error
					if error_dialogs is true then display dialog m & mn buttons ¬
						{"Cancel", "Continue"} default button 2 with title "Error" with icon 2 giving up after error_dialogs_delay
				end if
			end try
		end if
	end tell
end adding folder items to

--
-- check for hidden files "." dot files 
-- don't process folders named: "<parent folder name>_queue", "completed", "waiting", "error", "log"
--
on checkName(this_name, this_folder)
	-- get name of jobqueue
	tell application "Finder"
		set queue_folder to the name of folder this_folder & "_queue"
	end tell
	
	if this_name starts with "." then
		-- dot (.) files
		return false
	else if the contents of this_name is in {queue_folder, "completed", "waiting", "error", "log"} then
		-- queue folders
		return false
	else
		-- ok
		return true
	end if
end checkName

--
-- check queue if currently processing
--
on checkQueue(queue_items)
	if queue_items is 4 then
		-- 4 queues
		return true
	else
		-- processing, something is in the queue
		return false
	end if
end checkQueue

