
import versioneer

from skbuild import setup

setup(
    name="jcfr_pypi_upload_automation_sandbox",
    version=versioneer.get_version(),
    cmdclass=versioneer.get_cmdclass(),
    description="this package is used only to test automation of upload to Python Package Index (PyPI)",
    author='jcfr',
    license='Apache 2.0',
    packages=['pypi_upload_automation_sandbox'],
)
