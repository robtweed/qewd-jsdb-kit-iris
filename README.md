# QEWD & QEWD-JSdb Explorer Kit for the IRIS Community Edition Docker Container
 
Rob Tweed <rtweed@mgateway.com>  
19 January 2021, M/Gateway Developments Ltd [http://www.mgateway.com](http://www.mgateway.com)  

Twitter: @rtweed

Google Group for discussions, support, advice etc: [http://groups.google.co.uk/group/enterprise-web-developer-community](http://groups.google.co.uk/group/enterprise-web-developer-community)


# About this Repository

This repository provides a kit for installing, configuring and running
QEWD and the QEWD-JSdb Explorer Applications on the IRIS Community Edition
Docker Container.

Once installed, you can explore the Multi-Model Database capabilities of
QEWD-JSdb.  In particular, you'll be able to see and manipulate:

- persistent JavaScript Objects
- document database
- Redis-like Lists
- Redis-like Key/Object storage
- persistent XML Dom / Native XML Database with built-in XPath Query Support

all implemented in Node.js/JavaScript and abstracted onto IRIS Global storage.

If you want to find out more about the concepts and thinking behind QEWD-JSdb,
[watch this video of a presentation](https://www.youtube.com/watch?v=1TlAKTw167s&list=PLam_80-FY3vSPW9apMaczTN_4dtke9GYM)
 I gave to the London Node.js User Group
in January 2020.


# Installation and Configuration

It only takes minutes and a few simple, largely-automated
steps to get QEWD and the QEWD-JSdb Exploration kit installed and working
on the IRIS Community Editition Docker Container.

Read and follow the [Installation and Configuration Instructions here](./INSTALL.md).


# An Initial Guide to QEWD-JSdb using the Node.js REPL

Familiarise yourself with the concepts behind QEWD-JSdb by
[taking the initial tutorial](./REPL.md) where you can
interact directly with the QEWD-JSdb abstraction of your IRIS
Global Storage within the Node.js REPL.


# Model-Specific Exploration

Once you're familiar with the basics of QEWD-JSdb, you can begin exploring how
it has been used to create a number of other database models, including:

- Redis-like Lists

  - [Tutorial](./LISTS.md)
  - [Explorer Application](./LISTS-EXPLORER.md)


- Redis-like Key/Object Storage
  - [Tutorial](./KVS.md)
  - [Explorer Application](./KVS-EXPLORER.md)

- Persistent XML DOM / Native XML Database
  - [Tutorial](./DOM.md)
  - [Explorer Application](./DOM-EXPLORER.md)


# License

 Copyright (c) 2019-21 M/Gateway Developments Ltd,                           
 Redhill, Surrey UK.                                                      
 All rights reserved.                                                     
                                                                           
  http://www.mgateway.com                                                  
  Email: rtweed@mgateway.com                                               
                                                                           
                                                                           
  Licensed under the Apache License, Version 2.0 (the "License");          
  you may not use this file except in compliance with the License.         
  You may obtain a copy of the License at                                  
                                                                           
      http://www.apache.org/licenses/LICENSE-2.0                           
                                                                           
  Unless required by applicable law or agreed to in writing, software      
  distributed under the License is distributed on an "AS IS" BASIS,        
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
  See the License for the specific language governing permissions and      
   limitations under the License.  

