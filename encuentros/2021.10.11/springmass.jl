using StructuralDynamicsODESolvers, Plots, LinearAlgebra

function springmass(; k=2)
    m  = .5 ;  c = 0 ;
    u0 = 1 ; v0 = 0 ;

    M = m * ones(1, 1)
    C = c * ones(1, 1)
    K = k * ones(1, 1)
    R = zeros(1)

    sys = SecondOrderAffineContinuousSystem(M, C, K, R)

    U₀ = u0 * ones(1); V₀ = v0 * ones(1);

    ivp_free = InitialValueProblem(sys, (U₀, V₀))

    NSTEPS = 1000 ;
    Δt = 0.005 ;

    alg = Bathe(Δt = Δt )
    sol = solve(ivp_free, alg, NSTEPS=NSTEPS);

    plt = Plots.plot(sol, vars=(0, 1))
end
