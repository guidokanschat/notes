using namespace arma;

void gram_schmidt_modified(Mat<double>& M)
{
  for (unsigned int j=0;j<M.n_cols;++j)
    {
      auto w = M.col(j);
      for (unsigned int i=0;i<j;++i)
	{
	  const double r = dot(w,M.col(i));
	  w -= r*M.col(i);
	}
      w /= norm(w);
    }
}
