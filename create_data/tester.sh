test_types=("continous" "nightly" "weekly") 
ticket=1111
found=0
for item in "${test_types[@]}"
do
    if [[ "$item" == "$1" ]]; then
        found=1
        break
    fi
done
if [[ $found -eq 1 ]]; then
	sum=$((5+45))
	return_data=return_data.txt
	dirname=$(basename $(pwd))
	result_dir="../../regression_tests_results/$dirname"
	mkdir -p ${result_dir}
	echo $sum > ${result_dir}/${return_data}
	diff $result_dir/$return_data out.gout > ${result_dir}/diff 
	if [ -s "$result_dir/diff" ]; then
	    echo "FAIL" > $result_dir/result.txt
	    echo "$dirname: FAIL" >> ../../test_result.txt
	else
	    echo "PASS" > $result_dir/result.txt
	    echo "$dirname: PASS" >> ../../test_result.txt
	fi
fi
