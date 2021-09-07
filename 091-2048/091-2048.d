import std.algorithm;
import std.array;
import std.conv;
import std.range;
import std.stdio;

enum Direction { L, R, U, D }

void move(int[][] grid, Direction direction)
{
    final switch (direction)
    {
    case Direction.L:
        foreach (y; 0..4)
        {
            foreach (x; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach (i; (x + 1)..4)
                    {
                        if (grid[y][i] != 0)
                        {
                            grid[y][x] = grid[y][i];
                            grid[y][i] = 0;
                            break;
                        }
                    }
                }
            }
            foreach (x; 0..(4 - 1))
            {
                if (grid[y][x] == grid[y][x + 1])
                {
                    grid[y][x] += grid[y][x + 1];
                    grid[y][x + 1] = 0;
                }
            }
            foreach (x; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach (i; (x + 1)..4)
                    {
                        if (grid[y][i] != 0)
                        {
                            grid[y][x] = grid[y][i];
                            grid[y][i] = 0;
                            break;
                        }
                    }
                }
            }
        }
        break;
    case Direction.R:
        foreach (y; 0..4)
        {
            foreach_reverse (x; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach_reverse (i; 0..x)
                    {
                        if (grid[y][i] != 0)
                        {
                            grid[y][x] = grid[y][i];
                            grid[y][i] = 0;
                            break;
                        }
                    }
                }
            }
            foreach_reverse (x; (0 + 1)..4)
            {
                if (grid[y][x] == grid[y][x - 1])
                {
                    grid[y][x] += grid[y][x - 1];
                    grid[y][x - 1] = 0;
                }
            }
            foreach_reverse (x; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach_reverse (i; 0..x)
                    {
                        if (grid[y][i] != 0)
                        {
                            grid[y][x] = grid[y][i];
                            grid[y][i] = 0;
                            break;
                        }
                    }
                }
            }
        }
        break;
    case Direction.U:
        foreach (x; 0..4)
        {
            foreach (y; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach (i; (y + 1)..4)
                    {
                        if (grid[i][x] != 0)
                        {
                            grid[y][x] = grid[i][x];
                            grid[i][x] = 0;
                            break;
                        }
                    }
                }
            }
            foreach (y; 0..(4 - 1))
            {
                if (grid[y][x] == grid[y + 1][x])
                {
                    grid[y][x] += grid[y + 1][x];
                    grid[y + 1][x] = 0;
                }
            }
            foreach (y; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach (i; (y + 1)..4)
                    {
                        if (grid[i][x] != 0)
                        {
                            grid[y][x] = grid[i][x];
                            grid[i][x] = 0;
                            break;
                        }
                    }
                }
            }
        }
        break;
    case Direction.D:
        foreach (x; 0..4)
        {
            foreach_reverse (y; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach_reverse (i; 0..y)
                    {
                        if (grid[i][x] != 0)
                        {
                            grid[y][x] = grid[i][x];
                            grid[i][x] = 0;
                            break;
                        }
                    }
                }
            }
            foreach_reverse (y; (0 + 1)..4)
            {
                if (grid[y][x] == grid[y - 1][x])
                {
                    grid[y][x] += grid[y - 1][x];
                    grid[y - 1][x] = 0;
                }
            }
            foreach_reverse (y; 0..4)
            {
                if (grid[y][x] == 0)
                {
                    foreach_reverse (i; 0..y)
                    {
                        if (grid[i][x] != 0)
                        {
                            grid[y][x] = grid[i][x];
                            grid[i][x] = 0;
                            break;
                        }
                    }
                }
            }
        }
        break;
    }
}

void main()
{
    auto grid = iota(0, 4)
        .map!(_ => readln)
        .map!(line => line.split.to!(int[]))
        .array;

    foreach (c; readln.split)
    {
        final switch (c)
        {
        case "L":
            grid.move(Direction.L);
            break;
        case "R":
            grid.move(Direction.R);
            break;
        case "U":
            grid.move(Direction.U);
            break;
        case "D":
            grid.move(Direction.D);
            break;
        }
    }

    int[int] count;
    int max = 0;
    foreach (y; 0..4)
    {
        foreach (x; 0..4)
        {
            ++count[grid[y][x]];
            if (max < grid[y][x])
            {
                max = grid[y][x];
            }
        }
    }

    for (auto i = 2; i <= max; i *= 2)
    {
        writef("%d ", (i in count) ? count[i]: 0);
    }
}
