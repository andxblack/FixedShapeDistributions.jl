# FixedShapeDistributions

Micro package for defining distributions with a fixed shape parameter, but where we want to be able to change the mean. Useful in some inference methods.

```
using FixedShapeDistributions

# create a Gamma distribution with shape 2
g = FixedGamma(2)

set_mean(g,3.0)
```