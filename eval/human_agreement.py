import numpy as np
import pandas as pd
from statsmodels.stats.inter_rater import aggregate_raters, fleiss_kappa

df = pd.read_csv('ratings-human/nonprocessed_data/vicuna_benchmark_human_annotations.csv')

print(df.columns)

data = df['answer'].to_numpy().reshape((-1, 3))

# Fleiss score
agg = aggregate_raters(data)
result = fleiss_kappa(agg[0], method='fleiss')
print(result)

