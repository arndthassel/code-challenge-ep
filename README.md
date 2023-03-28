# Enpal Flutter interview challenge

This repository contains the challenge for Flutter candidates.

## Setup
The candidate must clone the repository and have a development environment ready:
* Flutter supported IDE (e.g. Android Studio, Visual Studio Code)
* Latest stable version of Flutter installed
* Android or iOS emulator ready to run the provided code

## Description
The challenge consists of a list and detail view of sample items. There are 4 sources to load the list of sample items:
* Small list of items
* Long list of items
* Mock independent network requests
* Mock stream load
For the `network` source, each call represent an independent object retrieval.

## Scope
The basic scope of the challenge is: 
* Fix UI not updating after `network` source has finished loading.
* Fix UI not updating after each item load in `stream` source.
* Fix bad scroll performance in `long` source.
* Change `network` source to load all items in parallel instead of sequentially.
* Fix failing test.

The candidate should also expect to receive other tasks and questions on the go during the live coding session.