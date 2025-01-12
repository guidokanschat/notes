#include <iostream>

double chebyshev(unsigned int n, double x)
{
  if (n==0) return 1.;
  if (n==1) return x;
  return 2*x*chebyshev(n-1,x) - chebyshev(n-2,x);
}

// The polynomial that oscillates between a and b and is equal to 1 at c
double shifted_chebyshev(unsigned int n, double x, double a, double b, double c)
{
  double y = (2*x-(a+b))/(b-a);
  return chebyshev(n,y)/chebyshev(n,(2*c-(a+b))/(b-a));
}

int main()
{
  const int steps = 6;
  for (double x=0.;x<=10.;x += .1)
    std::cout << x
	      << '\t' << shifted_chebyshev(steps,x,0.,9.,10.)
      	      << '\t' << shifted_chebyshev(steps-1,x,0.,8.,9.)*(10.-x)/(10.-9.)
	      << '\n';
}
