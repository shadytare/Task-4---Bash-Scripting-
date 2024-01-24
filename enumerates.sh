#!/bin/bash
input_file=$1
iterations=$2
output_file="subdomains_output.txt"

#Initial subdomain enumeration using amass and subfinder
amass_output=$(amass enum -d $input_file)
subfinder_output=$(subfinder -d $input_file)

#combine and sort the initial results
all_subdomains=$(echo -e "$amass_output\n$subfinder_output" | sort -u)

# Perform additional iterations
for ((i=1; i<$iterations; i++)); do
    # Enumerate subdomains from the previous result
    additional_output=$(echo "$all_subdomains" | while read -r line; do
        amass enum -d $line
        subfinder -d $line
    done)

    # Combine and sort the results
    all_subdomains=$(echo -e "$all_subdomains\n$additional_output" | sort -u)
done

# Save unique results to a file
echo "$all_subdomains" > $output_file
# Count the unique subdomains
subdomains_count=$(echo "$all_subdomains" | wc -l)

echo "Subdomains enumeration completed. Unique subdomains found: $subdomains_count."
echo "Results saved to $output_file."
