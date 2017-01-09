# Usage

1. `bundle install` to make sure you have installed the required dependencies.

2. `rake start` to start the program.

3. Before drawing anything, a `Canvas` must be initialized, for instance: `C 20 4`.

4. Start drawing with commands (as described below)!

5. `Q` to quit the program.

# Commands

## Canvas
Format: `C width height`
- `width`: the width of the canvas.
- `height`: the height of the canvas.

Example: `C 20 4`

A canvas is required before drawing any graphs, and drawing a new canvas will replace the current drawing.

## Line
Format: `L start_x start_y end_x end_y`
- `start_x`, `start_y`: the coordinate of the starting point of the line.
- `end_x`, `end_y`: the x coordinate of the end point of the line.

Example: `L 2 4 2 7`

Only vertical and horizontal lines are supported.

## Rectangle
Format: `R left_top_x left_top_y right_bottom_x right_bottom_y`
- `left_top_x`, `left_top_y`: the coordinate of the left top corner of the rectangle.
- `right_bottom_x`, `right_bottom_y`: the coordinate of the right bottom corner of the rectangle.

Example: `R 1 4 3 6`

## Bucket Fill
Format: `B start_x start_y color`
- `start_x`, `start_y`: the coordinate of the point to start filling.
- `color`: the color to fill. If it is not given, by default `O` is used.

Example: `B 3 4 +`

 
 


