#!/bin/bash

# Path to the CSV file
CSV_FILE="data.csv"

# Function to display the menu
function display_menu {
  echo "Select an option:"
  echo "1. View CSV file"
  echo "2. Add new record"
  echo "3. Search for a species"
  echo "4. Delete a record"
  echo "5. Exit"
}

# Function to view the CSV file
function view_csv {
  echo "Displaying the CSV content:"
  cat "$CSV_FILE"
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

# Function to search for a species
function search_species {
  echo "Enter the species to search for: "
  read species
  echo "Searching for species: $species"
  grep "$species" "$CSV_FILE"
}

# Function to delete a record
function delete_record {
  echo "Enter the record number to delete (starting from 1): "
  read record_number
  sed -i "${record_number}d" "$CSV_FILE"
  echo "Record $record_number deleted."
}

# Main script loop
while true; do
  display_menu
  read -p "Enter your choice: " choice

  case $choice in
    1) view_csv ;;
    2) add_record ;;
    3) search_species ;;
    4) delete_record ;;
    5) echo "Exiting..."; break ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done
