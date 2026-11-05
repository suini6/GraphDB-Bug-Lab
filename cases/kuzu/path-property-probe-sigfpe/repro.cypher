CREATE NODE TABLE `Leaf`(
    `id` INT64,
    PRIMARY KEY (`id`)
);

CREATE REL TABLE GROUP `LINK`(
    FROM `Leaf` TO `Leaf`,
    `weight` DOUBLE
);

CREATE (:`Leaf` {`id`: 2});
CREATE (:`Leaf` {`id`: 3});
CREATE (:`Leaf` {`id`: 4});

MATCH (n1:Leaf), (n2:Leaf)
MERGE (n1)-[r:LINK]->(n2)
ON CREATE SET r.weight = 1.0
RETURN count(*);

MATCH (n:Leaf)
DETACH DELETE n;

MATCH p = (n1:Leaf)-[*1..1]->(n2:Leaf)
RETURN nodes(p);
