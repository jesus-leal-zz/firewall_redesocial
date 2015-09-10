#!/bin/bash
### Desenvolvido por Jesus Leal 
### contato@sysoplinux.com.br
### http://www.sysoplinux.com.br
HR_M1="0000"
HR_M2="0800"
HR_INI="1200"
HR_FIM="1330"
HR_N1="1800"
HR_N2="2359"
HR=$(date +%H%M)
FW="FIREWALL.SH"
for R in facebook twitter
do	
	if [ "$HR" -ge "$HR_M1" ] && [ "$HR" -lt "$HR_M2" ] ; then
		L=`cat $FW | grep -n "string \"$R" | awk -F":" '{print $1}'`
		T=$(cat $FW | grep "string \"$R" | awk -F" " {'print $11'})
		if [ "$T" == "DROP" ] ; then		
			sed -i "$L s/DROP/ACCEPT/" $FW
			echo $FW
			$FW restart
		elif exit ; then
			exit
		fi
	elif [ "$HR" -ge "$HR_M2" ] && [ "$HR" -lt "$HR_INI" ] ; then
		L=`cat $FW | grep -n "string \"$R" | awk -F":" '{print $1}'`
		T=$(cat $FW | grep "string \"$R" | awk -F" " {'print $11'})
		if [ "$T" == "ACCEPT" ] ; then		
			sed -i "$L s/ACCEPT/DROP/" $FW
			echo $FW
			$FW restart
		elif exit ; then
			exit
		fi
	elif [ "$HR" -ge "$HR_INI" ] && [ "$HR" -lt "$HR_FIM" ] ; then
		L=`cat $FW | grep -n "string \"$R" | awk -F":" '{print $1}'`
		T=$(cat $FW | grep "string \"$R" | awk -F" " {'print $11'})
		if [ "$T" == "DROP" ] ; then
			sed -i "$L s/DROP/ACCEPT/" $FW
			echo $FW
			$FW restart
		elif exit ; then
			exit
		fi
	elif [ "$HR" -ge "$HR_FIM" ] && [ "$HR" -lt "$HR_N1" ] ; then
		L=`cat $FW | grep -n "string \"$R" | awk -F":" '{print $1}'`
		T=$(cat $FW | grep "string \"$R" | awk -F" " {'print $11'})
		if [ "$T" == "ACCEPT" ] ; then
			sed -i "$L s/ACCEPT/DROP/" $FW
			echo $FW
			$FW restart
		elif exit ; then
			exit
		fi
	elif [ "$HR" -ge "$HR_N1" ] && [ "$HR" -lt "$HR_N2" ] ; then
		L=`cat $FW | grep -n "string \"$R" | awk -F":" '{print $1}'`
		T=$(cat $FW | grep "string \"$R" | awk -F" " {'print $11'})
		if [ "$T" == "DROP" ] ; then
			sed -i "$L s/DROP/ACCEPT/" $FW
			echo $FW
			$FW restart
		elif exit ; then
			exit
		fi
	fi
done
