# Allegro Hello World in Prolog
This is a simple hello world program using the [Allegro graphics library](https://liballeg.org/) and written in Prolog.
## Prerequisites
1. Install [SWI Prolog](https://www.swi-prolog.org/)
2. Install [Allegro](https://liballeg.org/)
## Build Instructions
1. Either clone this project with git, or download it from this page and extract the file.
2. Using your terminal, enter the directory for this project on your computer.
3. Run the following command to build the C bindings: `swipl-ld -lallegro -lallegro_main -lallegro_font -o allegro_binding -shared allegro_binding.c`
## Screenshot
![Picture of the program running](https://github.com/d4v3y5c0n3s/Allegro-Hello-World-in-Prolog/raw/master/AllegroTestGameRunning.png
