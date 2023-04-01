module FixedShapeDistributions

using Distributions, SpecialFunctions

export FixedWeibull, FixedLognormal, FixedExpo, FixedGamma, set_mean

abstract type FixedShapeDist end

struct FixedGamma <: FixedShapeDist
    shape::Int
end

struct FixedWeibull <: FixedShapeDist
    shape::Int
end

struct FixedExpo <: FixedShapeDist end

struct FixedLognormal <: FixedShapeDist
    sigma::Float64
end


function set_mean(d::FixedExpo, x)
    return Exponential(x)
end

function set_mean(d::FixedGamma, x)
    return Gamma(d.shape,x/d.shape)
end

function set_mean(d::FixedWeibull, x)
    return Weibull(d.shape, x/gamma(1+1/d.shape))
end

function set_mean(d::FixedLognormal, x)
    return LogNormal(log(x) - d.sigma^2/2, d.sigma)
end


# set_mean(FixedGamma(2),2.0)

# mean(set_mean(FixedLognormal(3), 2.0))

# set_mean(FixedLognormal(3.0),1.0)

# set_mean(FixedExpo(),1.0)


end
