#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
RESET='\033[0m'

echo -e "${PURPLE} ---------------------------------------------------------------${RESET}"
echo -e "${PURPLE}                    TESTING INPUT FILE${RESET}"
echo -e "${PURPLE} ---------------------------------------------------------------\n${RESET}"

echo -e "${RED}--> Missing file${RESET}"
.././cub3D

echo -e "${RED}--> Incorrect extension${RESET}"
.././cub3D srcs/main.c

echo -e "${RED}--> Inexistent file${RESET}"
.././cub3D --leak-check=full --show-leak-kinds=all blabla.cub

echo -e "${RED}--> Directory with .cub ending${RESET}"
mkdir "test.cub" ; .././cub3D --leak-check=full --show-leak-kinds=all "test.cub" ; rm -rf "test.cub"

echo -e "${PURPLE} ---------------------------------------------------------------${RESET}"
echo -e "${PURPLE}                    TESTING TYPE IDENTIFIERS${RESET}"
echo -e "${PURPLE} ---------------------------------------------------------------\n${RESET}"

echo -e "${RED}--> Missing a type identifier${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/id_missing.cub

echo -e "${RED}--> Has a type identifier multiple times${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/id_multiple.cub

echo -e "${RED}--> A type identifier is not the first element of a line${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/id_not_first.cub

echo -e "${RED}--> A texture is not readable${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/nonvalid_texture.cub

echo -e "${RED}--> Color has an extra comma${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/extra_comma.cub

echo -e "${RED}--> Color has an rgb higher than 255${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/300rgb.cub

echo -e "${GREEN}--> Has spaces befor type identifier${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/map.cub

echo -e "${PURPLE} ---------------------------------------------------------------${RESET}"
echo -e "${PURPLE}                        TESTING MAP${RESET}"
echo -e "${PURPLE} ---------------------------------------------------------------\n${RESET}"

echo -e "${RED}--> Invalid non-map character${RESET}"
valgrind .././cub3D maps/nonmap_char.cub

echo -e "${RED}--> Two players${RESET}"
valgrind .././cub3D maps/two_players.cub

echo -e "${RED}--> No players${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/no_players.cub

echo -e "${RED}--> Not surrounded by walls${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/not_surrounded.cub

echo -e "${RED}--> has spaces in the middle of the map${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/spaced.cub

echo -e "${GREEN}--> Egypt${RESET}"
valgrind --leak-check=full --show-leak-kinds=all .././cub3D maps/Egypt.cub

echo -e "${GREEN}--> Egypt${RESET}"
.././cub3D maps/Maze.cub
