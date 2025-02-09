# writing a Bash script that:
# Takes a directory name as input.
# Creates that directory.
# Moves all `.txt` files from the current directory into that folder.
# Logs all moved files into `logfile.txt`.

# taking the name of the directory as input
echo "Enter the Directory name :"
read new_dir

# creating the dir
mkdir $new_dir
current_dir=$(pwd)
echo "current dir is : $current_dir"

# moving all file from the current dir to the created dir
for file in *.txt; do
        if [ -f "$file" ]; then #-f checks if the txt file exist
                echo "moving all text files from $current_dir to $new_dir"
                mv "$file" "$new_dir"/ #we can also use /*.txt, which basically denotes every text file

                # logging the moved file in the logfile.txt
                echo "Moved $file at $(date)" > logfile.txt
        else 
                echo "not able to move files, no txt file inside the source directory
        fi
done
