#!/bin/bash

# Usage: ./run_solution.sh <problem_number> <language> [variant]

# Get arguments
problem_number=$1
language=$2
variant=${3:-}  # Optional variant, empty if not provided

#echo "Running solution for problem ${problem_number} in ${language} with variant ${variant}"
# Format problem number with leading zeros (e.g., 0001, 0002)
formatted_problem_number=$(printf "%04d" "$((10#$problem_number))")

# Define the solution file path based on the pattern
if [ -z "$variant" ]; then
  # No variant specified, match files without variant in the name
  solution_file="./${formatted_problem_number}_${language}.*"
else
  # Variant specified, include it in the file matching pattern
  solution_file="./${formatted_problem_number}_${language}_${variant}.*"
fi

# Find the file with the appropriate extension based on language
case $language in
  python) interpreter="python3.11" ;;
  rust) interpreter="cargo run --release --manifest-path" ;;
  go) interpreter="go run" ;;
  java) interpreter="javac" && java_command="java -cp ." ;;
  crystal) interpreter="crystal run" ;;
  typescript) interpreter="ts-node" ;;
  elixir) interpreter="elixir" ;;
  csharp) interpreter="dotnet run --project" ;;
  scala) interpreter="scala" ;;
  bash) interpreter="bash" ;;
  *) echo "Unsupported language"; exit 1 ;;
esac

# Locate the solution file
solution_path=$(ls $solution_file 2>/dev/null | head -n 1)
#echo $solution_path

if [ -f "$solution_path" ]; then
  if [[ $language == "java" ]]; then
    # Compile the Java file
    #echo $interpreter $solution_path
    $interpreter $solution_path
    
    # Extract the class name from the filename (e.g., solution_0001_java_parallel.java -> SolutionParallel)
    class_name="Solution${variant^}"
    # Run the compiled Java class
    $java_command "$class_name"

    rm -f ./*.class
  elif [[ $language == "rust" || $language == "csharp" ]]; then
    # Rust and C# have specific project-based run commands
    $interpreter $solution_path
  else
    # Run other languages normally
    $interpreter $solution_path
  fi
else
  echo "Solution file not found for problem ${problem_number} in ${language} with variant ${variant}"
fi
