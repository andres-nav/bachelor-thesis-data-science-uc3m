#!/bin/bash

# Directory containing images
DIRECTORY="$1"

# Check if directory is provided
if [ -z "$DIRECTORY" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Directory $DIRECTORY does not exist."
  exit 1
fi

# Create a directory for optimized images
OPTIMIZED_DIR="$DIRECTORY/optimized"
mkdir -p "$OPTIMIZED_DIR"

# Index file
INDEX_FILE="$DIRECTORY/index.txt"
echo "Image Index:" > "$INDEX_FILE"

# Process each image in the directory
for IMAGE in "$DIRECTORY"/*.{jpg,jpeg,png,gif}; do
  if [[ -f "$IMAGE" ]]; then
    # Get the image name
    IMAGE_NAME=$(basename "$IMAGE")

    # Optimize and compress image
    case "$IMAGE_NAME" in
      *.jpg|*.jpeg)
        jpegoptim --max=85 --strip-all "$IMAGE" -d "$OPTIMIZED_DIR"
        ;;
      *.png)
        optipng -o7 "$IMAGE" -out "$OPTIMIZED_DIR/$IMAGE_NAME"
        ;;
      *.gif)
        # If you have gifs, use gifsicle (you may need to install it)
        gifsicle -O3 "$IMAGE" -o "$OPTIMIZED_DIR/$IMAGE_NAME"
        ;;
    esac

    # Append to the index file
    echo "$IMAGE_NAME optimized and saved to $OPTIMIZED_DIR" >> "$INDEX_FILE"
  fi
done

echo "Optimization complete. Index saved to $INDEX_FILE."
