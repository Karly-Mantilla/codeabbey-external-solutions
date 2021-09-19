import std.algorithm;
import std.array;
import std.conv;
import std.functional;
import std.math;
import std.range;
import std.stdio;
import std.string;
import std.typecons;

auto standardDeviation(R)(R range) {
    auto m = range.sum / range.length.to!double;
    auto d = range.fold!((a, x) => a + (m - x) ^^ 2) / range.length.to!double;
    return tuple(m, sqrt(d));
}

void main()
{
    auto input = stdin;
    input.readln;

    foreach (string line; input.lines)
    {
        auto temp = line.split;
        auto name = temp[0];
        auto data = temp[1..$].map!(to!int);

        auto result = standardDeviation(data);
        auto m = result[0];
        auto d = result[1];

        if (d >= (4 * m * 0.01))
        {
            writef("%s ", name);
        }
    }
}