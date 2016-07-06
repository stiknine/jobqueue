(*
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
*)

Hot folder queue system for processing files/folders using Folder Actions


--
-- DESIGN --
--
All queueing and processing is done in the jobqueues folder on the desktop. Processing is done in the queue folder of "jobqueue" (name of folder in jobqueues folder), these folders can be created with the jobsetup.app. Once files/folders are moved into the jobqueue, the first job starts processing automatically and all other jobs are queued to waiting. Once processed jobs are done, they are moved to the completed folder and the next job in waiting is queued for processing. Processing is done when the waiting queue is empty. Jobs are logged to file "jobqueue_log-<timestamp>.txt" located in the log folder. Also you can move completed jobs to subfolder groups.

queue system (folder structure, Folder Actions):
jobqueues
	-> jobqueue (name of folder) -- queue jobs
		script: jobqueue.scpt
		
		-> <name of parent folder>_queue -- process job
			script: jobprocess.scpt
			
			-> completed -- completed jobs
				-> sequential subfolders (folder1, folder2, folder3, etc...)

			-> error -- failed jobs
	
			-> log -- job logs, text files
				-> jobqueue process log and other processing logs
				
			-> waiting -- jobs waiting


--
-- DETAILS --
--
Folder Action Script: jobqueue.scpt
When files/folders are placed into a jobqueue (name of folder), jobs (files/folders to process) the first job starts processing (queue folder) and all other jobs are queued to waiting (waiting folder).

Folder Action Script: jobprocess.scpt
When a job is queued to process (queue folder), files/folders are processed. All file/folder processing is done with the applescript code inserted into the jobprocess.scpt
Once a job is done processing, it gets moved to the completed queue (completed folder), if errors occur then job moves to error queue.
If more than 1 job gets put into the queue folder, the first job starts processing and all others are queued to waiting. Script has a delay option for use within your processing script.
When a job moves from the processing queue (queue folder), then next job waiting in queue (waiting folder) is queued for processing. Script has a delay option to delay next job to be processed. When waiting queue is empty processing is done.



--
-- INSTALL --
--
Run the setup application "jobsetup.app" to install the jobqueue scripts and/or create the jobqueue folders. Script creates a "jobqueues" folder on the desktop if it does not exist, all jobqueue's are contained in the jobqueues folder with "jobname". If you are using OS X 10.3.x you will need to copy the scripts manually.
or
Manually copy the jobqueue scripts (jobqueue.scpt, jobprocess.scpt) to the Folder Action Scripts folder:
"Main Library: /Library/Scripts/Folder Action Scripts/"

Create jobqueue folders as follows:
jobqueues
	-> jobname (folder name)
		-> <name of parent folder>_queue
			-> completed
			-> error
			-> log
			-> waiting


--
-- SCRIPTS --
--
To enable Folder Actions and attach the jobqueue scripts. Control click or right click on the desktop and select Configure Folder Actions.

Folder Actions Setup application will open.

Click enable Folder Actions.

Click the (+) button on the bottom right and browse to:
desktop -> jobqueues folder -> <select a jobqueue folder> 

Select "jobqueue.scpt" script from the list and click Attach.

Click the (+) button on the bottom right again and browse to:
desktop -> jobqueue folder -> <selected jobqueue folder above> -> queue folder 

Select "jobprocess.scpt" script from the list and click Attach.

Folder Actions are now setup.


--
-- CONFIGURE --
--
Open scripts (jobqueue.scpt, jobprocess.scpt) and change the jobqueue properties to fit your needs. 

Edit the jobprocess.scpt script and it is recommended to save it with a new name. There are variables available to the processing script:
these_items - the list of folders/files to process
job_process_delay - used to set a delay in your script 
(e.g. delay job_process_delay)

Put your processing script between these comments:
(*** processing script starts here... these_items ***)

(*** processing script ends here... these_items ***)


--
-- TESTING --
--
To test the jobqueue, first make sure Folder Actions is enabled and configured, copy some junk files/folders to the jobqueue and the files/folders should start moving through the jobqueue system and dialogs displaying the progress.
If you have not modified the jobqueue scripts from their defaults then no processing of the files/folders will be done and all items should end up in the completed and/or error queues.


--
-- NOTES --
--
Having the dialogs on provides a way to stop the processing, have progress display and display errors that occur.
Click cancel when a job dialog appears and processing should stop.
If you cancel a job, clear the job from queue and processing will continue if jobs are in the waiting queue.
If you do not want processing to continue after you cancel, make sure you clear the waiting queue before clearing the processing queue.
Sometimes the queue seems to not start properly. Clear the queue and try again, it usually works the second time, don't know if this is an issue with the scripts or an issue with Folder Actions.



--
-- EXAMPLES --
--
For examples read examples/README_EXAMPLES.txt


--
-- END --
--
