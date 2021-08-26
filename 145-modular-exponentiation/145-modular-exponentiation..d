import std.conv, std.string, std.stdio;

ulong binary_exp(in ulong base, in ulong exponent, in ulong mod)
{
    ulong b = base;
    ulong e = exponent;
    ulong r = 1;

    while (e > 0)
    {
        if ((e & 1) == 1) r = (r * b) % mod;
        e >>= 1;
        b = (b * b) % mod;
    }

    return r;
}

int main()
{
    uint cases = readln.strip.to!uint;
    
    ulong[] mod;
    for (uint k = 0; k < cases; k++)
    {
        auto bem = readln.strip.split;
        ulong b = bem[0].to!ulong;
        ulong e = bem[1].to!ulong;
        ulong m = bem[2].to!ulong;
        
        mod ~= binary_exp(b, e, m);
    }
    
    writeln;
    for (uint k = 0; k < mod.length; k++) write(mod[k], " ");
    writeln;
    
    return 0;
}