import argparse
import matplotlib.pyplot as plt

# Function to parse command-line arguments
def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate plant plots.')
    
    # Adding command-line arguments
    parser.add_argument('--plant', type=str, required=True, help='Name of the plant')
    parser.add_argument('--height', type=float, nargs='+', required=True, help='Height data for the plant')
    parser.add_argument('--leaf_count', type=int, nargs='+', required=True, help='Leaf count data for the plant')
    parser.add_argument('--dry_weight', type=float, nargs='+', required=True, help='Dry weight data for the plant')
    
    return parser.parse_args()

# Function to generate and save plots
def generate_plots(plant, height, leaf_count, dry_weight):
    # Scatter Plot
    plt.figure()
    plt.scatter(height, leaf_count, color='b')
    plt.title(f'{plant} - Scatter Plot')
    plt.xlabel('Height (cm)')
    plt.ylabel('Leaf Count')
    plt.savefig(f'{plant}_scatter.png')

    # Histogram Plot
    plt.figure()
    plt.hist(dry_weight, bins=5, color='g')
    plt.title(f'{plant} - Histogram')
    plt.xlabel('Dry Weight (g)')
    plt.ylabel('Frequency')
    plt.savefig(f'{plant}_histogram.png')

    # Line Plot
    plt.figure()
    plt.plot(height, dry_weight, color='r', marker='o')
    plt.title(f'{plant} - Line Plot')
    plt.xlabel('Height (cm)')
    plt.ylabel('Dry Weight (g)')
    plt.savefig(f'{plant}_line_plot.png')

# Main function to run the script
if __name__ == "__main__":
    args = parse_arguments()  # Parse the arguments
    generate_plots(args.plant, args.height, args.leaf_count, args.dry_weight)  # Generate the plots
    print(f"Generated plots for {args.plant}:")
    print(f"Scatter plot saved as {args.plant}_scatter.png")
    print(f"Histogram saved as {args.plant}_histogram.png")
    print(f"Line plot saved as {args.plant}_line_plot.png")
import argparse
import matplotlib.pyplot as plt

# Function to parse command-line arguments
def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate plant plots.')
    
    # Adding command-line arguments
    parser.add_argument('--plant', type=str, required=True, help='Name of the plant')
    parser.add_argument('--height', type=float, nargs='+', required=True, help='Height data for the plant')
    parser.add_argument('--leaf_count', type=int, nargs='+', required=True, help='Leaf count data for the plant')
    parser.add_argument('--dry_weight', type=float, nargs='+', required=True, help='Dry weight data for the plant')
    
    return parser.parse_args()

# Function to generate and save plots
def generate_plots(plant, height, leaf_count, dry_weight):
    # Scatter Plot
    plt.figure()
    plt.scatter(height, leaf_count, color='b')
    plt.title(f'{plant} - Scatter Plot')
    plt.xlabel('Height (cm)')
    plt.ylabel('Leaf Count')
    plt.savefig(f'{plant}_scatter.png')

    # Histogram Plot
    plt.figure()
    plt.hist(dry_weight, bins=5, color='g')
    plt.title(f'{plant} - Histogram')
    plt.xlabel('Dry Weight (g)')
    plt.ylabel('Frequency')
    plt.savefig(f'{plant}_histogram.png')

    # Line Plot
    plt.figure()
    plt.plot(height, dry_weight, color='r', marker='o')
    plt.title(f'{plant} - Line Plot')
    plt.xlabel('Height (cm)')
    plt.ylabel('Dry Weight (g)')
    plt.savefig(f'{plant}_line_plot.png')

# Main function to run the script
if __name__ == "__main__":
    args = parse_arguments()  # Parse the arguments
    generate_plots(args.plant, args.height, args.leaf_count, args.dry_weight)  # Generate the plots
    print(f"Generated plots for {args.plant}:")
    print(f"Scatter plot saved as {args.plant}_scatter.png")
    print(f"Histogram saved as {args.plant}_histogram.png")
    print(f"Line plot saved as {args.plant}_line_plot.png")
