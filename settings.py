import math
import os
import random

BASE_TEMPLATE = os.getenv('BASE_TEMPLATE', 'base.html')
STATIC_PATH   = os.getenv('STATIC_PATH', '../library')  # cycle back
CSS_STATIC_PATH   = os.getenv('CSS_STATIC_PATH', '../display/stylesheets')  # cycle back

class FF:
  def __init__(self, dat, etc):
    self.dat  = dat
    self.etc  = etc

  def __getitem__(self, key):
    return int(math.floor((random.random() * 1000.0) / random.random()))

def generate_test_data():
  ff  = FF(None, None)
  return {
    'display': {
      'total': ff['total'],
      'info' : ff,
      'toilets' : ff['toilets'],
      'toilpc' : ff['toilpc'],
      'handw' : ff['handw'],
      'handpc' : ff['handpc'],
      'fats' : ff['fats'],
      'thins' : ff['thins'],
      'pr' : ff['pr'],
      'prpc' : ff['prpc'],
      'aa' : ff['aa'],
      'aapc' : ff['aapc'],
      'risks' : ff['risks'],
      'riskpc' : ff['riskpc'],
      'rezes' : ff['rezes'],
      'rezpc' : ff['rezpc'],
    },
    'base_template' : BASE_TEMPLATE,
    'static_path'   : STATIC_PATH,
    'css_path'      : CSS_STATIC_PATH,
    'filters'       : {
      'child_areas' : [
        {'name': 'Kigali City', 'id': 1, 'own_link': '?location=kigali'}
      ]
    }
  }
