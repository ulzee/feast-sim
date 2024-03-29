
library('stats')
source('./sim.R')
source('./src.R')
source('./metrics.R')

# generate_data()

unk = 1
print(paste('Init with unknowns:', unk))

alphas <- readRDS(file="saved/alphas.Rda")

results <- c()
for (ai in 1:nrow(alphas)) {
	# test loop

	ptm <- proc.time()

	alpha_true <- alphas[ai,]
	sources <- readRDS(file=sprintf('saved/sources%s.Rda', ai))
	sink <- readRDS(file=sprintf('saved/sink%s.Rda', ai))

	results <- em(sink, sources, iters=100, alpha_true=alpha_true)

	print(proc.time() - ptm)

	# compute rsq between alpha and inferred
	break
}
