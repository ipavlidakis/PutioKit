# PutioKit

A simple wrapper around put.io api. PutioKit wraps all available endpoints and provides an easy and typesafe way to interact with it.

# Architecture

The kit is splitting the available endpoints from the API into seperate services: Currently you can find the following available services:

* Account
* Authentication
* Config
* Events
* Files
* Friends
* RSS
* Shares
* Transfers
* Zip

Each services requires 3 things:
1. An instance of the `ApiClientModel`
2. An instance conforming to the `NetworkHandling` protocol
3. An instance confroming to the `CredentialsStoring` protocol

## ApiClientModel

The `ApiClientModel` struct represents your put.io application. It contains values like:
* id
* secret
* name
The `ApiClientModel` is used to fill in the required information to communicate with the API.

## NetworkHandling

The instance that will passed to the services will be used to perform all the network operations. The object is responsible to provide - additionally to the task execution role - a jsonDecoder responsible to parse the data received from the API but also a `decode` method that is used to seperate the different types of available results that may happen per request (e.g on a response for a File object the response may error. In that case the result is an `ErrorModel`. The decode method in `URLSession` is already hanlind those cases for you, so it can always return a meaningful result) 

> For ease of use, `URLSession` conforms to `NetworkHandling`

## CredentialsStoring

The instance that will passed to the service will be used to as a provider for the access token, required to communicate with the API

# Next Steps
- [ ] Write documentation
- [ ] Provide a playground app
- [ ] Setup actions on the repo
- [ ] Write unit tests
- [ ] Implement retry logic on failures
- [ ] Add progress on uploadTasks
- [ ] Add progress on dataTasks

# Author

Ilias Pavlidakis
- [mail](ipavlidakis@gmail.com)
- twitter](https://twitter.com/3liaspav)

# License

PutioKit is released under the MIT license. See LICENSE for details.
