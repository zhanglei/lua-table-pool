local ok, new_tab = pcall(require, "table.new")
if not ok then
    new_tab = function (narr, nrec) return {} end
end

local default_pool_size = 4
local pool = new_tab(0, default_pool_size)
local counter = 0

local _M = new_tab(0, 4)


local function get_id()
    counter = counter + 1
    return counter
end

function _M.init(size)
    pool = new_tab(0, size * 2)
    counter = 0
end

function _M.get(id)
    if id then
        local t = pool[id]
        pool[id] = nil
        return t, id
    end

    return new_tab(0, 4), get_id()
end

function _M.free(tab, id)
    if not pool[id] then
        pool[id] = tab
        return true
    else
        return nil, "duplicated id"
    end
end

return _M
