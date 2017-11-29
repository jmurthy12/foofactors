<!-- README.md is generated from README.Rmd. Please edit that file -->
All implementation and documentation is an extension of Jennifer Bryan's [foofactors package.](https://github.com/jennybc/foofactors)

**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
devtools::install_github("jmurthy12/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

#### 1) Function : freq\_out()

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>        x     n
#>   <fctr> <int>
#> 1      a    25
#> 2      b    26
#> 3      c    17
#> 4      d    17
#> 5      e    15
```

###### Unit Test

Link for unit test is avalable [here](https://github.com/jmurthy12/foofactors/blob/master/tests/testthat/test_freq_out.R)

#### 2) Function : fbind()

Let's try fbind() on data sets "cars" and "mtcars"

``` r
str(mtcars)
#> 'data.frame':    32 obs. of  11 variables:
#>  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
#>  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
#>  $ disp: num  160 160 108 258 360 ...
#>  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
#>  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
#>  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
#>  $ qsec: num  16.5 17 18.6 19.4 17 ...
#>  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
#>  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
#>  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
#>  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

``` r
str(cars)
#> 'data.frame':    50 obs. of  2 variables:
#>  $ speed: num  4 4 7 7 8 9 10 10 10 11 ...
#>  $ dist : num  2 10 4 22 16 10 18 26 34 17 ...
```

``` r
fbind(mtcars$cyl[c(2, 3, 5)], cars$speed[c(1, 2, 3)])
#> [1] 6 4 8 4 4 7
#> Levels: 4 6 7 8
```

Let's work on Iris data set as suggested in class

``` r
str(iris)
#> 'data.frame':    150 obs. of  5 variables:
#>  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#>  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#>  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#>  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#>  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

###### Unit Test

Link for unit test is avalable [here](https://github.com/jmurthy12/foofactors/blob/master/tests/testthat/test_fbind.R)

I've made changes to Jenny Bryan's document starting from the below section.

#### 3) Function : check\_factor\_character()

check\_factor\_character() determines if factors are required

Returns :

TRUE : If factors are not required FALSE : If factors are required (i.e.., factors are not characters)

``` r
check_factor_character(iris$Species)
#> [1] FALSE
#> [1] FALSE
```

###### Unit Test

Link for unit test is avalable [here](https://github.com/jmurthy12/foofactors/blob/master/tests/testthat/test_check_factor_character.R)

#### 4) Function : reorder\_descending()

reorder\_descending() reorders the factor levels in descending order,this is used especially in plots as already discussed in fct\_reorder() section of [Homework 5](https://github.com/jmurthy12/STAT545-hw-murthy-janani/blob/master/hw05/hw05.md)

``` r
levels(iris$Species)
#> [1] "setosa"     "versicolor" "virginica"
levels(reorder_descending(iris$Species))
#> [1] "virginica"  "versicolor" "setosa"
```

###### Unit Test

Link for unit test is avalable [here](https://github.com/jmurthy12/foofactors/blob/master/tests/testthat/test_reorder_descending.R)

#### 5) Function : factor\_as\_orginal()

factor\_as\_orginal() re-orders the factor levels same as input data

``` r
library(gapminder)
factor_as_orginal(gapminder$continent)
#>    [1] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>    [8] Asia     Asia     Asia     Asia     Asia     Europe   Europe  
#>   [15] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>   [22] Europe   Europe   Europe   Africa   Africa   Africa   Africa  
#>   [29] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>   [36] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>   [43] Africa   Africa   Africa   Africa   Africa   Africa   Americas
#>   [50] Americas Americas Americas Americas Americas Americas Americas
#>   [57] Americas Americas Americas Americas Oceania  Oceania  Oceania 
#>   [64] Oceania  Oceania  Oceania  Oceania  Oceania  Oceania  Oceania 
#>   [71] Oceania  Oceania  Europe   Europe   Europe   Europe   Europe  
#>   [78] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>   [85] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>   [92] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>   [99] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [106] Asia     Asia     Asia     Europe   Europe   Europe   Europe  
#>  [113] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [120] Europe   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [127] Africa   Africa   Africa   Africa   Africa   Africa   Americas
#>  [134] Americas Americas Americas Americas Americas Americas Americas
#>  [141] Americas Americas Americas Americas Europe   Europe   Europe  
#>  [148] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [155] Europe   Europe   Africa   Africa   Africa   Africa   Africa  
#>  [162] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [169] Americas Americas Americas Americas Americas Americas Americas
#>  [176] Americas Americas Americas Americas Americas Europe   Europe  
#>  [183] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [190] Europe   Europe   Europe   Africa   Africa   Africa   Africa  
#>  [197] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [204] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [211] Africa   Africa   Africa   Africa   Africa   Africa   Asia    
#>  [218] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [225] Asia     Asia     Asia     Asia     Africa   Africa   Africa  
#>  [232] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [239] Africa   Africa   Americas Americas Americas Americas Americas
#>  [246] Americas Americas Americas Americas Americas Americas Americas
#>  [253] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [260] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [267] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [274] Africa   Africa   Africa   Americas Americas Americas Americas
#>  [281] Americas Americas Americas Americas Americas Americas Americas
#>  [288] Americas Asia     Asia     Asia     Asia     Asia     Asia    
#>  [295] Asia     Asia     Asia     Asia     Asia     Asia     Americas
#>  [302] Americas Americas Americas Americas Americas Americas Americas
#>  [309] Americas Americas Americas Americas Africa   Africa   Africa  
#>  [316] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [323] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [330] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [337] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [344] Africa   Africa   Africa   Africa   Africa   Americas Americas
#>  [351] Americas Americas Americas Americas Americas Americas Americas
#>  [358] Americas Americas Americas Africa   Africa   Africa   Africa  
#>  [365] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [372] Africa   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [379] Europe   Europe   Europe   Europe   Europe   Europe   Americas
#>  [386] Americas Americas Americas Americas Americas Americas Americas
#>  [393] Americas Americas Americas Americas Europe   Europe   Europe  
#>  [400] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [407] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [414] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [421] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [428] Africa   Africa   Africa   Africa   Africa   Americas Americas
#>  [435] Americas Americas Americas Americas Americas Americas Americas
#>  [442] Americas Americas Americas Americas Americas Americas Americas
#>  [449] Americas Americas Americas Americas Americas Americas Americas
#>  [456] Americas Africa   Africa   Africa   Africa   Africa   Africa  
#>  [463] Africa   Africa   Africa   Africa   Africa   Africa   Americas
#>  [470] Americas Americas Americas Americas Americas Americas Americas
#>  [477] Americas Americas Americas Americas Africa   Africa   Africa  
#>  [484] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [491] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [498] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [505] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [512] Africa   Africa   Africa   Africa   Africa   Europe   Europe  
#>  [519] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [526] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [533] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [540] Europe   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [547] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [554] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [561] Africa   Africa   Africa   Africa   Europe   Europe   Europe  
#>  [568] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [575] Europe   Europe   Africa   Africa   Africa   Africa   Africa  
#>  [582] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [589] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [596] Europe   Europe   Europe   Europe   Europe   Americas Americas
#>  [603] Americas Americas Americas Americas Americas Americas Americas
#>  [610] Americas Americas Americas Africa   Africa   Africa   Africa  
#>  [617] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [624] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [631] Africa   Africa   Africa   Africa   Africa   Africa   Americas
#>  [638] Americas Americas Americas Americas Americas Americas Americas
#>  [645] Americas Americas Americas Americas Americas Americas Americas
#>  [652] Americas Americas Americas Americas Americas Americas Americas
#>  [659] Americas Americas Asia     Asia     Asia     Asia     Asia    
#>  [666] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [673] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [680] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [687] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [694] Europe   Europe   Europe   Asia     Asia     Asia     Asia    
#>  [701] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [708] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [715] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [722] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [729] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [736] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [743] Asia     Asia     Europe   Europe   Europe   Europe   Europe  
#>  [750] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [757] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [764] Asia     Asia     Asia     Asia     Asia     Europe   Europe  
#>  [771] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#>  [778] Europe   Europe   Europe   Americas Americas Americas Americas
#>  [785] Americas Americas Americas Americas Americas Americas Americas
#>  [792] Americas Asia     Asia     Asia     Asia     Asia     Asia    
#>  [799] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [806] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [813] Asia     Asia     Asia     Asia     Africa   Africa   Africa  
#>  [820] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [827] Africa   Africa   Asia     Asia     Asia     Asia     Asia    
#>  [834] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [841] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [848] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [855] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [862] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [869] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [876] Asia     Africa   Africa   Africa   Africa   Africa   Africa  
#>  [883] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [890] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [897] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [904] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [911] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [918] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [925] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [932] Africa   Africa   Africa   Africa   Africa   Asia     Asia    
#>  [939] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#>  [946] Asia     Asia     Asia     Africa   Africa   Africa   Africa  
#>  [953] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [960] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [967] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [974] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#>  [981] Africa   Africa   Africa   Africa   Americas Americas Americas
#>  [988] Americas Americas Americas Americas Americas Americas Americas
#>  [995] Americas Americas Asia     Asia     Asia     Asia     Asia    
#> [1002] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1009] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1016] Europe   Europe   Europe   Europe   Europe   Africa   Africa  
#> [1023] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1030] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1037] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1044] Africa   Asia     Asia     Asia     Asia     Asia     Asia    
#> [1051] Asia     Asia     Asia     Asia     Asia     Asia     Africa  
#> [1058] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1065] Africa   Africa   Africa   Africa   Asia     Asia     Asia    
#> [1072] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1079] Asia     Asia     Europe   Europe   Europe   Europe   Europe  
#> [1086] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1093] Oceania  Oceania  Oceania  Oceania  Oceania  Oceania  Oceania 
#> [1100] Oceania  Oceania  Oceania  Oceania  Oceania  Americas Americas
#> [1107] Americas Americas Americas Americas Americas Americas Americas
#> [1114] Americas Americas Americas Africa   Africa   Africa   Africa  
#> [1121] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1128] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1135] Africa   Africa   Africa   Africa   Africa   Africa   Europe  
#> [1142] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1149] Europe   Europe   Europe   Europe   Asia     Asia     Asia    
#> [1156] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1163] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1170] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1177] Americas Americas Americas Americas Americas Americas Americas
#> [1184] Americas Americas Americas Americas Americas Americas Americas
#> [1191] Americas Americas Americas Americas Americas Americas Americas
#> [1198] Americas Americas Americas Americas Americas Americas Americas
#> [1205] Americas Americas Americas Americas Americas Americas Americas
#> [1212] Americas Asia     Asia     Asia     Asia     Asia     Asia    
#> [1219] Asia     Asia     Asia     Asia     Asia     Asia     Europe  
#> [1226] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1233] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1240] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1247] Europe   Europe   Americas Americas Americas Americas Americas
#> [1254] Americas Americas Americas Americas Americas Americas Americas
#> [1261] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1268] Africa   Africa   Africa   Africa   Africa   Europe   Europe  
#> [1275] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1282] Europe   Europe   Europe   Africa   Africa   Africa   Africa  
#> [1289] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1296] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1303] Africa   Africa   Africa   Africa   Africa   Africa   Asia    
#> [1310] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1317] Asia     Asia     Asia     Asia     Africa   Africa   Africa  
#> [1324] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1331] Africa   Africa   Europe   Europe   Europe   Europe   Europe  
#> [1338] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1345] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1352] Africa   Africa   Africa   Africa   Africa   Asia     Asia    
#> [1359] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1366] Asia     Asia     Asia     Europe   Europe   Europe   Europe  
#> [1373] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1380] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1387] Europe   Europe   Europe   Europe   Europe   Europe   Africa  
#> [1394] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1401] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1408] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1415] Africa   Africa   Europe   Europe   Europe   Europe   Europe  
#> [1422] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1429] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1436] Asia     Asia     Asia     Asia     Asia     Africa   Africa  
#> [1443] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1450] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1457] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1464] Africa   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1471] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1478] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1485] Europe   Europe   Europe   Europe   Asia     Asia     Asia    
#> [1492] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1499] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1506] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1513] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1520] Africa   Africa   Africa   Africa   Africa   Asia     Asia    
#> [1527] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1534] Asia     Asia     Asia     Africa   Africa   Africa   Africa  
#> [1541] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1548] Africa   Americas Americas Americas Americas Americas Americas
#> [1555] Americas Americas Americas Americas Americas Americas Africa  
#> [1562] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1569] Africa   Africa   Africa   Africa   Europe   Europe   Europe  
#> [1576] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1583] Europe   Europe   Africa   Africa   Africa   Africa   Africa  
#> [1590] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1597] Europe   Europe   Europe   Europe   Europe   Europe   Europe  
#> [1604] Europe   Europe   Europe   Europe   Europe   Americas Americas
#> [1611] Americas Americas Americas Americas Americas Americas Americas
#> [1618] Americas Americas Americas Americas Americas Americas Americas
#> [1625] Americas Americas Americas Americas Americas Americas Americas
#> [1632] Americas Americas Americas Americas Americas Americas Americas
#> [1639] Americas Americas Americas Americas Americas Americas Asia    
#> [1646] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1653] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1660] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1667] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1674] Asia     Asia     Asia     Asia     Asia     Asia     Asia    
#> [1681] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1688] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1695] Africa   Africa   Africa   Africa   Africa   Africa   Africa  
#> [1702] Africa   Africa   Africa  
#> Levels: Asia Europe Africa Americas Oceania
```

###### Unit Test

Link for unit test is avalable [here](https://github.com/jmurthy12/foofactors/blob/master/tests/testthat/test_factor_as_orginal.R)
