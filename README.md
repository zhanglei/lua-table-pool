lua-table-pool
==============
Lua talbe pool is like a memory pool, but stores lua tables.

Synopsis
========

    local pool = require "tpool"
    pool.init(8)
    local table, id = pool.get()
    -----------------------------------
    -- do something with this table ...
    -----------------------------------
    pool.free(table, id)

API
===

tpool.init
----------
`tpool.init(size)`

This create a table pool of size `size`. If you do not call this method, the default pool size is 4.

tpool.get
---------
`table, id = tpool.get(id)`

If `id` is not specified, then the table pool will create a new table then returns the table and its corresponding id to the user. If `id` is specified, it will return the corresponding table.

The returned table will be removed from table pool and should be managed by the user. You can delete this table or return it to the pool by using `tpool.free` for reuse.

If you sepcify an id which is not returned by tpool.get or the corresponding table has already been used and has not been returned to the table pool yet, it will return `nil`.

tpool.free
----------
`r = tpool.free(table, id)`

When you are done with the table you got from the table pool, you should return this table to the table pool using `pool.free`.
`id` and `table` is returned by previous `tpool.get` call. If this `id` has already been freed, it will return `nil`. Otherwise, it will return `true`

TODO
====

Authors
=======
Jiale Zhi <vipcalio@gmail.com>, CloudFlare Inc.

Yichun Zhang (agentzh) <agentzh@gmail.com>, CloudFlare Inc.


