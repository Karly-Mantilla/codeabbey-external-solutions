import std.algorithm;
import std.array;
import std.conv;
import std.math;
import std.range;
import std.stdio;
import std.string;
import std.typecons;

auto classify(int a, int b, int c)
{
    auto d = (a ^^ 2 + b ^^ 2) - (c ^^ 2);
    if (d == 0)
    {
        return 'R';
    }
    if (d < 0)
    {
        return 'O';
    }
    if (d > 0)
    {
        return 'A';
    }
    assert(false);
}

void main()
{
    auto file = stdin;
    file
        .byLine
        .dropOne
        .map!(line => line.split.map!(to!int))
        .map!(nums => classify(nums[0], nums[1], nums[2]))
        .each!(r => write(r, " "));
}