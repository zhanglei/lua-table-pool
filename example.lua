local pool = require "tpool"

local table, id = pool.get()

local times = 5000000

function test1()
    local t = {}
    for i = 1, 10 do
        t[i] = 2^i
    end
end

function test2()
    local t = table
    for i = 1, 20 do
        t[i] = 2^i
    end
end

function benchmark(name, func)
    local t = os.clock()
    for i=1, times do
        func()
    end
    print(name, os.clock() - t)
end

benchmark("no pool", test1)
benchmark("pool", test2)

pool.free(table, id)
