#!/bin/bash

while getopts :abcdefghijklmn options
do
case $options in
 	a)
		read -p "Első összeadando szám: " num1
		read -p "Második összeadando szám: " num2
		echo "Az összeadás eredménye: $(($num1+$num2))"
		;;

	b)
		read -p "Adja meg a számot, amiből ki szeretne vonni: " num1
  	        read -p "Adja meg a kivonandót: " num2
		echo "A kivonás eredménye: $(($num1-$num2))"
		;;

	c)
		read -p "Első szorzandó szám: " num1
	        read -p "Második szorzandó szám: " num2
		echo "A szorzás eredménye: $(($num1*$num2))"
		;;

	d)
		read -p "Adja meg az osztandót: " num1
	        read -p "Adja meg az osztót: " num2
		echo "Az osztás eredménye: $(($num1/num2))"
		;;

	e)
		DATUM=`date '+%a'`
		echo "Mai nap: $DATUM"
		;;

	f)
		now=$(date)
		echo "Mai dátum: $now"
		;;

	g)
		echo "A négyzet oldalának hossza: "
		read A
		KER=`expr $A \* 4`
		TER=$(($A * $A))
		echo -e "Kerület: $KER\nTerület: $TER"
		;;
	h)
		echo "Az edény átmérője(cm): "
		read R2
		echo "Az edény magassága(cm): "
		read M
		R=$(($R2/2))
		T1=$(($R*$R))
		T2=$(($T1*3))
		V=$(($T2*$M))
		echo "Az edény kapacitása: $V cm3"
		#Több óra próbálkozás után sem tudtam lebegőpontos számot kiiratni eredményként, ezért a pi helyett szimplán csak 3-at használtam
		;;

	i)
		echo -n "Login név: "
		read NAME
		FULLNAME=$(cat /etc/passwd | grep ^$NAME: | cut -d: -f5 | cut -d , -f 1)
		echo "A felhasználó teljes neve: $FULLNAME"
		;;
	j)
		curl -H "Accept: application/json" https://www.randomlists.com/random-words -o list.json
		exit
		;;
	k)
		cat /etc/passwd | cut -d : -f 3 | sort n
		;;

	l)
		lspci | grep Eth
	        ;;
	m)
		ls -l /etc | cut -c 5-7 | grep r-x | wc -l
	        ;;
	n)
        echo "Kilépés"
        exit
	;;
esac
done

