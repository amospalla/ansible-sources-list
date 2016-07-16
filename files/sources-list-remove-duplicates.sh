#!/bin/bash

# for every line in sources.list:
#    if not a comment, get its first 3 tokens
#    for every file in sources.list.d:
#       if contains a line starting with those 3 tokens, delete it
#
# string [arch=...] is ignored when searching for similarities.
#
# exit status: 100: some file deleted
# exit status:   0: no file deleted

##########
# Checks #
##########
set -euf
set -o pipefail

if [[ ! -f /etc/apt/sources.list ]]
then
	echo "Error: /etc/apt/sources.list" does not exist.
	exit 1
fi

if [[ ! -d /etc/apt/sources.list.d ]]
then
	echo "Error: /etc/apt/sources.list.d" does not exist.
	exit 1
fi

#######
# Run #
#######

number_files_before="$(find /etc/apt/sources.list.d/ -type f | wc -l)"

sources_list="$(grep -v "^\s*#" /etc/apt/sources.list | sed -E 's/\[arch=[a-zA-Z0-9-]*\]//')" || true

echo "$sources_list" | while read line
do
	token1="$(echo "${line}" | awk '{print $1}')"
	token2="$(echo "${line}" | awk '{print $2}')"
	token3="$(echo "${line}" | awk '{print $3}')"

	find /etc/apt/sources.list.d/ -maxdepth 1 -type f | while read file
	do
		file_clean="$(cat "${file}" | grep -v "^\s*#" | sed -E 's/\[arch=[a-zA-Z0-9-]*\]//')" || true
		if echo "${file_clean}" | grep -q "^\s*${token1}\s\+${token2}\s\+${token3}\(\s\+\|$\)"
		then
			echo "Removing file ${file}"
			rm "${file}"
			continue
		else
			true
		fi
	done
done

number_files_after="$(find /etc/apt/sources.list.d/ -type f | wc -l)"

if [[ "${number_files_after}" -eq "${number_files_before}" ]]
then
	exit 0
elif [[ "${number_files_after}" -lt "${number_files_before}" ]]
then
	exit 100
else
	exit 1
fi
