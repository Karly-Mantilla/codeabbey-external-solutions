#include <iostream>
#include <iomanip>
#include <string>
#include <algorithm>
#include <bitset>
#include <cmath>

using namespace std;

string trimLeft(int num)
{
    bitset<8> binary(num);
    string binStr = binary.to_string();

    size_t startPos = binStr.find_first_of("1");
    if (string::npos != startPos) {
        binStr.substr(startPos).swap(binStr);
    }

    return binStr;
}

int main()
{
    string input;
    getline(cin, input);

    int steps = 0;
    string line = input;
    while (line != "10") {

        string newBitSeq;
        int counter{1};
        int bitNum{1};

        for (size_t i=1; i<line.length(); ++i) {
            if (line[i] == ('0' + bitNum)) {
                ++counter;
            } else {
                newBitSeq += trimLeft(counter);
                counter = 1;
                bitNum = (bitNum + 1) % 2;
            }
        }
        newBitSeq += trimLeft(counter);
        line = newBitSeq;

        ++steps;
    }
    cout << steps << " ";

    size_t numOnes = std::count(input.begin(), input.end(), '1');
    long double numParents = pow(2.0, numOnes-1);
    cout << std::fixed << std::setprecision(0) << numParents << endl;

    return 0;
}