<img src="https://www.0crat.com/svg/logo.svg" width="64px" height="64px"/>

[![EO principles respected here](http://www.elegantobjects.org/badge.svg)](http://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/C3NDPUA8L.svg)](https://www.0crat.com/p/C3NDPUA8L)
[![DevOps By Rultor.com](http://www.rultor.com/b/zerocracy/datum)](http://www.rultor.com/p/zerocracy/datum)
[![We recommend RubyMine](http://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Stability of Webhook](http://www.rehttp.net/b?u=http%3A%2F%2Fwww.0crat.com%2Fghook)](http://www.rehttp.net/i?u=http%3A%2F%2Fwww.0crat.com%2Fghook)
[![Availability at SixNines](http://www.sixnines.io/b/2b3a)](http://www.sixnines.io/h/2b3a)
[![Build Status](https://travis-ci.org/zerocracy/datum.svg?branch=master)](https://travis-ci.org/zerocracy/datum)

Information about current project status is kept in XML and text
files. This repository contains full list of XSD Schemas for them
and rules of usage.

Read [our policy](http://www.zerocracy.com/policy.html),
it covers all processes in these XML files.

Any problems you have with [Zerocracy](http://www.zerocracy.com)
please report [here](https://github.com/zerocracy/farm/issues).
We promise to do our best to resolve them as soon as possible.

## Data model

A project has a list of members, with assigned roles to them. Each project
member, also known as **user** is identified by his GitHub name, for example
[yegor256](https://github.com/yegor256).

There is only one piece of work, which is called a **job**. A job
can either be in scope or not. If the job is in scope, it is listed
in the `wbs.xml`.

A job, which is in scope, may have an **order** assigned to it, as a record in `orders.xml`.
An order has a **performer**. An order may be finished (success) or terminated (failure).

A job, which is in scope, may have an **election** in `elections.xml`,
which is created by Zerocrat automatically. The election is used as a basis
for the decision making of an order assignment.

An order may have an **impediment**, which is listed in `impediments.xml`. While
the impediment exists, the order won't be terminated
[by delay](http://www.zerocracy.com/policy.html#8).

## How to contribute?

We keep XSD Schema files in the [`xsd`](https://github.com/zerocracy/datum/tree/master/xsd)
directory. You can modify them as you wish. However, keep in mind that you
need 1) to test them, 2) make sure existing XML files in the projects will
be upgraded to your changes, and 3) modify XSL views.

First, in order to test an `.xsd` file you should create `.xml` files
in the [`xml`](https://github.com/zerocracy/datum/tree/master/xml) directory.
You can make as many of them them there as you need. All of them will be
tested against the XSD Schema. If the name of the `.xml` file starts with
a dash, it is expected that the validation against the XSD Schema will fail.
If it won't fail, the build will break.

Second, every time you introduce some changes to the `.xsd` file, make sure
you add an XSL Transformation to the
[`upgrades`](https://github.com/zerocracy/datum/tree/master/upgrades) directory.
Each `.xsl` file must be named as `XXX-name.xsl`, where `XXX` is the version
number it upgrades an `.xml` file to. All versions are
[here](https://github.com/zerocracy/datum/releases) (we're using
[semantic versioninig](http://semver.org/)).

Third, don't forget to add or modify XSL views in
[`upgrades`](https://github.com/zerocracy/datum/tree/master/xsl) directory.

After all changes are made, don't forget to run
[`rake`](https://github.com/ruby/rake).
You will need Ruby 2.2+ installed.

## License

Copyright (c) 2016-2018 Zerocracy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to read
the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
