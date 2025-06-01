#include <iostream>

const unsigned int n=16;
double scale = 1.6/n;

void f(double x, double y)
{
  std::cout << x << '\t'
	    << y << '\t'
	    << (scale * 1.) << '\t'
	    << (scale * y*(1-y)) << '\n';
}

int main()
{
  for (unsigned int i=0;i<=n;++i)
    {
      for (unsigned int j=0;j<=n;++j)
	{
	  f(2.*i/n,2.*j/n);
	}
      std::cout << std::endl;
    }
}
