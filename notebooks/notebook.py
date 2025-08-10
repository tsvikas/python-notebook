# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.17.2
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %%
# %load_ext autoreload

# %%
# %config ZMQInteractiveShell.ast_node_interactivity = 'last_expr_or_assign'
# %autoreload 1
# %aimport my_package

# %%
from pathlib import Path

import hvplot.pandas  # noqa: F401
import matplotlib.pyplot as plt
import pandas as pd
from IPython.core.display_functions import display

pd.options.display.show_dimensions = True
pd.options.display.width = 120
pd.options.mode.copy_on_write = True

# %%
data_dir = Path("..") / "data"

# %%
display(data_dir)
plt.figure()
