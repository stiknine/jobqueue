(*
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
*)

Hot folder queue system for processing files/folders using Folder Actions

To setup jobqueue system follow: jobqueue/README.txt


--
-- EXAMPLES --
--
Some basic example scripts.

Example 1 jobprocess_log.scpt:
Example to get the dimensions of an image and output them to a text file located in the log folder. To test use the provided images located in the examples/images folder (has a delay of 5 seconds).

Example 2 jobprocess_image.scpt:
Example to scale or crop images to X size and group them into folders. Attach the jobprocess_image.scpt, open the script and modify the image size properties.  To test use the provided images located in the examples/images folder (has a delay of 5 seconds).

Example 3 jobprocess_cl.scpt:
Example script provided "jobprocess_cl.scpt" in the example folder. This uses do shell script, using the cp command which copies files to a folder on the desktop, renaming them with "_new.jpg".

Open the script and set the property "output_folder_name" to a folder you create on the desktop (default is output) and set the property "new_name" to a suffix for the new filename (default is _new.jpg)

Create a jobqueue and assign the "jobprocess_cl" script.

Drag and Drop some files to copy and rename.

Example 4 jobprocess_example.scpt:
Example script provided "jobprocess_example.scpt" in the example folder.
Script copies only html and jpg files to a folder on the desktop with 2 subfolders, which the html files are copied to a html folder and jpgs are copied to a images folder.

Copy "jobprocess_example.scpt" script to a Folder Action Scripts folder.

Use the "jobsetup.app" to create a jobqueue called "test".

Configure Folder Actions as per above, except assign the "jobqueue-example" script, not the "jobprocess" script.

Create a folder on the Desktop called "jobtest", open folder and create 
2 more folders called "html" and "images".

Drag and drop the example folders (test_folder 1, test_folder 2, test_folder 3) to the "test" jobqueue (test folder should have been create in the jobqueues folder on the desktop). If Folder Action are on then file/folders will start processing.


--
-- END --
--