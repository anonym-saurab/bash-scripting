### taking input the domain
echo "enter the domain or ip"
read ip_addr

### defining a file for saving the results
data_details=data_results.txt

### clears the file if it exists
> "$data_details"

echo "extracting the whois info from the site $ip_addr"
whois "$ip_addr" >> "$data_details"

echo "extracting dns data from the site $ip_addr using dig"
dig "$ip_addr" >> "$data_details"

echo "finding emails from the site $ip_addr"
curl -s "$ip_addr" | grep -oE '[a-zA-Z0-9._%+-]+@[a-z]+.[a-z]' >> "$data_details"
