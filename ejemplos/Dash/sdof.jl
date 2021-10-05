# =========================
# Define app
# =========================



# =========================
# Generate simulation data
# =========================

using StructuralDynamicsODESolvers

k  = 2 ; m  = .5 ;  c = .1
u0 = 1 ; v0 = 0

alg = Bathe(Δt = 0.1)

M = m*ones(1, 1)
C = c*ones(1, 1)
K = k*ones(1, 1)
R = zeros(1)

sys = SecondOrderAffineContinuousSystem(M, C, K, R)

U₀ = u0 * ones(1)
V₀ = v0 * ones(1)

prob = InitialValueProblem(sys, (U₀, V₀))

sol = solve(prob, alg, NSTEPS=300);

pl = plot(sol, vars=(0, 1))
