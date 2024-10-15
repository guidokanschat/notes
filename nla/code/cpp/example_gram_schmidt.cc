#include <armadillo>
#include <iostream>

#include "gram_schmidt_modified.hh"

using namespace arma;

void print_gramian(const Mat<double>& M)
{
  Mat<double> G(M.n_cols, M.n_cols);
  for (unsigned int j=0;j<M.n_cols;++j)
    for (unsigned int i=0;i<M.n_cols;++i)
      G(i,j) = dot(M.col(i),M.col(j));

  std::cout << "Gramian\n" << G;
}

int main()
{
  const unsigned int n = 7;
  Mat<double> hilbert(n,n);

  for (unsigned int i=0;i<n;++i)
    for (unsigned int j=0;j<n;++j)
      {
	hilbert(i,j) = 1./(i+j+1.);
      }
  Mat<double> hilbert2 = hilbert;
  std::cout << hilbert2 << "\n";

  gram_schmidt_modified(hilbert);
  print_gramian(hilbert);
}
