local lunit = require "lunitx"
local pool = require "tpool"


if _VERSION >= 'Lua 5.2' then
    _ENV = lunit.module('simple','seeall')
else
    module( "simple", package.seeall, lunit.testcase )
end

function test_sanity()
    local table, id = pool.get()
    assert_not_nil(table)
    assert_equal(1, id)
    pool.free(table, id)

    local table1, id1 = pool.get(id)
    assert_equal(table, table1)
    assert_equal(id, id1)
end
