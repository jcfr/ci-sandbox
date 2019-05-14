
import sys

import versioneer

from setuptools.dist import Distribution
from setuptools import setup

# Force binary distribution - Adapted from espdev/ITKPythonInstaller/setup.py.in
class BinaryDistribution(Distribution):
    def has_ext_modules(self):
        return True

with open('requirements-dev.txt', 'r') as fp:
    dev_requirements = list(filter(bool, (line.strip() for line in fp)))

# Require pytest-runner only when running tests
pytest_runner = (['pytest-runner>=2.9']
                 if any(arg in sys.argv for arg in ('pytest', 'test'))
                 else [])

setup_requires = pytest_runner

setup(
    name="jcfr_pypi_upload_automation_sandbox",
    version=versioneer.get_version(),
    cmdclass=versioneer.get_cmdclass(),
    description="this package is used only to test automation of upload to Python Package Index (PyPI)",
    author='jcfr',
    license='Apache 2.0',
    packages=['pypi_upload_automation_sandbox'],
    distclass=BinaryDistribution,
    tests_require=dev_requirements,
    setup_requires=setup_requires
)
