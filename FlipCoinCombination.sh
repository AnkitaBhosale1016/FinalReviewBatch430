declare -A fStore

isFlip=0
max=0
temp=0
function Flip()
{
	for((i=0; i<$1; i++))
	do
		side=" "
		for((j=0; j<$2; j++))
		do
			fCoin=$((RANDOM%2))
			if [ $fCoin -eq $isFlip ]
			then
				side+=H
			else
				side+=T
			fi
		done
		fStore[$side]=$((${fStore[$side]}+1))
	done
	echo "Count of all combination  :${fStore[@]}"
}
function totalPerFlip()
{
	for count in ${!fStore[@]}
	{
		fStore[$count]=`echo "scale=2; $((${fStore[$count]}))/$time*100 " | bc`
		temp=${fStore[$count]}
		if (( $(echo "$temp >= $max"| bc) ))
		then
			max=$temp
			key=$count
		fi
	}
}
read -p "Enter no. of times you want to flip:" time
read -p "Enter choice 1)Singlet 2)Doublet 3)Triplet and so on:" coins
Flip $time $coins

totalPerFlip
echo "All Head and Tail Combination :${!fStore[@]}"
echo "Percentage of All Combinations :${fStore[@]}"
echo "  Combinations      :" $max "-" $key