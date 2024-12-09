void steepest_descent(arma::Col<double>& x,
		      const arma::Mat<double>& A,
		      const arma::Col<double>& b,
		      double tolerance)
{
  arma::Col<double> r(b);
  arma::Col<double> p(size(x));
  p = A*x;
  r -= d;
  double res = arma::norm(r);
  while (res > tolerance) {
    p = A*r;
    double alpha = (res*res)/dot(p,r);
    // Breakdown not caught
    x += alpha*r;
    r -= alpha*p;
  }
}
