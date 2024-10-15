#include <armadillo>
#include <iostream>

int main()
{
  const unsigned int n = 7;
  arma::Mat<double> A(n,n,arma::fill::none);

  for (unsigned int i=0;i<n;++i)
    for (unsigned int j=0;j<n;++j)
      A(i,j) = (i+j+1.);
  
  arma::Col<double> y(n), x(n,arma::fill::zeros);
  x(2) = 1;
  y = A*x;
  std::cout << y;
}
