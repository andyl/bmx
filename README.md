# Bugmark Exchange

## About 

The Bugmark Exchange (BMX) matches Funder and Worker offers to form service contracts.

![Exchange Overview](assets/ExchangeOverview.jpg)

Offers are generally expressed as:

- **Funder Offer**<br/>"I offer to pay *Amount $X* if *Issue Y* is closed on *Date Z*"
- **Worker Offer**<br/>"I offer to fix *Issue Y* by *Date Z* for *Amount $X*"

BMX matches offers with an auction-style best-fit algorithm.  Once offers are
matched, a service contract is formed.  On maturation date, issue status is
recorded and funds are paid.

## Using BMX

BMX is intended to be used as a standalone server.  BMX runs in the datacenter
as a public SAAS, and is also available to download for experiments and private
exchanges.  The primary interface for BMX is a GraphQL API, and there is also
an HTML UI for administration.

BMX is packaged as a Docker Image and a standalone executable.

## Market Signals

BMX prices reflect the true market demand, generating market signals that allow
of efficient allocation of resources to areas of critical need.

## Status

This release of BMX is UNDER CONSTRUCTION.  Expected release Summer 2019.

