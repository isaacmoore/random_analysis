# CLAUDE.md - AI Assistant Guide for Random Analysis Repository

## Repository Overview

This repository contains data analysis projects that answer random questions asked by friends and family. Each question is analyzed independently using statistical methods, data visualization, and machine learning techniques where appropriate.

**Repository Purpose**: Ad-hoc data analysis for answering specific questions using Python and R
**Primary Languages**: Python (Jupyter Notebooks), R (scripts and R Markdown)
**Analysis Type**: Exploratory data analysis, web scraping, statistical analysis, visualization

---

## Repository Structure

```
random_analysis/
├── README.md                          # Project index and question tracker
├── .gitignore                         # Ignores .ipynb_checkpoints/
├── Question 1/                        # Where does rape occur most in LA?
│   ├── Question 1 - Analysis.ipynb    # Main analysis notebook
│   ├── LAPD_Crime_and_Collision_Raw_Data_for_2015.csv
│   ├── rape_df.csv                    # Processed data
│   ├── rape_in_LA_Heatmap.html        # Interactive heatmap
│   ├── Book1.twb                      # Tableau workbook
│   └── *.png                          # Exported plots
├── Question 2/                        # Divorce and income correlation
│   ├── Question 2 - Analysis.ipynb
│   └── data/                          # Demographic CSV files
│       └── Table1_*.csv
├── Question 4/                        # Impractical Jokers analysis
│   ├── analysis.Rmd                   # R Markdown analysis
│   ├── analysis.html                  # Rendered HTML output
│   ├── analysis.nb.html               # R Notebook output
│   ├── .RData, .Rhistory              # R workspace files
│   └── data/
│       ├── from_wiki.csv              # Raw scraped data
│       └── wiki_cleaned.csv           # Cleaned data
├── Question 5/                        # Car price analysis
│   ├── analysis.R                     # R script
│   └── prices-mileage.png             # Plot output
└── Question 6/                        # IMDB Top 250 analysis
    └── Scrape_the_IMDB_Top_250_Movies.ipynb
```

---

## Project Organization Conventions

### Folder Naming
- Each question gets its own folder: `Question N/` where N is the question number
- Question numbers are tracked in README.md with status

### File Naming Patterns
- **Jupyter Notebooks**: `Question N - Analysis.ipynb`
- **R Markdown**: `analysis.Rmd`
- **R Scripts**: `analysis.R`
- **Data subfolder**: `data/` for storing datasets
- **Outputs**: Descriptive names for plots/exports (e.g., `rape_in_LA_Heatmap.html`, `prices-mileage.png`)

### README.md Structure
The README tracks:
- Question number
- Question description
- Who asked it
- Status (Done, Collecting Data, etc.)

---

## Technical Stack & Libraries

### Python (Jupyter Notebooks)
**Core Libraries**:
- `pandas` - Data manipulation and analysis
- `numpy` - Numerical operations
- `matplotlib.pyplot` - Basic plotting
- `seaborn` - Statistical visualization
- `ggplot` - Grammar of graphics plotting

**Domain-Specific**:
- `folium` - Interactive mapping and heatmaps
- `folium.plugins.HeatMap` - Heatmap visualization
- `warnings` - Suppress FutureWarnings

**Common Imports Pattern**:
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from ggplot import *
import warnings
warnings.simplefilter(action="ignore", category=FutureWarning)
%matplotlib inline
```

### R (Scripts & R Markdown)
**Core Libraries**:
- `tidyverse` - Data manipulation and visualization suite
- `ggplot2` - Data visualization (part of tidyverse)
- `dplyr` - Data manipulation (part of tidyverse)
- `stringr` - String manipulation

**Web Scraping**:
- `rvest` - Web scraping and HTML parsing
- `lubridate` - Date/time manipulation

**Common Setup**:
```r
library(tidyverse)
library(rvest)
library(stringr)
library(lubridate)
```

---

## Data Analysis Patterns

### Data Acquisition
1. **Web Scraping**: Using `rvest` (R) or similar libraries
   - Wikipedia tables via XPath selectors
   - Cars.com listings
   - IMDB data

2. **CSV Files**: Large datasets stored locally
   - LAPD crime data (44MB+)
   - Demographic tables
   - Processed/cleaned data exports

### Common Workflows

#### Python/Jupyter Workflow
1. Import libraries
2. Load data with `pd.read_csv()`
3. Explore with `.head()`, `.shape`, `.info()`
4. Data cleaning and feature engineering
5. Exploratory data analysis with groupby, value_counts
6. Visualization with matplotlib/seaborn/folium
7. Export results: `.to_csv()`, `.save()` for maps

#### R Workflow
1. Set working directory: `setwd("~/github/random_analysis/Question N")`
2. Load libraries
3. Scrape or load data
4. Clean data with tidyverse functions
5. Analyze with group_by/summarise
6. Visualize with ggplot2
7. Export with `ggsave()` or `write_csv()`

### Data Cleaning Patterns

**Python**:
- Create binary encodings with list comprehensions
- Use `.dt` accessor for datetime operations
- String manipulation with `.map()` and custom functions
- Handle missing data with `type()` checks

**R**:
- Use `str_replace_all()` for string cleaning
- Convert types with `as.numeric()`, `as.factor()`, `as.double()`
- Extract patterns with `str_extract()`
- Date parsing with `mdy()` from lubridate

### Visualization Conventions

**Time Series**:
- Line plots for trends over time
- Grouping by month/weekday/day
- Custom labels and titles

**Geographic Data**:
- Folium for interactive maps
- HeatMap plugin for density visualization
- Focus coordinates for LA: `[34.038971, -118.274169]`

**Statistical**:
- Bar charts for counts/frequencies
- Box plots for distributions
- Scatter plots with regression lines (`geom_smooth(method="lm")`)

---

## Working with This Repository

### Adding a New Analysis

1. **Create Question Folder**:
   ```bash
   mkdir "Question N"
   cd "Question N"
   ```

2. **Create Analysis File**:
   - For Python: `Question N - Analysis.ipynb`
   - For R: `analysis.R` or `analysis.Rmd`

3. **Create Data Subfolder** (if needed):
   ```bash
   mkdir data
   ```

4. **Update README.md**:
   - Add new row to the table
   - Include question number, description, requester, status

5. **Follow Naming Conventions**:
   - Use descriptive names for exports
   - Store raw data in `data/` subfolder
   - Keep outputs at question folder root

### Git Workflow

**Current Branch**: `claude/add-claude-documentation-7lKY7`

**Commit Message Style** (from git history):
- Descriptive, present tense
- Examples: "finished question 5", "Added Divorce and Income", "Updated plots"
- Keep messages concise but clear

**Development Pattern**:
- Work on individual question analyses
- Commit when analysis is complete or at major milestones
- Push updates to plots and visualizations separately

---

## Data Handling Guidelines

### File Size Considerations
- Large CSV files (40MB+) are committed to the repo
- Be mindful of repository size when adding new datasets
- Consider data compression for very large files

### Data Privacy & Sensitivity
- Questions may involve sensitive topics (crime data)
- Use anonymized/public datasets only
- Geographic data is aggregated for privacy

### Data Sources
Common sources include:
- Government open data portals (LAPD OpenData)
- Wikipedia tables
- E-commerce sites (cars.com)
- Public APIs and databases (IMDB)

---

## Code Quality & Style

### Python Style
- Follow pandas best practices
- Suppress warnings appropriately
- Use meaningful variable names: `rape_df`, `crime`, `occurences_per_month`
- Comment complex operations
- Handle SettingWithCopyWarning (seen in notebooks, use `.loc[]` when appropriate)

### R Style
- Use tidyverse conventions
- Pipe operators for readability: `%>%`
- Descriptive variable names: `losing_jokers`, `season_views`
- Group and summarize for aggregations
- Comment non-obvious operations

### Notebook Best Practices
- Markdown cells for context and section headers
- Clear section separation
- Show intermediate results with `.head()`, `glimpse()`
- Include data shape and info for verification
- Document data transformations

---

## Common Tasks for AI Assistants

### When Analyzing Data
1. **Explore First**: Always check data shape, columns, types before transforming
2. **Verify Transformations**: Show before/after comparisons
3. **Handle Missing Data**: Check for NaN/None values
4. **Document Assumptions**: Use markdown cells to explain choices
5. **Reproducibility**: Set working directories, random seeds if applicable

### When Creating Visualizations
1. **Clear Labels**: Always include titles, axis labels
2. **Appropriate Size**: Use `figsize` parameter for readability
3. **Color Coding**: Use color meaningfully (by category, season, etc.)
4. **Export**: Save plots with descriptive names
5. **Interactive Options**: Consider folium for geographic data

### When Web Scraping
1. **Verify URLs**: Check that sources are accessible
2. **Robust Selectors**: Use XPath or CSS selectors carefully
3. **Data Validation**: Verify scraped data structure
4. **Save Raw Data**: Export raw scraped data before cleaning
5. **Respect robots.txt**: Follow web scraping best practices

### When Cleaning Data
1. **Track Changes**: Show row counts before/after filtering
2. **Type Conversions**: Explicitly convert types as needed
3. **String Cleaning**: Remove whitespace, special characters systematically
4. **Encoding**: Handle UTF-8 encoding for exports
5. **Validation**: Check cleaned data with summary statistics

---

## Troubleshooting Common Issues

### Jupyter Notebooks
- **SettingWithCopyWarning**: Use `.loc[]` or `.copy()` when creating subsets
- **Import Errors**: Check library installations
- **Encoding Issues**: Specify `encoding='utf-8'` in read/write operations
- **Plot Display**: Ensure `%matplotlib inline` magic command is set

### R Scripts
- **Working Directory**: Set with `setwd()` at script start
- **Package Loading**: Load all libraries at the beginning
- **Scraping Failures**: Check XPath selectors, website structure may change
- **Date Parsing**: Use appropriate lubridate functions (mdy, ymd, etc.)

### Data Issues
- **File Not Found**: Verify relative paths from working directory
- **Large Files**: May take time to load, be patient
- **Column Names**: Check for spaces, special characters, case sensitivity
- **Data Types**: Explicitly convert types when R/Python guess incorrectly

---

## Project-Specific Notes

### Question 1 (LA Crime Analysis)
- Uses very large CSV file (44MB, 228K rows)
- Tableau workbook included (`.twb`)
- Generates interactive HTML heatmap
- Multiple PNG exports for different time analyses

### Question 4 (Impractical Jokers)
- Scrapes 7 seasons of Wikipedia tables
- Requires careful XPath for each season
- Uses R Markdown for analysis documentation
- Exports both HTML and R Notebook formats

### Question 5 (Car Pricing)
- Live web scraping from cars.com
- Uses specific ZIP code (91605)
- Creates scatter plot with regression line
- Reference line at 28,000 miles

---

## AI Assistant Best Practices

### Do:
- ✅ Read existing code patterns before suggesting changes
- ✅ Follow established naming conventions
- ✅ Use the same libraries as existing analyses
- ✅ Create visualizations in the same style
- ✅ Export data and plots with descriptive names
- ✅ Update README.md when adding new questions
- ✅ Commit changes with clear messages
- ✅ Check data quality at each transformation step

### Don't:
- ❌ Change folder structure without good reason
- ❌ Introduce new libraries without justification
- ❌ Skip data validation steps
- ❌ Forget to export final results
- ❌ Commit without testing the analysis
- ❌ Use absolute paths (except for setwd in R)
- ❌ Leave debug code or print statements
- ❌ Ignore warnings that indicate real problems

---

## Quick Reference

### Starting a Python Analysis
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
%matplotlib inline

# Load data
df = pd.read_csv('data/filename.csv')

# Explore
print(df.shape)
df.head()
df.info()
```

### Starting an R Analysis
```r
setwd("~/github/random_analysis/Question N")
library(tidyverse)

# Load data
df <- read_csv("data/filename.csv")

# Explore
glimpse(df)
summary(df)
```

### Creating a Heatmap (Python)
```python
import folium
from folium.plugins import HeatMap

m = folium.Map([lat, lon], zoom_start=10)
HeatMap(data_list).add_to(m)
m.save('output_name.html')
```

### Web Scraping (R)
```r
library(rvest)

url <- "https://example.com"
data <- url %>%
  read_html() %>%
  html_nodes(xpath='//table') %>%
  html_table()
```

---

## Contact & Questions

Questions are tracked in the README.md file with:
- Question number and description
- Who asked the question (Sabrina, Isaac, Family)
- Current status

For new analysis requests, add an entry to README.md and create the corresponding question folder.

---

**Last Updated**: 2026-01-06
**Maintained by**: Isaac Moore
**AI Assistant Guide Version**: 1.0
