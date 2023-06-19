import pandas as pd

#['hit_id_hash', 'worker_id_hash', 'system_a', 'system_b', 'prompt', 'generation_system_a', 'generation_system_b', 'answer']
df = pd.read_csv('vicuna_benchmark_human_annotations.csv')

print(len(df))
print(df.iloc[:6])
#print(df.columns)

#print(df.groupby(['system_b']).count())


df1 = df[('gpt35'==df['system_a']) & ('vicuna-13b'==df['system_b'])]
print(len(df1))
print(df1.groupby(['hit_id_hash']).count())
df2 = df[('vicuna-13b'==df['system_a']) & ('gpt35'==df['system_b'])]
print(len(df2))
print(df2.groupby(['hit_id_hash']).count())

#print(df['answer'])

#print(df.groupby(['answer']).count())

