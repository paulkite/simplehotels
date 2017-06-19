#!/bin/sh -eux

brew update
brew install carthage
carthage update --platform iOS
