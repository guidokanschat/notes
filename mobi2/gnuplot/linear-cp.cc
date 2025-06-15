#include <iostream>
#include <cmath>


const unsigned int n=20;
const double scale = 2./n;

const double xmin = -2.;
const double xmax = 2.;
const double ymin = -2.;
const double ymax = 2.;

void f(double x, double y)
{
  const double u = -y+.3*x;
  const double v = x+.3*y;
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
