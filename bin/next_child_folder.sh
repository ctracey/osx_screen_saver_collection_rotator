#!/bin/bash
arguments=$@

params=()
for param in "$@"
do
  params+=( "$param" )
done

target_child_folder=${params[1]}
parent_folder="${params[0]}/"

child_folder_names=`ls -al "$parent_folder" | tail -n +5 | grep ^d | awk 'NF>1{print $NF}'`
child_folders=( ${child_folder_names//$'\n'/ } )

#find index of target child folder
for i in "${!child_folders[@]}"; do
   if [[ "${child_folders[$i]}" = "${target_child_folder}" ]]; then
       target_child_folder_index=$i
   fi
done

child_folders_length=${#child_folders[@]}

#when child folder doesnt exists or is last
if [ ! "${target_child_folder_index}" ] || [ $((target_child_folder_index+1)) = $child_folders_length ]
then
  #use first child folder
  next_child_folder=${child_folders[0]}
else
  #use the next child folder
  next_index=$((target_child_folder_index+1))
  next_child_folder=${child_folders[$next_index]}
fi

echo $next_child_folder
