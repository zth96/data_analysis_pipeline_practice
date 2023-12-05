# Define the default target
all: results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png

# Define the rules for creating word counts
results/isles.dat: data/isles.txt
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat

results/abyss.dat: data/abyss.txt
	python scripts/wordcount.py --input_file=data/abyss.txt --output_file=results/abyss.dat

results/last.dat: data/last.txt
	python scripts/wordcount.py --input_file=data/last.txt --output_file=results/last.dat

results/sierra.dat: data/sierra.txt
	python scripts/wordcount.py --input_file=data/sierra.txt --output_file=results/sierra.dat

# Define the rules for creating plots
results/figure/isles.png: results/isles.dat
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png

results/figure/abyss.png: results/abyss.dat
	python scripts/plotcount.py --input_file=results/abyss.dat --output_file=results/figure/abyss.png

results/figure/last.png: results/last.dat
	python scripts/plotcount.py --input_file=results/last.dat --output_file=results/figure/last.png

results/figure/sierra.png: results/sierra.dat
	python scripts/plotcount.py --input_file=results/sierra.dat --output_file=results/figure/sierra.png

# Define the clean target
clean:
	rm -f results/*.dat results/figure/*.png

# Define the report target
report:
	jupyter-book build report
