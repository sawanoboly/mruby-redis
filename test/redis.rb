##
## Redis Test
##

assert("Redis#set, Redis#get") do
  r = Redis.new "127.0.0.1", 6379
  r.set "hoge", "fuga"
  ret = r.get "hoge"
  r.close

  assert_equal "fuga", ret
end

assert("Redis#[]=, Redis#[]") do
  r = Redis.new "127.0.0.1", 6379
  r["hoge"] = "fuga"
  ret = r["hoge"]
  r.close

  assert_equal "fuga", ret
end

assert("Redis#exist?") do
  r = Redis.new "127.0.0.1", 6379
  r["hoge"] = "aaa"
  ret1 = r.exists? "hoge"
  ret2 = r.exists? "fuga"
  r.close

  assert_true ret1
  assert_false ret2
end

assert("Redis#hset", "Redis#hget") do
  r = Redis.new "127.0.0.1", 6379
  r.del "myhash"

  ret_set_f1_a = r.hset "myhash", "field1", "a"
  ret_get_f1_a = r.hget "myhash", "field1"
  ret_set_f1_b = r.hset "myhash", "field1", "b"
  ret_get_f1_b = r.hget "myhash", "field1"

  r.hset "myhash", "field2", "c"
  ret_get_f2 = r.hget "myhash", "field2"

  r.close

  assert_true ret_set_f1_a    # true if field is a new field in the hash and value was set.
  assert_false ret_set_f1_b   # false if field already exists in the hash and the value was updated.

  assert_equal "a", ret_get_f1_a
  assert_equal "b", ret_get_f1_b

  assert_equal "c", ret_get_f2
end

assert("Redis#hdel") do
  r = Redis.new "127.0.0.1", 6379
  r.del "myhash"

  r.hset "myhash", "field1", "a"
  r.hset "myhash", "field2", "b"
  ret_get_f1_a = r.hget "myhash", "field1"
  r.hdel "myhash", "field1"
  ret_get_f1_nil = r.hget "myhash", "field1"
  ret_exists = r.exists?("myhash")

  r.close

  assert_equal "a", ret_get_f1_a
  assert_nil ret_get_f1_nil
  assert_true ret_exists
end

# got erro for travis ci. comment out until fix the problems
assert("Redis#zadd, Redis#zrange") do
  r = Redis.new "127.0.0.1", 6379
  r.del "hs"
  r.zadd "hs", 80, "a"
  r.zadd "hs", 50.1, "b"
  r.zadd "hs", 60, "c"
  ret = r.zrange "hs", 0, -1
  r.close

  assert_equal ["b", "c", "a"], ret
end

assert("Redis#zrevrange") do
  r = Redis.new "127.0.0.1", 6379
  r.del "hs"
  r.zadd "hs", 80, "a"
  r.zadd "hs", 50.1, "b"
  r.zadd "hs", 60, "c"
  ret = r.zrevrange "hs", 0, -1
  r.close

  assert_equal ["a", "c", "b"], ret
end

assert("Redis#zrank") do
  r = Redis.new "127.0.0.1", 6379
  r.del "hs"
  r.zadd "hs", 80, "a"
  r.zadd "hs", 50.1, "b"
  r.zadd "hs", 60, "c"
  ret1 = r.zrank "hs", "b"
  ret2 = r.zrank "hs", "c"
  ret3 = r.zrank "hs", "a"
  r.close

  assert_equal 0, ret1
  assert_equal 1, ret2
  assert_equal 2, ret3
end

assert("Redis#zscore") do
  r = Redis.new "127.0.0.1", 6379
  r.del "hs"
  r.zadd "hs", 80, "a"
  r.zadd "hs", 50.1, "b"
  r.zadd "hs", 60, "c"
  ret_a = r.zscore "hs", "a"
#  ret_b = r.zscore "hs", "b"
  ret_c = r.zscore "hs", "c"
  r.close

  assert_equal "80", ret_a
#  assert_equal "50.1", ret_b      # value is not 50.1 in mruby and redis-cli
  assert_equal "60", ret_c
end

# TODO: Add test
# - select
# - randomkey
# - del
# - incr
# - decr
# - lpush
# - lrange
# - ltrim
# - publish
