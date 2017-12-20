=====
Usage
=====

.. note::

   All commands in the documentation refer to the installation according to the official
   `Docker installation guide <https://docs.docker.com/engine/installation/>`_.

   If you installed Docker via the package manager of your Operating System you may have to adjust the commands.

   Meaning if you installed Docker on Ubuntu from the Ubuntu repositories the syntax would be ``docker.io`` in place of ``docker``.


Download Image
==============

Pull (download) *ttd-sphinx*:

.. code-block:: shell

   docker pull testthedocs/ttd-sphinx

Update Image
============

Check and update application image to a newer version:

.. code-block:: shell

   docker pull testthedocs/ttd-sphinx

Building HTML
=============

*ttd-sphinx* is designed to build HTML out of ``rst`` files in your current working directory (```$PWD```).

The build output will be saved in a directory called ``_build`` in your ```$PWD```.

Example
-------

Change into your documentation directory (/docs) of your project:

.. code-block:: shell

   cd docs

Do a :command:`ls` to see all the files here:

.. code-block:: shell

   index.rst

Run *ttd-sphinx*:

.. code-block:: shell

   docker run -v `pwd`:/build/docs testthedocs/ttd-sphinx html

After the build is finished, check the content of the directory with :command:`ls` again:

.. code-block:: shell

   index.rst    _build


Debug Mode
==========

Run plone-docsbuilder in ``debug mode``.

.. code-block:: console

   $ docker run -v `pwd`:/build/docs testthedocs/ttd-sphinx debug
   rm -rf docs/_build/*
   sphinx-build -c _config -n -b html -d docs/_build/doctrees   docs docs/_build/debug
   Running Sphinx v1.6.3
   making output directory...
   loading pickled environment... not yet created
   building [mo]: targets for 0 po files that are out of date
   building [html]: targets for 1 source files that are out of date
   updating environment: 1 added, 0 changed, 0 removed
   reading sources... [100%] index

   looking for now-outdated files... WARNING: /build/docs/index.rst:1: (SEVERE/4) Title overline & underline mismatch.

   =====
   Index
   ===
   none found
   pickling environment... done
   checking consistency... done
   preparing documents... done
   writing output... [100%] index

   generating indices... genindex
   writing additional pages... search
   copying static files... done
   copying extra files... done
   dumping search index in English (code: en) ... done
   dumping object inventory... done
   build succeeded, 1 warning.

   Debug build finished. The HTML pages are in _build/debug

*ttd-sphinx* will warn about all references where the target cannot be found.


Serve Mode
==========

Serve the documentation and rebuild when a change is detected.

.. warning::

   This uses *--network="host"* which gives the container full access to local system services
   such as D-bus and is therefore considered **insecure !**

   **Be sure that you know what you are doing !**

.. note::

   This feature is *experimental* and only tested on Linux.

   Consider it **early alpha**

.. code-block:: shell

   docker run -it --net=host -v `pwd`:/build/docs testthedocs/ttd-sphinx serve

Point your browser to  http://127.0.0.1:8000.

Each time a change to the documentation source is detected, the HTML is rebuilt and the browser automatically reloaded.

To stop the server press :command:`Ctrl C`.
