#!/bin/bash

read -p "Target": target
read -p "Specify output text file": output
touch $output
echo "SUBDOMAIN ENUMERATION"|tee -a $output
echo "-----------LOL---------------"
echo "------------sublist3r tool---------"
sublist3r -d $target -o s1.txt 
echo "--------------subfinder tool-----------"
subfinder -d $target -o s2.txt 
echo "------------knockpy tool-------------"
knockpy  $target | tee -a $output 
echo "-----------dnsrecon tool----------"
dnsrecon -n 8.8.8.8 -d $target| tee -a $output
cat s1.txt s2.txt > $output
rm s1.txt && rm s2.txt
sort $output | uniq -u
echo "completed scaning..........:) "
cat $output
