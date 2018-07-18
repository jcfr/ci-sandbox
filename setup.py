
from setuptools.dist import Distribution
from setuptools import setup

# Force binary distribution - Adapted from espdev/ITKPythonInstaller/setup.py.in
class BinaryDistribution(Distribution):
    def has_ext_modules(self):
        return True

setup(
    name="jcfr_pypi_upload_automation_sandbox",
    version="0.10.0",
    description="this package is used only to test automation of upload to Python Package Index (PyPI)",
    author='jcfr',
    license='Apache 2.0',
    py_modules=['pypi_upload_automation_sandbox'],
    distclass=BinaryDistribution
)
