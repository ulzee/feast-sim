
source('./sim.R')
source('./src.R')

# generate_data()

unk = 1
print(paste('Init with unknowns:', unk))

alphas <- readRDS(file="saved/alphas.Rda")

for (ai in 1:nrow(alphas)) {
	# test loop

	alpha_true <- alphas[ai,]
	sources <- readRDS(file=sprintf('saved/sources%s.Rda', ai))
	sink <- readRDS(file=sprintf('saved/sink%s.Rda', ai))

	sources[sources == 0] = 1
	sink[sink == 0] = 1
	results <- em(sink, sources)
	break
}