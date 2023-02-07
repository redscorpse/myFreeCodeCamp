# Learning Material

[Data Analysis with Python - Full Course for Beginners (Numpy, Pandas, Matplotlib, Seaborn)](https://m.youtube.com/watch?v=r-uOLxNrNk8)

Links to notebooks:
1. [ppt](https://docs.google.com/presentation/d/1fDpjlyMiOMJyuc7_jMekcYLPP2XlSl1eWw9F7yE7byk/edit?usp=sharing)
2. https://github.com/ine-rmotr-curriculum/FreeCodeCamp-Pandas-Real-Life-Example
3. https://github.com/ine-rmotr-curriculum/ds-content-interactive-jupyterlab-tutorial
4. https://github.com/ine-rmotr-curriculum/freecodecamp-intro-to-numpy
5. https://github.com/ine-rmotr-curriculum/freecodecamp-intro-to-pandas
6. https://github.com/ine-rmotr-curriculum/data-cleaning-rmotr-freecodecamp
7. https://github.com/ine-rmotr-curriculum/RDP-Reading-Data-with-Python-and-Pandas
8. https://github.com/ine-rmotr-curriculum/ds-content-python-under-10-minutes


---

# Cheatsheets for Data Science

## [Pandas](https://www.analyticsvidhya.com/blog/2015/07/11-steps-perform-data-analysis-pandas-python/)
1. Reading and Writing Data
    - Reading a CSV file: `df=pd.read_csv('myData.csv')`
    - Writing content of data frame to CSV file: `df.to_csv('myData.csv')`
    - Reading an Excel file: `df=pd.read_excel('myData.xlsx','sheet1')`
    - Writing content of data frame to Excel file: `df.to_excel('myData.xlsx',sheet_name='sheet2')`
2. Getting Preview of Data Frame
    - Looking at top *n* records: `df.head(n)`
    - Looking at bottom *n* records: `df.tail(n)`
    - View columns name: `df.columns`
3. Rename Columns of Data Frame
    - Rename method helps to rename column of data frame: `df2=df.rename(columns={'oldColName':'newColName'})`. This statement will create a new data frame with new column name
    - To rename the column of existing data frame, set `inplace=True`: `df.rename(columns={'oldColName':'newColName'}, inplace=True)`
4. Selecting Columns or Rows
    - Accessing sub data frames: `df[['col1':'col2']]`
    - Filtering records:
        - `df[df['col1']>10]`
        - `df[(df['col1']>10) & df['col2']==30]`
        - `df[(df['col1']>10) | df['col2']==30]`
5. Handling Missing Values
    - `df1.dropna()`: used to drop rows or columns having missing data
    - The `fillna()` function is used to fill missing values
        - `df2.fillna(value=5)` replaces all missing values with 5
        - `mean=df2['col1'].mean(); df2['col1'].fillna(mean)` replaces all missing values of col1 with mean of available values
6. Creating New Columns  
    (New column is a function of existing columns)
    - `df['newCol']=df['col2']`
7. Aggregate
8. Merging / Concatenating DataFrames
9. Applying function to element, column or dataframe
10. Identify unique values
11. Basic stats


```
# General visualization
df.describe()
df.shape #nRowsxnColumns
df.shape[0] #nRows
df.shape[1] #nCols

df.columns #col names
df.index.tolist() #each row col0


# Filtering

df[df['col1'].isin(['val1', 'val2', 'val3'])] #same as df[(df['col1']=='val1') | (df['col1']=='val2') | (df['col1']=='val3')]


# counting
df[condition].counts()
df.value_counts()
(df.loc[(df['salary']=='>50K'), ['native-country']]).value_counts() #counts how many for each country
(df.loc[(df['salary']=='>50K'), ['native-country']]).value_counts().iloc[0] #he highest country, how many times

```