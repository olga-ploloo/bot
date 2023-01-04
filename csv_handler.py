import csv

import pandas as pd



df = pd.read_csv('first.csv')
# print(df.to_string())
df['link'] = df['link'].str.replace('https://hdrezka-ag.com', '')
# print(df.columns)
df.to_csv('first.csv')


