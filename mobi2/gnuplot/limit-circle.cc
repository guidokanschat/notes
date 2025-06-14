#include <iostream>
#include <cmath>


const unsigned int n=20;
const double scale = 1.6/n;

const double xmin = -2.;
const double xmax = 2.;
const double ymin = -2.;
const double ymax = 2.;

void f(double x, double y)
{
  const double r = std::sqrt(x*x+y*y);
  const double rr = std::sqrt(r);
  const double dphi = std::atan(3.*(r-1.5));
  const double phi = std::atan2(y,x)+.8*dphi;
  const double c = std::cos(phi);
  const double s = std::sin(phi);
  const double u = -rr*s;
  const double v = c*rr;
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
