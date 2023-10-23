#!/usr/bin/env python
# coding: utf-8
# %% [markdown]
# # Convert a sequence to a number and vice versa:

# %%
## Change the symbol to the corresponding number
def symbol_to_number(symbol):
  if (symbol == 'A'):
    return 0
  elif (symbol == 'C'):
    return 1
  elif (symbol == 'G'):
    return 2
  elif (symbol == 'T'):
    return 3

def pattern_to_number(pattern):
  ## return if pattern is empty
  if not pattern:
    return 0

  ## Convert last symbol to number
  last_symbol = symbol_to_number(pattern[len(pattern) - 1])
  ## recursively convert the remaining pattern to number
  prefix_value = pattern_to_number(pattern[:-1])
  ## return the number corresponding to the pattern
  return (4*prefix_value + last_symbol)

## Convert numebr to it's corresponding symbols
def number_to_symbol(number):
  if (number == 0):
    return 'A'
  elif (number == 1):
    return 'C'
  elif (number == 2):
    return 'G'
  elif (number == 3):
    return 'T'

def number_to_pattern(index, k):
  ## return error if conversion is 
  ## not possible for the provided length
  if index >= 4**k:
    return "Index value is too large for given k"
  
  ## base case when length(k) is 1
  if k == 1:
    return number_to_symbol(index)
    
  ## Get prefix index
  prefix_index = int(index/4)
  ## Get the index of the last character
  remainder = index % 4
  ## Get last symbol
  last_symbol = number_to_symbol(remainder)
  ## recursively get the pattern without the last symbol
  prefix_pattern = number_to_pattern(prefix_index, k-1)
  
  return prefix_pattern + last_symbol 

def canonical_to_number(pattern):
    number = pattern_to_number(pattern)
    number_rc = pattern_to_number(reverse_conjugate(pattern))
    return number if number <= number_rc else number_rc



# %% [markdown]
# # Helper functions including
# - reverse conjugate


# %%
# get the reverse conjugate
def reverse_conjugate(kmer):
    conjugate_dict = {'A': 'T',
                      'T': 'A',
                      'C': 'G',
                      'G': 'C'}
    kmer_rc = ''
    for i in range(len(kmer)):
        kmer_rc = conjugate_dict[kmer[i]] + kmer_rc
    return kmer_rc







# %% [markdown]
# # dot-plot:

# %%
def dot_plot():
    print('test')




# %%
