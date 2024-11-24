#!/bin/bash

# Function to display help message
show_help() {
  echo "Usage: $0 -i <input_script> [-o <output_dir>] [-e <ratools_dir>]"
  echo ""
  echo "  -i, --input     Path to the input script"
  echo "  -o, --output    Path to the output directory (can also be set as RATOOLS_OUTPUT_DIR environment variable)"
  echo "  -e, --exe       Path to the RATools directory (can also be set as RATOOLS_DIR environment variable)"
  echo "  -h, --help      Display this help message"
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -i|--input) input_script="$2"; shift ;;
    -o|--output) output_dir="$2"; shift ;;
    -e|--exe) ratools_dir="$2"; shift ;;
    -h|--help) show_help; exit 0 ;;
    *) echo "Unknown parameter passed: $1"; show_help; exit 1 ;;
  esac
  shift
done

# Check if required parameters are provided
if [ -z "$input_script" ]; then
  echo "Error: Missing required parameters."
  show_help
  exit 1
fi

# Use the provided RATools directory or fallback to the environment variable
ratools_dir="${ratools_dir:-$RATOOLS_DIR}"

# Check if RATools directory is set
if [ -z "$ratools_dir" ]; then
  echo "Error: Path to RATools directory is not provided."
  show_help
  exit 1
fi

# Use the provided output directory or fallback to the environment variable
output_dir="${output_dir:-$RATOOLS_OUTPUT_DIR}"

# Check if output directory is set
if [ -z "$output_dir" ]; then
  echo "Error: Path to output directory is not provided."
  show_help
  exit 1
fi

# Construct the full path to rascript-cli.exe
ratools_cli_path="$ratools_dir/rascript-cli.exe"

# Run the wine command with the specified input and output
wine "$ratools_cli_path" -i "$input_script" -o "$output_dir"
