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


Selection: 5

  |                                                                                                               |   0%

| Missing values play an important role in statistics and data analysis. Often, missing values must not be ignored, but
| rather they should be carefully studied to see if there's an underlying pattern or cause for their missingness.

...

  |======                                                                                                         |   5%
| In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense). In this
| lesson, we'll explore missing values further.

...

  |===========                                                                                                    |  10%
| Any operation involving NA generally yields NA as the result. To illustrate, let's create a vector c(44, NA, 5, NA)
| and assign it to a variable x.

> x <- c(44, NA, 5, NA)

| Keep working like that and you'll get there!

  |=================                                                                                              |  15%
| Now, let's multiply x by 3.

> x * 3
[1] 132  NA  15  NA

| You got it right!

  |======================                                                                                         |  20%
| Notice that the elements of the resulting vector that correspond with the NA values in x are also NA.

...

  |============================                                                                                   |  25%
| To make things a little more interesting, lets create a vector containing 1000 draws from a standard normal
| distribution with y <- rnorm(1000).

> y <- rnorm(1000)

| You nailed it! Good job!

  |=================================                                                                              |  30%
| Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).

> z <- rep(NA, 1000)

| That's a job well done!

  |=======================================                                                                        |  35%
| Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't know how
| many NAs we'll wind up with or what positions they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).

> my_data <- sample(c(y, z), 100)

| You're the best!

  |============================================                                                                   |  40%
| Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each
| element of a vector is NA. Call is.na() on my_data and assign the result to my_na.

> my_na <- is.na(my_data)

| You got it!

  |==================================================                                                             |  45%
| Now, print my_na to see what you came up with.

> my_na
  [1]  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [20] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
 [39] FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
 [58]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
 [77]  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
 [96] FALSE  TRUE  TRUE  TRUE  TRUE

| Nice work!

  |========================================================                                                       |  50%
| Everywhere you see a TRUE, you know the corresponding element of my_data is NA. Likewise, everywhere you see a FALSE,
| you know the corresponding element of my_data is one of our random draws from the standard normal distribution.

...

  |=============================================================                                                  |  55%
| In our previous discussion of logical operators, we introduced the `==` operator as a method of testing for equality
| between two objects. So, you might think the expression my_data == NA yields the same results as is.na(). Give it a
| try.

> my_data == NA
  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [39] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [77] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

| You are doing so well!

  |===================================================================                                            |  60%
| The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is
| not available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same
| length as my_data that contains all NAs.

...

  |========================================================================                                       |  65%
| Don't worry if that's a little confusing. The key takeaway is to be cautious when using logical expressions anytime
| NAs might creep in, since a single NA value can derail the entire thing.

...

  |==============================================================================                                 |  70%
| So, back to the task at hand. Now that we have a vector, my_na, that has a TRUE for every NA and FALSE for every
| numeric value, we can compute the total number of NAs in our data.

...

  |===================================================================================                            |  75%
| The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
| Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.

...

  |=========================================================================================                      |  80%
| Let's give that a try here. Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the
| total number of NAs in my_data. Don't assign the result to a new variable.

> my_data <- sum(my_na)

| Nice try, but that's not exactly what I was hoping for. Try again. Or, type info() for more options.

| Use sum(my_na) to count the number NAs in the data.

> sum(my_na)
[1] 53

| Nice work!

  |==============================================================================================                 |  85%
| Pretty cool, huh? Finally, let's take a look at the data to convince ourselves that everything 'adds up'. Print
| my_data to the console.

> my_data
  [1]          NA  0.52583179 -0.17267763  0.73153217          NA  0.11766112          NA -0.31407534          NA
 [10]          NA -0.88350496          NA -1.09853041          NA          NA          NA          NA          NA
 [19]          NA  0.08353935 -1.13885803          NA  0.82342099  0.27621350  0.36816803          NA          NA
 [28]  0.94407551  0.37146179 -0.94351589 -0.94632628  0.22766413  0.29810425          NA          NA -0.18848146
 [37]  1.12471558 -1.00864742 -0.06794505          NA          NA          NA  1.84060811          NA  0.94854230
 [46]          NA  0.52817197 -1.57784210  0.73397694          NA          NA -0.33968402          NA          NA
 [55]          NA          NA -0.59616995          NA  1.25924549  1.35307377          NA          NA  0.44554366
 [64]          NA  0.35642796          NA          NA -1.57195415  1.79061229 -0.67160562 -0.29062311 -1.12131212
 [73]          NA          NA          NA          NA          NA  0.31520334          NA          NA          NA
 [82]  0.18924427          NA -0.80330185 -0.43597640 -1.12124848          NA          NA  1.08329987          NA
 [91]          NA          NA  0.26716076 -0.68077718          NA -0.37821981          NA          NA          NA
[100]          NA

| You got it right!

  |====================================================================================================           |  90%
| Now that we've got NAs down pat, let's look at a second type of missing value -- NaN, which stands for 'not a number'.
| To generate NaN, try dividing (using a forward slash) 0 by 0 now.

> 0 / 0
[1] NaN

| Excellent work!

  |=========================================================================================================      |  95%
| Let's do one more, just for fun. In R, Inf stands for infinity. What happens if you subtract Inf from Inf?

> Inf - Inf
[1] NaN

| Keep working like that and you'll get there!

  |===============================================================================================================| 100%
