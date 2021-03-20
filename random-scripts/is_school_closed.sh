#! /bin/bash
echo "All the closed schools(`lynx -dump http://www.timesunion.com/closings/ | grep -c "Closed"`):"
lynx -dump http://www.timesunion.com/closings/ | grep -B 1 "Closed"
echo ""
echo "Closed Cohoes schools(`lynx -dump http://www.timesunion.com/closings/ | grep -c "Niskayuna"`):"
lynx -dump http://www.timesunion.com/closings/ | grep -A 1 "Cohoes"
