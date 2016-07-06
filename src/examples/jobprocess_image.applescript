(*
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
*)

-- process jobs, move next job from waiting queue, move to completed queue when finished


-- processing properties here
-- image scale
property sScale : 640
-- image width
property cWidth : 640
-- image Height
property cHeight : 480


-- jobqueue properties
-- delay option for processing, in seconds (use in your processing script)
property job_process_delay : 2
-- delay for jobs in waiting queue - true, false
property job_wait : true
-- delay for next job to be processed, in seconds
property job_wait_delay : 1

-- create subfolders in the completed queue
-- jobs will be grouped into sequential folders (e.g. group1, group2, group3, etc...)
-- setup groups - true, false
property job_groups : true
-- number per group
property job_group_count : 3
-- group folder name
property job_group_name : "images"

-- dialog settings, displaying dialogs provides a way to cancel processing.
-- display job dialogs - true, false
property job_dialogs : true
-- dialog display delay, in seconds
property job_dialogs_delay : 1
-- display error dialogs - true, false
property error_dialogs : true
-- error dialog display delay, in seconds
property error_dialogs_delay : 3

-- log file, saved in the log queue "e.g. jobqueue_log-20080112153316.txt"
property time_stamp : do shell script "date +%Y%m%d%H%M%S" -- year, month, day, hour, minute, second 
property log_file_name : "jobqueue_log-" & time_stamp & ".txt"


--
-- process queued jobs
--
on adding folder items to this_folder after receiving these_items
	tell application "Finder"
		activate
		
		-- get name
		set this_name to the name of item 1 in these_items
		-- get number of items
		set queue_items to the number of items in folder this_folder
		-- set log file
		set log_file to ((folder "log" of folder this_folder as text) & log_file_name)
		
		-- check file for processing
		if my checkName(this_name, this_folder) is true then
			try
				-- only process one job at a time
				if the number of items in these_items is 1 then
					-- start job, log start time to file
					-- get name
					set job_name to the name of item 1 of these_items
					-- log process start time
					set log_msg to "Job Started: " & job_name & " - " & ((current date) as string) & return
					my write_to_file(log_msg, log_file, true)
					
					(*** processing script starts here... these_items ***)
					-- use "these_items" variable as the list of folders/files available to process (e.g. "set theFiles to entire contents of folder these_items" if these_items is a folder)
					-- use "job_process_delay" variable to set a delay in your script (e.g. delay job_process_delay)
					
					-- give time for each job to finish, in seconds - set property above
					delay job_process_delay
					
					-- read in image files with Image Events app
					tell application "Image Events"
						launch
						
						-- open image
						set thisImage to open these_items as alias
						-- get image size, W x H
						copy dimensions of thisImage to {W, H}
						
						-- check if height is greater than sScale, if so scale image, if not crop image
						if H < sScale then
							-- scale image to value of sScale, in pixels - set property above
							scale thisImage to size sScale
							-- save image
							save thisImage
						else
							-- crop image to value of cWidth and cHeight, in pixels - set properties above
							crop thisImage to dimensions {cWidth, cHeight}
							-- save image
							save thisImage
						end if
						
						-- close image
						close thisImage
					end tell
					
					(*** processing script ends here... these_items ***)
					
					
					-- show dialogs
					if job_dialogs is true then ¬
						display dialog "Completed... " & job_name buttons {"Cancel", "OK"} ¬
							default button 2 with title "Job Completed" with icon 1 giving up after job_dialogs_delay
					
					-- move job to completed queue
					-- either move to competed queue or 
					-- group into subfolders within the completed queue
					try
						-- move jobs to subfolders in completed folder
						if job_groups is true then
							-- set counter
							set group_number to 1
							-- set folder name
							set group_folder to job_group_name & group_number
							
							-- check if folder exists
							if (exists folder group_folder of folder "completed" of folder this_folder) then
								-- get count of group folder
								set group_count to the number of items in folder group_folder of folder "completed" of folder this_folder
								
								-- check for group folders, create folder and/or move this item to the group folder
								repeat
									-- move item to group folder
									if group_count ≥ job_group_count then
										-- setup new group folder
										-- increment counter
										set group_number to group_number + 1
										-- folder name
										set group_folder to job_group_name & group_number
										
										-- check if folder exists
										if (exists folder group_folder of folder "completed" of folder this_folder) then
											-- get count of new group folder
											set group_count to the number of items in folder group_folder of folder "completed" of folder this_folder
										else
											-- create new group folder and move item
											make folder at folder "completed" of folder this_folder with properties {name:group_folder}
											move these_items to folder group_folder of folder "completed" of folder this_folder
											exit repeat
										end if
									else
										-- move item to group folder
										move these_items to folder group_folder of folder "completed" of folder this_folder
										exit repeat
									end if
								end repeat
							else
								-- create first group folder and move first item
								make folder at folder "completed" of folder this_folder with properties {name:group_folder}
								move these_items to folder group_folder of folder "completed" of folder this_folder
							end if
						else
							-- move jobs to completed folder, no group folders
							move these_items to folder "completed" of folder this_folder
						end if
					on error number mn
						-- exists in completed queue
						if the mn is -15267 then
							
							-- show dialogs
							if job_dialogs is true then ¬
								display dialog "Job with same name exists in completed queue..." & return & ¬
									"Job will be moved to error queue." buttons {"Cancel", "Continue"} default button ¬
									2 with icon 1 with title "Job Already Completed" giving up after error_dialogs_delay
							
							-- move job to error queue
							move these_items to folder "error" of folder this_folder
							
							-- log completed time to file
							set log_msg to "Job Completed with Error: " & job_name & ¬
								" - Job with same name exists in completed queue, moved to error queue - " & ((current date) as string) & return
							my write_to_file(log_msg, log_file, true)
						end if
					end try
					
					-- log completed time to file
					set log_msg to "Job Completed: " & job_name & " - " & ((current date) as string) & return
					my write_to_file(log_msg, log_file, true)
				else
					-- show dialogs
					if job_dialogs is true then ¬
						display dialog "Jobs queued to waiting..." buttons {"Cancel", "OK"} ¬
							default button 2 with title "Jobs Queued" giving up after job_dialogs_delay
					
					-- waiting queue
					repeat with j in these_items
						-- move jobs to waiting queue
						move j to folder "waiting" of folder this_folder
					end repeat
				end if
			on error m number mn
				if the mn is -128 then
					-- user canceled
				else if the mn is -15267 then
					-- display error
					if error_dialogs is true then ¬
						display dialog "Job with the same name exists in error queue... Overwrite" buttons {"Cancel", "Continue"} default button ¬
							2 with icon 1 with title "Error" giving up after error_dialogs_delay
					
					-- move job to error queue
					move these_items to folder "error" of folder this_folder with replacing
					
					-- log error to file
					set job_name to the name of item 1 of these_items
					set log_msg to "Job Error: " & job_name & " -  Job was replaced in error queue - " & ((current date) as string) & return
					my write_to_file(log_msg, log_file, true)
				else
					-- display error
					if error_dialogs is true then ¬
						display dialog m & mn buttons {"Cancel", "Continue"} default button 2 ¬
							with icon 2 with title "Error" giving up after error_dialogs_delay
					
					-- move job to error queue
					move these_items to folder "error" of folder this_folder
					
					-- log error to file
					set job_name to the name of item 1 of these_items
					set log_msg to "Job Error: " & job_name & " - " & m & " - " & ((current date) as string) & return
					my write_to_file(log_msg, log_file, true)
				end if
			end try
		end if
	end tell
end adding folder items to

--
-- queue next job to process
--
on removing folder items from this_folder after losing these_items
	tell application "Finder"
		activate
		
		-- get name
		set this_name to the name of item 1 in these_items
		-- get number of items
		set queue_items to the number of items in folder this_folder
		-- set log file
		set log_file to ((folder "log" of folder this_folder as text) & log_file_name)
		
		-- check file for processing
		if my checkName(this_name, this_folder) is true then
			try
				-- get jobs in waiting queue
				set jobs to entire contents of folder "waiting" of folder this_folder
				set job_name to the name of item 1 of jobs
				
				-- show dialogs
				if job_dialogs is true then ¬
					if job_wait is true then
						-- show job wait delay in message
						display dialog "Processing... " & job_name & return & "Processing starts in: " & job_wait_delay & ¬
							" seconds" buttons {"Cancel", "OK"} default button 2 with title "Processing Job" giving up after job_dialogs_delay
					else
						display dialog "Processing... " & job_name buttons {"Cancel", "OK"} ¬
							default button 2 with title "Processing Job" giving up after job_dialogs_delay
					end if
				
				-- delay for next job in queue
				if job_wait is true then ¬
					delay job_wait_delay
				
				-- move job to queue for processing
				move item 1 of jobs to folder this_folder
			on error m number mn
				if the mn is -128 then
					-- user canceled
				else if the mn is -1728 then
					-- no more jobs to process
					if job_dialogs is true then ¬
						display dialog "No more jobs to process... " buttons {"Done"} ¬
							default button 1 with title "Processing Done" with icon 1 giving up after job_dialogs_delay
					
					-- log processing done
					set log_msg to "Processing Done" & return
					my write_to_file(log_msg, log_file, true)
				else if the mn is -15267 then
					-- no more jobs to process
					if error_dialogs is true then ¬
						display dialog "Job with the same name exists, moved to error queue..." buttons {"Cancel", "Continue"} default button ¬
							2 with icon 1 with title "Error" giving up after error_dialogs_delay
					
					-- move to error queue
					move item 1 of jobs to folder "error" of folder this_folder
				else
					-- display error
					if error_dialogs is true then ¬
						display dialog m & mn buttons {"Cancel", "Continue"} default button 2 with title ¬
							"Job Error" with icon 2 giving up after error_dialogs_delay
				end if
			end try
		end if
	end tell
end removing folder items from

--
-- check for hidden files "." dot files 
-- don't process folders named: "<parent folder name>_queue", "completed", "waiting", "error", "log"
--
on checkName(this_name, this_folder)
	-- get name of jobqueue
	tell application "Finder"
		set queue_folder to the name of folder this_folder
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
-- write to text file
-- http://www.apple.com/applescript/sbrt/sbrt-09.html
--
on write_to_file(this_data, target_file, append_data)
	try
		set the target_file to the target_file as text
		set the open_target_file to ¬
			open for access file target_file with write permission
		if append_data is false then ¬
			set eof of the open_target_file to 0
		write this_data to the open_target_file starting at eof
		close access the open_target_file
		return true
	on error
		try
			close access file target_file
		end try
		return false
	end try
end write_to_file

