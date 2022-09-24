generate_bootstrap_samples <- function(n, m, B) {

  samples_idx <- matrix(0, B, m)

  for (b in 1:B) {

    sample_idx <- sample(1:n, size = m)
    samples_idx[b, ] = sample_idx

    return(samples_idx)

  }
}



# def generate_bootstrap_samples(n, m, B):
#   '''
#       Return: B-by-m matrix, where row b gives the indices for b-th bootstrap sample
#     '''
# samples_idx = np.zeros((B, m),dtype=int)
# for b in range(B):
#   sample_idx = np.random.choice(n, m)
#   samples_idx[b, :] = sample_idx
#   return(samples_idx)
