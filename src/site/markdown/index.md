## Purpose
This service manages manual `Movements` in _manual_ warehouses. These kind of tasks are basically used to move inventory between different
`Locations`. `Movements` are used for replenishment, stocktaking or goods-in operations.

## Features
* Different types of Movements exist: Inbound, Outbound, Replenishment, Reconciliation etc.
* The type of Movement can be given at creation, or it is trying to be resolved from the Movement attributes
* Movements can be grouped into groups

## Release
```
$ mvn deploy -Prelease,gpg
```

### Release Documentation
```
$ mvn package -DsurefireArgs=-Dspring.profiles.active=ASYNCHRONOUS,TEST -Psonar
$ mvn site scm-publish:publish-scm
```
