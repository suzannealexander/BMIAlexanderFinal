# BMI Alexander Final
Final project for BMI 510

## Installation

To install the package, you can use the `githubinstall` package. Run the following command in your R console:

```R
install.packages("remotes")
remotes::install_github("suzannealexander/BMIAlexanderFinal")
library(BMIAlexanderFinal)
```

#### Usage
The package offers a range of functions. Here's a list of available functions along with a brief description:

- `logLikBernoulli(data)`: This function takes in a vector of binary values to calculate parameter p
- `survCurv(status, time)`: This function takes in numercial vectors status and time to calculate the survival curve S(t), returning a plot of the survival curve
- `unscale(x)`: This function reverses the transformations of scale() for a vector
- `pcApprox(x, npc)`: This function returns an approximation to the data x based on the specified number of principal components (npc).
- `standardizeNames(data)`: This function standardizes the variable names in a tibble data to "small camel case".
- `minimumN(x1, x2)`: This function takes either one or two samples of preliminary data (x1 or x2) and return the minimum sample size needed for a t-test under conditions: (1) The function should calculate the minimum sample size required for a t-test under the null hypothesis (2) It should determine the sample size needed to achieve 80 significance level of alpha = 0.05
- `downloadRedcapReport(redcapTokenName,redcapUrl,redcapReportId)`: This function reads in an API token from the user's .Renviron file, a Redcap url and a Redcap report id, downloading the report and returning the contents as a tibble

After installing the package, you can explore detailed information about each function using the R help system. Type `?<functionName>` in your R console to access comprehensive documentation and usage examples.

#### Dependencies
In order to use this package, please install

- `pwr`
- `dplyr`
- `janitor`

You can install them using the `install.packages()` function if these packages aren't installed already.


