# Kuzu 0.11.3 PathPropertyProbe SIGFPE

## Summary

Kuzu 0.11.3 crashes with `SIGFPE` when a variable-length path query runs after all nodes and relationships have been removed with `DETACH DELETE`.

The expected result is an empty result set. The observed result is process termination inside `kuzu::processor::PathPropertyProbe::probe()`.

## Environment

- Kuzu: 0.11.3
- Platform: Linux x86-64
- Discovery method: GRAF
- Reproduction: deterministic with the included three-node case

## Reproduction

Run `repro.cypher` against a fresh database:

    ./kuzu repro.db < repro.cypher

Expected result:

    The final MATCH query returns 0 rows.

Observed result:

    SIGFPE in kuzu::processor::PathPropertyProbe::probe()

## Confirmed runtime evidence

Before deletion, relationship `_ID: 1:7` exists:

    Leaf(id=3) -[LINK, _ID: 1:7]-> Leaf(id=4)

After `DETACH DELETE`, `CHECKPOINT`, and reopening the database:

    node_count = 0
    rel_count  = 0

The variable-length path execution still passes the deleted relationship ID to `PathPropertyProbe`:

    sizeToProbe  = 1
    id.offset    = 7
    id.tableID   = 1
    maxHashSlots = 0

The faulting instruction is:

    divq 0x8(%r15)

The divisor stored at `r15 + 8` is zero.

## Failure chain

    Deleted relationship ID 1:7 enters recursive path output
            |
            v
    PathPropertyProbe attempts to materialize its properties
            |
            v
    The visible relationship property hash table has zero slots
            |
            v
    hash(ID) % 0
            |
            v
    SIGFPE

## Source analysis

Kuzu 0.11.3 recursive execution iterates raw node offsets without first checking `NodeTable::isVisible()`. Neighbor-node scanning also lacks a node-visibility filter.

LadybugDB later added these checks in:

- https://github.com/LadybugDB/ladybug/pull/459

A related defensive improvement for `PathPropertyProbe` appears in:

- https://github.com/LadybugDB/ladybug/pull/457

The equivalent visibility patch has not yet been backported and tested against this Kuzu reproduction in this repository.

## Related reports

- https://github.com/kuzudb/kuzu/issues/4354
- https://github.com/LadybugDB/ladybug/issues/456

## Status

This repository documents a historical bug in archived Kuzu 0.11.3. A closely related recursive-visibility issue was later fixed in LadybugDB.

This case is not presented as a new zero-day vulnerability or as an assigned CVE.