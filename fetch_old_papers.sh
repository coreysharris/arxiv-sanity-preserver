echo "How many new old papers do you want to get?"
read quant
n=$(find ./pdf/ -type f -maxdepth 1 | wc -l)
python fetch_papers.py --start_index $(($n-101)) --max_index $(($n+$quant))
