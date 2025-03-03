#!/bin/bash

# Path to the CSV file (initially empty)
CSV_FILE="data.csv"

# Function to display the menu
function display_menu {
  echo "Select an option:"
  echo "1. CREATE CSV by name"
  echo "2. Display all CSV DATA with row INDEX"
  echo "3. Read user input for new row"
  echo "4. Read Species (OT for example) and Display all Items of that species type and the AVG weight"
  echo "5. Read Species sex (M/F) and display all items of species-sex"
  echo "6. Save last output to a new CSV file"
  echo "7. Delete row by row index"
  echo "8. Update weight by row index"
  echo "9. Exit"
}

# Function to create a new CSV file with a specified name
function create_csv {
  echo "Enter the name of the new CSV file (e.g., 'plants.csv'): "
  read new_csv_name
  CSV_FILE="$new_csv_name"
  touch "$CSV_FILE"  # Create the new CSV file
  echo "Created new CSV file: $CSV_FILE"
}

# Function to display all CSV data with row index
function display_csv {
  echo "Displaying all CSV data with row index:"
  awk '{print NR, $0}' "$CSV_FILE"
}

# Function to add a new record to the CSV file
function add_record {
  echo "Enter the Date collected (e.g., 7/15): "
  read date_collected
  echo "Enter the Species (e.g., PF, OT): "
  read species
  echo "Enter the Sex (M/F): "
  read sex
  echo "Enter the Weight: "
  read weight

  # Append new record to the CSV file
  echo "$date_collected,$species,$sex,$weight" >> "$CSV_FILE"
  echo "Record added successfully."
}

# Function to display all items of a species and calculate the average weight
function display_species {
  echo "Enter the species to search for (e.g., OT, PF): "
  read species
  echo "Displaying all items of species $species and calculating average weight..."
  
  # Extract all rows for the given species
  species_data=$(grep ",$species," "$CSV_FILE")
  echo "$species_data"
  
  # Calculate average weight
  avg_weight=$(echo "$species_data" | awk -F',' '{sum+=$4} END {if (NR > 0) print sum/NR; else print "No data"}')
  echo "Average weight for species $species: $avg_weight"
}

# Function to display all items of a species and sex (M/F)
function display_species_sex {
  echo "Enter the species (e.g., OT, PF): "
  read species
  echo "Enter the sex (M/F): "
  read sex
  echo "Displaying all items of species $species and sex $sex..."
  
  # Extract all rows for the given species and sex
  species_sex_data=$(grep ",$species,$sex," "$CSV_FILE")
  echo "$species_sex_data"
}

# Function to save the last output to a new CSV file
function save_last_output {
  echo "Enter the name of the new CSV file to save the output (e.g., 'output.csv'): "
  read new_file
  echo "$last_output" > "$new_file"
  echo "Last output saved to $new_file"
}

# Function to delete a row by index
function delete_row {
  echo "Enter the row index to delete (e.g., 1): "
  read row_index
  sed -i "${row_index}d" "$CSV_FILE"
  echo "Row $row_index deleted."
}

# Function to update the weight by row index
function update_weight {
  echo "Enter the row index to update (e.g., 1): "
  read row_index
  echo "Enter the new weight: "
  read new_weight
  sed -i "${row_index}s/\([0-9]*,[0-9]*,[A-Za-z]*,\)[0-9\.]*/\1$new_weight/" "$CSV_FILE"
  echo "Weight updated in row $row_index."
}

# Main script loop
while true; do
  display_menu
  read -p "Enter your choice: " choice

  case $choice in
    1) create_csv ;;
    2) display_csv ;;
    3) add_record ;;
    4) display_species ;;
    5) display_species_sex ;;
    6) save_last_output ;;
    7) delete_row ;;
    8) update_weight ;;
    9) echo "Exiting..."; break ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done
