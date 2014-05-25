# mongo_fdw/Makefile
#
# Copyright (c) 2012-2014 Citus Data, Inc.
#

MODULE_big = mongo_fdw
PG_CPPFLAGS = --std=c99 $(shell pkg-config --cflags libmongoc-1.0) -O0
SHLIB_LINK = $(shell pkg-config --libs libmongoc-1.0) -L /usr/local/lib
OBJS = mongo_fdw.o mongo_query.o

EXTENSION = mongo_fdw
DATA = mongo_fdw--1.0.sql

REGRESS = mongo_fdw
REGRESS_OPTS = --inputdir=test --outputdir=test \
	       --load-extension=$(EXTENSION)

#
# Users need to specify their Postgres installation path through pg_config. For
# example: /usr/local/pgsql/bin/pg_config or /usr/lib/postgresql/9.1/bin/pg_config
#

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
