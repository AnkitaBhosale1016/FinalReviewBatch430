 Dictionary(){
	output=$(($1+$2*$3))
	echo "Result of a+b*c = : $output"
	output1=$(($1*$2+$3))
	echo "Result of a*b+c = : $output1"
	output2=$(($3+$1/$2))
	echo "Result of c+a/b = : $output2"
	output3=$(($1%$2+$3))
	echo "Result of a%b+c = : $output3"
	
	DictionaryItems=($output $output1 $output2 $output3)
	echo ${DictionaryItems[@]}
	for ((i = 0; i<5; i++))
	do
		for((j = 0; j<5-i-1; j++))
    		do
    
        		if [[ ${DictionaryItems[j]} -gt ${DictionaryItems[$((j+1))]} ]]
        		then
            
            			temp=${DictionaryItems[j]}
            			DictionaryItems[$j]=${DictionaryItems[$((j+1))]}  
            			DictionaryItems[$((j+1))]=$temp
        		fi
    		done
	done

	echo "Array in Ascending order :"
	echo ${DictionaryItems[*]}

	for ((i = 0; i<5; i++))
	do
    
    		for((j = 0; j<5-i-1; j++))
    		do
    
        		if [[ ${DictionaryItems[j]} -lt ${DictionaryItems[$((j+1))]} ]]
        		then
            
            			temp=${DictionaryItems[j]}
            			DictionaryItems[$j]=${DictionaryItems[$((j+1))]}  
            			DictionaryItems[$((j+1))]=$temp
        		fi
    		done
	done

	echo "Array in Descending order :"
	echo ${DictionaryItems[*]}	
	
}


read -p "Enter value of a : " a
read -p "Enter value of b : " b
read -p "Enter value of c : " c
Dictionary $a $b $c
