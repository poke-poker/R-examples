library(MDPtoolbox)

## Markov Decision Process (MDP)
# 1. MDPs provide a framework for modeling decision making in environments that are 
#    partly random & partly controlled.
# 2. MDPs are used in a wide range of optimization problems.
# 3. MDPs are solved via Dynamic Programming & Reinforcement Learning.

## Key Terms
# 1. Action: allowed choices.
# 2. Reward: given motivation.
# 3. State: a state within the process.
# 4. Policy: a function π that specifies the action π(s) that the 
#       decision maker will choose when in state s.
# 5. Markov Property: a stochastic process has the Markov Property
#       if the conditional probability distribution of future states
#       of the process (conditional on both past & present states)
#       depends only on the present state. 
#       (MDP satisfies the Markov Property)
# 6. state-value function: expected return from state s following policy π.
# 7. action-value function: expected return from state s, taking action a, 
#       following policy π.

## EXAMPLE 1
rm(list=ls(all=TRUE))
# Generates a random MDP problem
set.seed(0)
mdp_example_rand(2, 2)
mdp_example_rand(2, 2, FALSE)
mdp_example_rand(2, 2, TRUE)
mdp_example_rand(2, 2, FALSE, matrix(c(1,0,1,1),2,2))
# Generates a MDP for a simple forest management problem
MDP <- mdp_example_forest()
# Find an optimal policy
results <- mdp_policy_iteration(MDP$P, MDP$R, 0.9)
# Visualise the policy
results$policy

## EXAMPLE 2: Bellman Operator
# 1. Bellman Equation: also known as Dynamic Programming equation,
#    is a necessary condition for optimality associated with
#    Dynamic Programming. (used for predicting value-functions)
rm(list=ls(all=TRUE))
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_bellman_operator(P, R, 0.9, c(0,0))
# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_bellman_operator(P, R, 0.9, c(0,0))

## EXAMPLE 3: mdp check
rm(list=ls(all=TRUE))
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_check(P, R)
# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_check(P, R)

## EXAMPLE 4: mdp check square stochastic
rm(list=ls(all=TRUE))
M <- matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE)
mdp_check_square_stochastic(M)

## EXAMPLE 5: mdp compute P policy / PR policy
rm(list=ls(all=TRUE))
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE)
R <- array(0, c(2,2,2))
R[,,1] <- matrix(c(-0.2433, 0.7073, 0, 0.1871), 2, 2, byrow=TRUE)
R[,,2] <- matrix(c(-0.0069, 0.6433, 0, 0.2898), 2, 2, byrow=TRUE)
policy <- c(2,2)
mdp_computePpolicyPRpolicy(P, R, policy)
# With a sparse matrix (P)
P <- list()
P[[1]] <- Matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_computePpolicyPRpolicy(P, R, policy)

## EXAMPLE 6: mdp compute PR
rm(list=ls(all=TRUE))
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE)
R <- array(0, c(2,2,2))
R[,,1] <- matrix(c(-0.2433, 0.7073, 0, 0.1871), 2, 2, byrow=TRUE)
R[,,2] <- matrix(c(-0.0069, 0.6433, 0, 0.2898), 2, 2, byrow=TRUE)
mdp_computePR(P, R)
# With a sparse matrix (P)
P <- list()
P[[1]] <- Matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_computePR(P, R)

