System Requirements
*******************

You'll need the following to run Blogofile:

* `Python`_ 2.6, 2.7, 3.1 or 3.2.
* `Distribute`_ (if running python 3.x) or `Setuptools`_ (if running
  python 2.x)


Platforms
=========

Blogofile has been tested to run on a variety of platforms including:

* Linux
* Windows
* Mac OSX

If you're using something else, as long as Python 2.6 or above runs on
your system it should work fine.

Python
======

Blogofile is written entirely in `Python`_. Accordingly, you'll need
Python installed on your computer in order to run Blogofile.

Blogofile is mainly developed using Python 3.2, but it is also tested
to work on Python 2.6 and above. To be specific, Python 2.5 or lower
is *not* supported and unless you have a compelling need to run an old
version, it is recommended that you upgrade to at least Python 3.1.

For Windows and Mac OSX, you can find `Python installers
<http://python.org/download/releases/>`_ at Python.org. For other
Operating Systems, a suitable Python version is likely already
installed and your package manager (synaptic, apt-get, yum, ports,
emerge etc.) has probably also provided a distribution for various
other versions. Consult your OS documentation.

Python Libraries
================

Python 3.x
-----------

Blogofile uses `Distribute`_ to find and install all the necessary
packages that Blogofile depends on.

To install Distribute:

* Download the setup file : `distribute_setup.py <http://python-distribute.org/distribute_setup.py>`_.
* Run: ``python3 distribute_setup.py``

Or as a one-liner for Linux systems:

* ``sudo su -c "wget http://python-distribute.org/distribute_setup.py -O - | python3"``

Python 2.6+
-----------

Blogofile requires `Setuptools`_ to find and install all the necessary
packages that Blogofile depends on.

To install Setuptools:

* Download the setup file : `ez_setup.py <http://peak.telecommunity.com/dist/ez_setup.py>`_.
* Run: ``python ez_setup.py``

Or as a one-liner for Linux systems:

* ``sudo su -c "wget http://peak.telecommunity.com/dist/ez_setup.py -O - | python"``

.. _Python: http://www.python.org

.. _Setuptools: http://pypi.python.org/pypi/setuptools

.. _Distribute: http://pypi.python.org/pypi/distribute


Optional Libraries
==================

This is a list of additional libraries you may wish to install, but
are not required:

* `Sphinx <http://sphinx.pocoo.org/>`_ - This library is used to
  generate the documentation for blogofile from the `blogofile.com
  sources <http://github.com/EnigmaCurry/blogofile.com>`_

* `lxml <http://lxml.de/installation.html>`_ - This is the very best
  XML processing library available for Python. It's used in Blogofile
  for post excerpts (which are not turned on by
  default). Unfortunately, it is a C library and so it's a bit more
  difficult to install than regular python packages, so it is not
  normally installed with Blogofile.
