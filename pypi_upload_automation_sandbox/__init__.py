"""This package is used only to test automation of upload to Python Package Index (PyPI)
"""

def what():
    return __doc__.strip()


from ._version import get_versions
__version__ = get_versions()['version']
del get_versions
