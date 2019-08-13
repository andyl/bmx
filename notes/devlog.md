# BMX DevLog

## 2019 May 01 Wed | 0800-1000

- [x] Upgrade Elixir, Phoenix, Erlang

|---------------------------------------|------------------------|
| COMMAND                               | DESCRIPTION            |
|---------------------------------------|------------------------|
| elixir --version                      | show elixir and erlang |
| mix archive.install hex phx_new 1.4.3 | install phoenix        |
| mix local.hex --force                 | installs hex locally   |
| mix local.rebar --force               | installs rebar locally |
| mix help --search hex                 | show hex tasks         |
|---------------------------------------|------------------------|

## 2019 May 03 Fri 

- [x] Learn Mix and Hex
- [x] Review Elixir guide

## 2019 May 07 Tue 

- [x] Review Elixir Book
- [x] Finish OTP Book 
- [x] Finish Adopting Elixir Book 
- [x] Review Ecto Book w/Exercises
- [x] Review Ecto GitHub
- [x] Review Ecto Hex Doc
- [x] Review Phoenix Book w/Exercises
- [x] Review Phoenix Website
- [x] Learn Umbrellas
- [x] Take Elixir class (coding gnome)
- [x] Take [Elixir Class][PragStudio]

## 2019 May 08 Wed 

- [x] Get rid of all compile errors in Absinthe examples (git repo)
- [x] Review Absinthe Book w/Exercises
- [x] Absinthe Class Sections 1-2

## 2019 May 09 Thu 

- [x] Follow the Ecto Getting Started
- [x] Absinthe Class Sections 3-6
- [x] setup bmx umbrella app
- [x] umbrella: dependencies
- [x] umbrella: run specs
- [x] umbrella: editor nav
- [x] umbrella: separate webapps on different ports

## 2019 May 10 Fri 

- [x] Refactor application layout

## 2019 May 18 Sat 

- [x] Get test|model navigation working in vim
- [x] Get test watcher working
- [x] Install ExMachina (factory girl analog)
- [x] Fix Vim-Fzf - don't detect .gitignore dirs
- [x] Get Ecto queries and changesets working
- [x] Get Ecto Sandbox test working
- [x] Get DataModel test working
- [x] Fix vim cursorline formatting (non-grey periods) (f2)

## 2019 May 19 Sun 

- [x] Test ExMachina
- [x] Install and test propcheck
- [x] Fix snippets
- [x] Update editing worksheet
- [x] Move sandbox helper into helper script
- [x] How to use jsonb in Ecto?

## 2019 May 20 Mon 

- [x] Add ExGuard
- [x] Learn ecto types
- [x] Add phonenum type to Ecto
- [x] Add Dialyxer
- [x] Add ExDoc
- [x] Add ExGuard
- [x] Add numrange type to Ecto
- [x] Add tsrange type to Ecto
- [x] Ecto / Indexes
- [x] Querying JsonB with Ecto
- [x] Study Commanded
- [x] Study Event Bus 

## 2019 May 20 Mon 

- [x] How to make a common statement block? (copy timestamps)
- [x] Handle Associations
- [x] TI - create data models (tracker / issue)
- [x] TI - create macro support for statements
- [x] TI - create data associations (tracker / issue)
- [x] TI - create context layer

## 2019 May 22 Wed 

- [x] install asdf
- [x] read commanded guides

## 2019 Jun 19 WED 

- [x] Upgrade to 1.9
- [x] Add Timex (bmx01 and bmx_web)
- [x] Add LiveView (bmx_web)
- [x] Get phoenix working
- [x] Configure Bootstrap
- [x] Add demo pages
- [x] Configure ActiveLink 
- [x] Configure LiveView
- [x] Build Release
- [x] Build Docker
- [x] Host Docs
- [x] Host Docker Image
- [x] Add GraphQL HelloWorld

## 2019 Jul 12 Fri

- [x] Create phoenix template
- [x] Create `new.phx` script
- [x] Distillery works
- [x] Docker works
- [x] LiveView works
- [x] Bootstrap works
- [x] Vim/Elixir works
- [x] ASDF works
- [x] Add LazyDocker
- [x] Created Event-Sourcing Strategy

## 2019 Jul 13 Sat 

- [x] Add CI
- [x] DOC1 - Publish doc on Bugmark.tech
- [x] BMX image on DockerHub
- [x] BMX container on bugmark.tech 

## 2019 Jul 14 Sun 

- [x] OTP Experiment (BMA Embedding)
- [x] Add Fontawesome
- [x] Cleanup Documentation
- [x] Cleanup BMA Messaging
- [x] Cleanup Website
- [x] CASMACC: Update descriptions on DockerHub 
- [x] BUGMARK: Update descriptions on DockerHub 

## 2019 Jul 15 Mon 

- [x] Study ElixirInAction/OTP

## 2019 Jul 16 Tue 

- [x] New generators for umbrellas
- [x] Distillery multiple release config
- [x] Include BMA in BMX (OTP Config)
- [x] Distillery multiple releases

## 2019 Jul 17 Wed 

- [x] Rename `marcom` to `bmx_marcom`
- [x] Add Bmx01.Sys.Host
- [x] Add Bmx01.Sys.Time
- [x] Add Bmx01.Sys.Seed
- [x] Define a layout for read-models
- [x] Create user resource (add, remove, update, list)
- [x] Add Bmx01.Sys.Host.reset()
- [x] Adopt `Vex` to validate command input
- [x] Add Bmx01.Sys.Data.seed()
- [x] Cmd::UserCreate
- [x] Add Data.seed()
- [x] Add Data.counts()
- [x] Add CommandLog
- [x] Setup commands
- [x] Add UserFactory that uses Command

## 2019 Jul 18 Thu 

- [x] Add Account context
- [x] Add tests for account context
- [x] Clean up BmxWeb
- [x] Add web subnav

## 2019 Jul 19 Fri 

- [x] Add Admin Pages (Users/Offers/Contracts)
- [x] VIM: Fix controller/template/view vim nav

## 2019 Jul 20 Sat 

- [ ] Admin: Create an Add-User button
- [ ] Admin: Create an Deactivate-User button (status: active/deactivated/etc.)
- [ ] Admin: Show list of commands (streaming?)
- [ ] Admin: Edit user

## TBD

- [ ] Add Ratatouille (user list, live update)
- [ ] Add GraphQL (mutation, query)
- [ ] Add GraphQL Subscription
- [ ] Add CLI tied to GraphQL (in Ruby)
- [ ] Add GraphQL Client to BmxWeb (with Subscription)

- [ ] Use UUID as element ids

- [ ] Sys, Users, Offers, Contracts, etc.
- [ ] Admin UI
- [ ] Full GraphQL (binary options)

- [ ] Web / Admin
- [ ] Web / GraphQL
- [ ] Web / Monitor
- [ ] Web / BaseUI

- [ ] VIM: ALE to COC.vim (NeoVim 0.4) 
- [ ] VIM/COC: https://kassioborges.dev/2019/03/21/elixir-ls-on-coc.nvim.html

- [ ] CLI / Admin Dashboard (Ratatouille)

- [ ] DemoApp / Email and SMS

- [ ] Bmx01 / Base Trading - Binary Options
- [ ] Bmx01 / Launch Live System with Payments and GitHub integration

- [ ] Security / Code Signing
- [ ] Security / Exchange Subscriptions & Trading Fees

- [ ] Admin / Identification
- [ ] Admin / Permissions

- [ ] PayPro / Pluggable Processors

- [ ] IORA / Pluggable Oracles

- [ ] DevOps / Distillery support for Ecto
- [ ] DevOps / Docker/bmx01 support for Ecto (docker-compose)
- [ ] DevOps / Docker/bmx_marcom to bma.bugmark.techb
- [ ] DevOps / Edeliver to a local VM cluster (hot updates with second clock)
- [ ] DevOps / Hot Upgrades

- [ ] Composite Instruments / Prototype Contract DSL

- [ ] Event Sourcing / COMMANDED
