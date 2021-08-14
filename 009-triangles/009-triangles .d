import std.stdio;


void main()
{
    size_t tripletCount;
    ulong a, b, c;
    bool[] triplets;
    
    readf("%d\n", &tripletCount);
    triplets.length = tripletCount;
    foreach (size_t i; 0 .. tripletCount)
    {
        readf("%d %d %d\n", &a, &b, &c);
        
        if (a + b <= c ||
            b + c <= a ||
            c + a <= b)
            triplets[i] = false;
        else
            triplets[i] = true;
    }
    
    foreach (bool triplet; triplets)
    {
        writef("%d ", triplet);
    }
    writeln();
}