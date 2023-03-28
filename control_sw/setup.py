from distutils.core import setup
import glob
import os

try:
    import subprocess
    git_desc = subprocess.check_output(['git', 'describe', '--abbrev=8', '--always', '--dirty', '--tags']).decode().strip()
    print('Git describe returns: %s' % git_desc)
    assert git_desc.startswith('v'), 'Repo should be tagged with a version vX.Y.Z'
    assert not '-' in git_desc, 'Repo can only be installed from a tagged commit'
    ver = git_desc.lstrip('v')
    ver_fields = ver.split('.')
    assert len(ver_fields) <= 3, 'Version has too many fields. Only vX.Y.Z is allowed'
    try:
        map(int, ver_fields)
    except:
        print('Couldn\'t turn fields of %s into integers' % ver)
        raise
except:
    print('Couldn\'t get version from git')
    raise

print('Version is %s' % ver)

# Generate a __version__.py file with this version in it
here = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(here, 'src', '__version__.py'), 'w') as fh:
    fh.write('__version__ = "%s"' % ver)

setup(name='lwa_f',
      version='%s' % ver,
      description='Python libraries and scripts to control the HERA correlator F-Engines',
      author='Jack Hickish',
      author_email='jack@realtimeradio.co.uk',
      url='https://github.com/realtimeradio/caltech-lwa',
      provides=['lwa_f'],
      packages=['lwa_f', 'lwa_f.blocks'],
      package_dir={'lwa_f' : 'src'},
      scripts=glob.glob('scripts/*.py'),
      )

if ver.endswith("dirty"):
    print("***************************************************")
    print("* You are installing from a dirty git repository. *")
    print("*          One day you will regret this.          *")
    print("*                                                 *")
    print("*      Consider cleaning up and reinstalling.     *")
    print("***************************************************")
