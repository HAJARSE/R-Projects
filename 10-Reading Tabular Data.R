> install_course("The R Programming Environment")
  |===============================================================================================================| 100%

| Course installed successfully!

> swirl()

| Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new, call
| yourself something unique.

What shall I call you? Hajar

| Thanks, Hajar. Let's cover a couple of quick housekeeping items before we begin our first lesson. First of all, you
| should know that when you see '...', that means you should press Enter when you are done reading and ready to
| continue.

...  <-- That's your cue to press Enter to continue

| Also, when you see 'ANSWER:', the R prompt (>), or when you are asked to select from a list, that means it's your turn
| to enter a response, then press Enter to continue.

Select 1, 2, or 3 and press Enter

1: Continue.
2: Proceed.
3: Let's get going!

Selection: 1

| You can exit swirl and return to the R prompt (>) at any time by pressing the Esc key. If you are already at the
| prompt, type bye() to exit and save your progress. When you exit properly, you'll see a short message letting you know
| you've done so.

| When you are at the R prompt (>):
| -- Typing skip() allows you to skip the current question.
| -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
| -- UNTIL you type nxt() which will regain swirl's attention.
| -- Typing bye() causes swirl to exit. Your progress will be saved.
| -- Typing main() returns you to swirl's main menu.
| -- Typing info() displays these options again.

| Let's get started!

...

| Please choose a course, or type 0 to exit swirl.

1: The R Programming Environment
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Setting Up Swirl              2: Basic Building Blocks         3: Sequences of Numbers
 4: Vectors                       5: Missing Values                6: Subsetting Vectors
 7: Matrices and Data Frames      8: Logic                         9: Workspace and Files
10: Reading Tabular Data         11: Looking at Data              12: Data Manipulation          
13: Text Manipulation Functions  14: Regular Expressions          15: The stringr Package


Selection: 10

| Attempting to load lesson dependencies...

| Package ‘readr’ loaded correctly!

  |                                                                                                               |   0%

| The purpose of this lesson is to demonstrate some basic features of the 'readr' package in R for reading in tabular
| data.

...

  |=======                                                                                                        |   6%
| For some more details on the 'readr' package, you can refer to Section 1.3 of the book Mastering Software Development
| in R.

...

  |=============                                                                                                  |  12%
| For this lesson, we will be using a small dataset on zip codes in the United States. This table contains information
| about the percent of each zip codes that is considered urban by the U.S. Census Bureau.

...

  |====================                                                                                           |  18%
| First load the 'readr' package using the library() function.

> library(readr)

| Keep working like that and you'll get there!

  |==========================                                                                                     |  24%
| The file that we will be reading into R is called 'urban.csv.gz'. It is a comma-separated-value (CSV) file compressed
| with gzip.

...

  |=================================                                                                              |  29%
| The directory in which the 'urban.csv.gz' data file is located is saved in an R object called 'datapath'. Print out
| this object to see the path.

> print(datapath)
[1] "C:/Users/Hajar/Documents/R/win-library/4.0/swirl/Courses/The_R_Programming_Environment/Reading_Tabular_Data"

| You got it right!

  |=======================================                                                                        |  35%
| Use the 'file.path()' function to construct the full path to the 'urban.csv.gz' file and store it in an object called
| 'datafile'

> datafile <- file.path(datapath, "urban.csv.gz")

| That's correct!

  |==============================================                                                                 |  41%
| How would you read this file into R using the read_csv() function in the 'readr' function and save the resulting data
| frame to an object named 'urban'? Assume that the file is in your current working directory.

> urban <- read_csv(datafile)
Parsed with column specification:
cols(
  state = col_character(),
  zcta5 = col_double(),
  County = col_character(),
  PctUrban = col_double(),
  FIPS = col_character()
)

| All that practice is paying off!

  |====================================================                                                           |  47%
| Take a look at the first few rows of the 'urban' data frame object by calling the head() function on it

> head(urban)
# A tibble: 6 x 5
  state zcta5 County        PctUrban FIPS
  <chr> <dbl> <chr>            <dbl> <chr>
1 01    35004 St. Clair AL      64   01115
2 01    35005 Jefferson AL      79.8 01073
3 01    35006 Jefferson AL       0   01073
4 01    35007 Shelby AL         90.5 01117
5 01    35010 Tallapoosa AL     45.2 01123
6 01    35013 Blount AL        100   01009

| That's correct!

  |===========================================================                                                    |  53%
| You'll see that there are 5 columns - state, zcta5 (a 5-digit zip code identifier), County (the name of the county in
| which the zip code resides), PctUrban (the percentage of the zip code that is considered urban), and FIPS (a 5-digit
| identifier for the county).

...

  |=================================================================                                              |  59%
| Notice that the second column ("zcta5") was read in as an integer column. In most applications we will want this to be
| a character column.

...

  |========================================================================                                       |  65%
| How can we use the compact string representation of the 'col_types' argument to read_csv() to force the "zcta5" column
| to be character? Leave all of the other columns as the type that the currently are read in as and remember to save the
| output of read_csv() to an object named 'urban'.

> urban <- read_csv(datafile, col_types = "cccdc")

| You are quite good my friend!

  |==============================================================================                                 |  71%
| It turns out we also don't need the last column of the data frame (the "FIPS") column. In order to save some space, we
| would like to tell read_csv() to not read that last column.

...

  |=====================================================================================                          |  76%
| How can we tell read_csv() to not read in the last column of the table? Note that you can use the compact string
| representation of the 'col_types' argument for this too. Remember to save the output of read_csv() to an object named
| 'urban'. You can type 'play()' to play around in R before giving your answer.

> urban <- read_csv(datafile, col_types = "cccd-")

| You got it right!

  |===========================================================================================                    |  82%
| Take a look at the first few rows of the 'urban' data frame object by calling the head() function on it. Confirm that
| there are fewer columns now.

> head(urban)
# A tibble: 6 x 4
  state zcta5 County        PctUrban
  <chr> <chr> <chr>            <dbl>
1 01    35004 St. Clair AL      64
2 01    35005 Jefferson AL      79.8
3 01    35006 Jefferson AL       0
4 01    35007 Shelby AL         90.5
5 01    35010 Tallapoosa AL     45.2
6 01    35013 Blount AL        100

| Your dedication is inspiring!

  |==================================================================================================             |  88%
| Finally, we may only need the first few rows of a table at first and so it might make sense to tell read_csv() to only
| read in a few rows rather than the entire dataset.

...

  |========================================================================================================       |  94%
| Building on what we have done before, how would you additionally tell read_csv() to only read in the first 100 rows?
| Note that we still want to force the second column to be character and we do not want to read the last column.

> urban <- read_csv(datafile, col_types = "cccd-", n_max = 100)

| You're the best!

  |===============================================================================================================| 100%
