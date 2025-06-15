#include <iostream>

const unsigned int n=16;
const double scale = 1.6/n;

const double xmin = -3.;
const double xmax = 3.;
const double ymin = -3.;
const double ymax = 3.;

const double mu = .2;

void f(double x, double y)
{
  const double u = mu*(x-x*x*x/3.-y);
  const double v = 1./mu*x;
  std::cout << x << '\t'
	    << y << '\t'
	    << (scale * u) << '\t'
	    << (scale * v) << '\n';
}

int main()
{
  for (unsigned int i=0;i<=n;++i)
    {
      for (unsigned int j=0;j<=n;++j)
	{
	  f(xmin + (xmax-xmin)*i/n,ymin + (ymax-ymin)*j/n);
	}
      std::cout << std::endl;
    }
}
