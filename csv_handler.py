import pandas as pd

df = pd.read_csv('first.csv')
df['link'] = df['link'].str.replace('https://hdrezka-ag.com', '')
df.to_csv('first.csv')
