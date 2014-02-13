local pool = require "tpool"

local tget = pool.get
local tfree = pool.free

local table, id = tget()

local times = 5000000

local function test1()
    local t = {}
    for i = 1, 10 do
        t[i] = 2^i
    end
end

local function test2()
    local t = table
    for i = 1, 20 do
        t[i] = 2^i
    end
end

local function benchmark(name, func)
    local t = os.clock()
    for i=1, times do
        func()
    end
    print(name, os.clock() - t)
end

benchmark("without pool", test1)
benchmark("with pool", test2)

tfree(table, id)
