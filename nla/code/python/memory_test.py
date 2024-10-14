# contributed by Georg Mix

import numpy as np

def test1(r):
    p = r - np.ones(4)
    r +=  2*np.ones(4)
    print("  p = ", p, ", id = ", id(p))
    print("  r = ", r, ", id = ", id(r))
    print()

def test2(r):
    p = r
    p -= np.ones(4)
    r +=  2*np.ones(4)
    print("  p = ", p, ", id = ", id(p))
    print("  r = ", r, ", id = ", id(r))
    print()

def test3(r):
    p = r - np.ones(4)
    r +=  2*np.ones(4)
    print("  p = ", p, ", id = ", id(p))
    print("  r = ", r, ", id = ", id(r))
    r = p
    print("  r = ", r, ", id = ", id(r))
    print()

def test4(r):
    A = 2 * np.identity(4)
    x = np.ones(4)

    p = r
    p -= np.dot(A, x)
    print("p = r")
    print("p -= np.dot(A, x)")
    print("p = ", p, ", id = ", id(p))
    print("r = ", r, ", id = ", id(r))
    print()

    r = p
    print("r = p")
    print("p = ", p, ", id = ", id(p))
    print("r = ", r, ", id = ", id(r))
    print()

    r = np.ones(4)
    print("r = np.ones(4)")
    print("p = ", p, ", id = ", id(p))
    print("r = ", r, ", id = ", id(r))
    print()

    p[:] = 3 * np.ones(4)
    print("p[:] = 3 * np.ones(4)")
    print("p = ", p, ", id = ", id(p))
    print("r = ", r, ", id = ", id(r))
    print()

    p = 10 * np.ones(4)
    print("p  = 3 * np.ones(4)")
    print("p = ", p, ", id = ", id(p))
    print("r = ", r, ", id = ", id(r))
    print()


if __name__ == "__main__":
    print("test1")
    r = np.ones(4) * 6
    print("r =   ", r, ", id = ", id(r))
    test1(r)
    print("Back in the main function")
    print("r =   ", r, ", id = ", id(r))
    print("test2")
    r = np.ones(4) * 6
    print("r =   ", r, ", id = ", id(r))
    test2(r)
    print("Back in the main function")
    print("r =   ", r, ", id = ", id(r))
    print("test3")
    r = np.ones(4) * 6
    print("r =   ", r, ", id = ", id(r))
    test3(r)
    print("Back in the main function")
    print("r =   ", r, ", id = ", id(r))
    print("test4")
    r = np.ones(4) * 6
    print("r =   ", r, ", id = ", id(r))
    test4(r)
    print("Back in the main function")
    print("r = ", r, ", id = ", id(r))
