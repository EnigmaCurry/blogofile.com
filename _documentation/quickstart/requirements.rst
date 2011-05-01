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

However, as long as Python 2.6 or above runs on your system it should
work fine.

Python
======

Blogofile is written entirely in `Python`_. Accordingly, you'll need
Python installed on your computer in order to run Blogofile.

Blogofile is mainly developed using Python 3.2, but it is also tested
to work on Python 2.6 and above. To be specific, Python 2.5 or lower
is *not* supported and unless you have a compelling need to run an old
version, *it is recommended that you use Python 3.2 or above.

For Windows and Mac OSX, you can find `Python installers
<http://python.org/download/releases/>`_ on the Python.org. For other
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

* `Download the tarball <http://pypi.python.org/pypi/distribute#downloads>`_.
* tar xfvz distribute-x.x.x.tar.gz
* python3 setup.py install

Python 2.6+
-----------

Blogofile requires `Setuptools`_ to find and install all the necessary
packages that Blogofile depends on.

To install Setuptools:

* `Download setuptools
  <http://pypi.python.org/pypi/setuptools#downloads>`_. Choose the
  appropriate version for your Python version and platform.

If your platform isn't listed, choose the setuptools-X.X.tar.gz and
install manually:

* tar xfvz setuptools-x.x.x.tar.gz
* python2 setup.py install


.. _Python: http://www.python.org

.. _Setuptools: http://pypi.python.org/pypi/setuptools

.. _Distribute: http://pypi.python.org/pypi/distribute
