==========
Plone-Lint
==========

*Plone-Lint* is a custom setup for the `Documentation Repository <https://github.com/plone/documentation>`_ of `Plone <https://plone.org/>`_.

Configuration
=============

Adjust the configuration file [.ttd-lintrc] to check against certain words.

.. code-block:: shell

   cat .ttd-lintrc
    Github
    Javascript

With these settings *Plone-Lint* will check the whole docs, if it detects one or more matches it will report these and will stop with an ``exit 1``
code.

Per, default *Plone-Lint* excludes its own configuration file ``.ttd-lintrc`` and the docs about *word choice* from testing.

This is for now hard-coded it may change in the future.

Usage
=====

To run the tests against the docs, you need to mount the documentation directory to ``/srv/docs`` and the configuration file to
``/srv/.ttd-lintrc`` of the docker container.

.. code-block:: shell

    docker run --rm -v "${PWD}":/srv/docs:rw -v $(pwd)/.ttd-lintrc:/srv/.ttd-lintrc -u "$(id -u)":"$(id -g)" testthedocs/plone-lint

This will mount your **working directory** into */srv/docs* and the configuration into ``/srv/docs`` of the container.

These paths are hard-coded in the Dockerfile.

.. note::

   The above example expects that you are in the **root directory** of the documentation, which is */documentation*.
