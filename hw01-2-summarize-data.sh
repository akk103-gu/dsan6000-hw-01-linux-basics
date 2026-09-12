cd data/hourly
touch wikimedia_data_summary.csv
echo "filename,size,num_lines" > wikimedia_data_summary.csv

for file in *; do
	if [ -f "$file" ]; then
		base=$(basename "$file")
		size=$(du -sh "$file" | cut -f1)
		lines=$(wc -l < "$file")
		echo "$base,$size,$lines" >> wikimedia_data_summary.csv
	fi
done

sed -i '$d' wikimedia_data_summary.csv
mv wikimedia_data_summary.csv ../../
