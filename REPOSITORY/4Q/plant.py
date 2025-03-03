import matplotlib.pyplot as plt


plant = "Rose"
height_data = [50, 55, 60, 65, 70]  # Height data over time (in cm)
leaf_count_data = [35, 40, 45, 50, 55]  # Leaf count over time
dry_weight_data = [2.0, 2.0, 2.1, 2.1, 3.0]  # Dry weight over time (in grams)

# Print out the plant data (optional)
print(f"Plant: {plant}")
print(f"Height data: {height_data} cm")
print(f"Leaf count data: {leaf_count_data}")
print(f"Dry weight data: {dry_weight_data} g")

# Scatter Plot - Height vs Leaf Count
plt.figure(figsize=(10, 6))
plt.scatter(height_data, leaf_count_data, color='b')
plt.title(f'Height vs Leaf Count for {plant}')
plt.xlabel('Height (cm)')
plt.ylabel('Leaf Count')
plt.grid(True)
plt.savefig(f"{plant}_scatter.png")
plt.close()  # Close the plot to prepare for the next one

# Histogram - Distribution of Dry Weight
plt.figure(figsize=(10, 6))
plt.hist(dry_weight_data, bins=5, color='g', edgecolor='black')
plt.title(f'Histogram of Dry Weight for {plant}')
plt.xlabel('Dry Weight (g)')
plt.ylabel('Frequency')
plt.grid(True)
plt.savefig(f"{plant}_histogram.png")
plt.close()  # Close the plot to prepare for the next one

# Line Plot - Plant Height Over Time
weeks = ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5']  # Time points for the data
plt.figure(figsize=(10, 6))
plt.plot(weeks, height_data, marker='o', color='r')
plt.title(f'{plant} Height Over Time')
plt.xlabel('Week')
plt.ylabel('Height (cm)')
plt.grid(True)
plt.savefig(f"{plant}_line_plot.png")
plt.close()  # Close the plot

# Output confirmation
print(f"Generated plots for {plant}:")
print(f"Scatter plot saved as {plant}_scatter.png")
print(f"Histogram saved as {plant}_histogram.png")
print(f"Line plot saved as {plant}_line_plot.png")

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

