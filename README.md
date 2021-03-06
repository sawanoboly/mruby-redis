# mruby-redis [![Build Status](https://travis-ci.org/matsumoto-r/mruby-redis.svg?branch=master)](https://travis-ci.org/matsumoto-r/mruby-redis)

[Hiredis](https://github.com/redis/hiredis) binding for mruby. Hiredis is a
minimalistic C client library for the Redis database. Redis is an open source,
BSD-licensed, advanced key-value store. It is often referred to as a data
structure server since keys can contain strings, hashes, lists, sets and sorted
sets. Plese visit [redis' official website](http://redis.io/) for more details
about Redis.

__Running Redis might be impossible for memory/CPU-constrained environments,__
so we can recommend [mruby-vedis](https://github.com/matsumoto-r/mruby-vedis).
`vedis` is an embeddable datastore distributed as a C library. It supports over
70 commands similar to Redis, but runs in memory (hence doesn't require a
networking layer).
Please visit [vedis' website](http://vedis.symisc.net/index.html) for more
details.

## INSTALLATION

#### Using mrbgems

Add conf.gem line to `build_config.rb`:

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :git => 'https://github.com/matsumoto-r/mruby-redis.git'
end
```


## USAGE

### Connecting to a Redis server

```ruby
client = Redis.new "127.0.0.1", 6379, 2 # Connect to the server
client.select 0                         # Select the database
```

### Commands

#### `Redis#[]=`

TBD


#### `Redis#[]`

```ruby
client["key"]
```

#### `Redis#bulk_reply`

TBD


#### `Redis#close`

TBD


#### `Redis#decr` [doc](http://redis.io/commands/decr)

```ruby
client.decr "key"
```


#### `Redis#decrby` [doc](http://redis.io/commands/decrby)

TBD


#### `Redis#del` [doc](http://redis.io/commands/del)

```ruby
client.del "key"
```

#### `Redis#exists?` [doc](http://redis.io/commands/exists?)

```ruby
client.exists?("key")
```


#### `Redis#expire` [doc](http://redis.io/commands/expire)

TBD


#### `Redis#flushdb` [doc](http://redis.io/commands/flushdb)

TBD


#### `Redis#get` [doc](http://redis.io/commands/get)

```ruby
client.get "key"
```


#### `Redis#hdel` [doc](http://redis.io/commands/hdel)

```ruby
client.hdel "myhash", "field1"
```


#### `Redis#hget` [doc](http://redis.io/commands/hget)

```ruby
client.hget "myhash", "field1"
```


#### `Redis#hgetall` [doc](http://redis.io/commands/hgetall)

TBD


#### `Redis#hkeys` [doc](http://redis.io/commands/hkeys)

TBD


#### `Redis#hset` [doc](http://redis.io/commands/hset)

```ruby
client.hset "myhash", "field1", "a"
```


#### `Redis#incr` [doc](http://redis.io/commands/incr)

```ruby
client.incr "key"
```


#### `Redis#incrby` [doc](http://redis.io/commands/incrby)

TBD


#### `Redis#keys` [doc](http://redis.io/commands/keys)

TBD


#### `Redis#lindex` [doc](http://redis.io/commands/lindex)

TBD


#### `Redis#llen` [doc](http://redis.io/commands/llen)

TBD


#### `Redis#lpop` [doc](http://redis.io/commands/lpop)

TBD


#### `Redis#lpush` [doc](http://redis.io/commands/lpush)

TBD


#### `Redis#lrange` [doc](http://redis.io/commands/lrange)

```ruby
client.lrange "logs", 0, -1
```


#### `Redis#ltrim` [doc](http://redis.io/commands/ltrim)

```ruby
client.ltrim "logs", 1, -1
```


#### `Redis#publish` [doc](http://redis.io/commands/publish)

TBD


#### `Redis#queue` [doc](http://redis.io/commands/queue)

TBD


#### `Redis#randomkey` [doc](http://redis.io/commands/randomkey)

TBD


#### `Redis#reply` [doc](http://redis.io/commands/reply)

TBD


#### `Redis#rpop` [doc](http://redis.io/commands/rpop)

TBD


#### `Redis#rpush` [doc](http://redis.io/commands/rpush)

TBD


#### `Redis#sadd` [doc](http://redis.io/commands/sadd)

TBD


#### `Redis#scard` [doc](http://redis.io/commands/scard)

TBD


#### `Redis#set` [doc](http://redis.io/commands/set)

```ruby
client.set key, "200"
```


#### `Redis#sismember` [doc](http://redis.io/commands/sismember)

TBD


#### `Redis#smembers` [doc](http://redis.io/commands/smembers)

TBD


#### `Redis#spop` [doc](http://redis.io/commands/spop)

TBD


#### `Redis#ttl` [doc](http://redis.io/commands/ttl)

TBD


#### `Redis#zadd` [doc](http://redis.io/commands/zadd)

```ruby
client.zadd "hs", 80, "a"
```


#### `Redis#zcard` [doc](http://redis.io/commands/zcard)

TBD


#### `Redis#zrange` [doc](http://redis.io/commands/zrange)

```ruby
client.zrange "hs", 0, -1
```


#### `Redis#zrank` [doc](http://redis.io/commands/zrank)

```ruby
client.zrank "hs", "a"
```


#### `Redis#zrevrange` [doc](http://redis.io/commands/zrevrange)

```ruby
client.zrevrange "hs", 0, -1
```


#### `Redis#zrevrank` [doc](http://redis.io/commands/zrevrank)

```ruby
client.zrevrank "hs", "a"
```


#### `Redis#zscore` [doc](http://redis.io/commands/zscore)

```ruby
client.zscore "hs", "a"
```

See [`example/redis.rb`](https://github.com/matsumoto-r/mruby-redis/blob/master/example/redis.rb) for more details.


## LICENSE

MIT License - Copyright (c) mod\_mruby developers 2012
