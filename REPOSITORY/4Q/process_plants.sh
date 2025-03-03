#!/bin/bash

# Step 1: Check if a CSV file is provided
if [ -z "$1" ]; then
  echo "Error: Please provide the path to the CSV file."
  exit 1
fi

# Step 2: Define the CSV file path
CSV_FILE=$1

# Step 3: Check if the Python virtual environment exists, create if it does not
VENV_DIR=~/plant_venv
if [ ! -d "$VENV_DIR" ]; then
  echo "Creating Python virtual environment..."
  python3 -m venv "$VENV_DIR"
  echo "Python virtual environment created."
fi

# Step 4: Activate the virtual environment
source "$VENV_DIR/bin/activate"
echo "Virtual environment activated."

# Step 5: Install necessary libraries if they aren't installed
pip install matplotlib pandas argparse

# Step 6: Read the CSV file line by line and process each plant
echo "Processing CSV file: $CSV_FILE"

while IFS=, read -r plant height leaf_count dry_weight
do
  # Skip the header row
  if [[ "$plant" == "Plant" ]]; then
    continue
  fi

  # Step 7: Log the plant processing
  echo "Processing plant: $plant"
  echo "Height: $height"
  echo "Leaf count: $leaf_count"
  echo "Dry weight: $dry_weight"

  # Step 8: Create a folder for the plant
  PLANT_DIR=~/Work_Course_Linux/REPOSITORY/4Q/"$plant"
  mkdir -p "$PLANT_DIR"
  echo "Folder created for $plant: $PLANT_DIR"

  # Step 9: Run the Python script for this plant
  echo "Running Python script for $plant..."
  python3 ~/Work_Course_Linux/REPOSITORY/4Q/plant_plots.py \
    --plant "$plant" \
    --height $height \
    --leaf_count $leaf_count \
    --dry_weight $dry_weight \
    > "$PLANT_DIR/${plant}_run.log" 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Python script executed successfully for $plant."
    echo "Generated plots for $plant."
  else
    echo "Error: Python script failed for $plant."
  fi
done < "$CSV_FILE"

# Step 10: Deactivate the virtual environment
deactivate
echo "Virtual environment deactivated."
echo "Script completed."
