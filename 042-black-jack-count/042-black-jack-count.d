import std.algorithm;
import std.array;
import std.complex;
import std.conv;
import std.functional;
import std.math;
import std.range;
import std.stdio;
import std.string;
import std.typecons;
import std.typetuple;

void main()
{
    auto file = stdin;
    file.readln;
    foreach (string line; file.lines)
    {
        auto count = 0;
        auto aceCount = 0;

        foreach (card; line.split.map!(s => s[0]))
        {
            switch (card)
            {
                case '2': .. case '9':
                    count += card - '0';
                    break;
                case 'T':
                case 'J':
                case 'Q':
                case 'K':
                    count += 10;
                    break;
                case 'A':
                    count += 11;
                    ++aceCount;
                    break;
                default:
                    assert(false);
            }
        }

        while ((count > 21) && (aceCount > 0))
        {
            count -= 10;
            --aceCount;
        }

        if (count > 21)
        {
            write("Bust ");
        }
        else
        {
            write(count, " ");
        }
    }
}