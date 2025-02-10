# taking the directory name as input
echo "enter the directory path with the name you want to backup"
read dir_name

echo "enter the directory path you want the backuped data" 
read backedup_dir

mkdir -p /$backedup_dir ## checking if the destination full dir exists, if not then it will be created using -p

tar -czf /$backedup_dir/backuped_data_$(date +%F_%H-%M-%S).tar.gz $dir_name 
### +%F basically denotes and writes up the date in the format YYYY-MM-DD
### %H-%M-%S denotes and writes up the time in the format HH-MM-SS
### -p preserves the full permissions of the files
### -f is for defining the file name
### -c creates a new archive
### -z compresses the archive using gzip

echo "data saved in $backedup_dir"
