# Cub3D Tester

This is a tester script for the Cub3D application. It is designed to run various tests and check for potential issues or errors in the program. The script executes different test cases and provides feedback on the results.

## Usage

To run the tester, simply execute the following commands:
```
git clone https://github.com/HaniaKhater/cub3D_Tester/
cd cub3D_Tester/
./tester.sh
```

## Test Cases

The tester performs the following test cases:

### Testing Input File
- Missing file
- Incorrect extension
- Inexistent file
- Directory with .cub ending

### Testing Type Identifiers
- Missing a type identifier
- Has a type identifier multiple times
- A type identifier is not the first element of a line
- A texture is not readable
- Color has an extra comma
- Color has an RGB value higher than 255
- Has spaces before the type identifier

### Testing Map
- Invalid non-map character
- Two players
- No players
- Not surrounded by walls
- Has spaces in the middle of the map
- Egypt
- Playable

## Feedback

After running each test case, the script provides color-coded feedback:
- Red indicates a test case that should fail or encounter an error and have no valgrind errors.
- Green indicates a test case that should pass successfully and should open a window.
- Purple is used for section headers.

The script utilizes the `valgrind` tool to perform memory leak checks on selected test cases.

Please note that the actual behavior of the Cub3D application should be verified based on the provided feedback.
