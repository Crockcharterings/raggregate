
# This software is unmaintained.

*This software has not been maintained for several years. At one point, it served at least 4 active communities, all running well. They've since shut down or moved on.*

*New maintainers and patches are of course welcome, but this software is preserved here primarily for historical purposes.*

--------
ABOUT RAGGREGATE
--------

raggregate is an open-source news aggregator primarily inspired by reddit. It is very reddit-like in appearance and operation, though it is currently missing many features, including subreddits and a thumbnailer (reddit has a six year head-start :p).

raggregate is written by ex-users of the reddit codebase. reddit has a lot of problems that make it untenable for deployment on small sites, and though management has recently improved, the reddit codebase has spent most of its open-source life neglected by its maintainers.

raggregate intends to be relatively simple to configure and deploy and respond to its users needs organically. One illustration of this design philosophy is that some things that may have been processed as cronjobs in reddit are compared against timestamps in the database and run directly by raggregate to relieve the user of the additional configuration burden.

raggregate is also intended to be a platform for experimentation in social aggregation.

Patches are very welcome. As mentioned above, there are still many features waiting to be written, including several basics like translation files and a significant test suite. We are firmly in "minimum viable product" stage with this release and much polish is required.

The name "raggregate" is a placeholder until someone is willing to donate something better. The authors do not like the name and want to change it.

-------
INSTALLATION AND USAGE
-------

All dependencies should be automatically installed after running "python setup.py develop" from the root directory. This is also required to register and generate the Python egg used to load the initial application. Subsequent changes to the running code usually do not require this step, so it's a one-time environment bootstrap operation.

Use of virtualenv is strongly recommended.

development.ini includes all available options by default; if you don't want search functionality, remove the solr.address line and raggregate will not attempt to connect to the search server. A Solr schema.xml file is included under solr/ for interested parties. If you want Facebook and Twitter integration, please include the relevant credentials (replace 'none' with real values for the corresponding keys in development.ini).

There is currently only one level of moderation, which enables site-wide editing and removal of posts and comments. This privilege must be switched manually in the database by setting is_admin True on the relevant user row(s).

Major requirements:
 * Python >= 2.7
    - may work on 2.6, haven't tested. Will NOT work on < 2.6.
 * Pyramid >= 1.3a1
 * SQLAlchemy 0.7

-------
HOW TO HELP
-------

As above, raggregate needs a lot of work. We believe in the classic mantra "release early, release often". Here are the majorest pending tasks:

  * Make a more complete test suite
  * Provide localization/translation support
  * Deploy real caching
  * Export hotness and controversial parameters to server ini files
  * Implement permission control for anonymous users
  * List registered users in search
  * Conversion to route_url on all generated URLs; many important ones already done, may not work on non-TLD addresses until this is finished.

There are some others and much of this is low-hanging fruit; not very difficult to implement, just needs to get around to being done. Your help, patches, and testing is greatly appreciated.

-------
LICENSE
-------

raggregate is licensed under Apache License 2.0. See the LICENSE file for more details.
