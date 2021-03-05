from django.core.files.storage import FileSystemStorage
from django.core.files.storage import default_storage
from fdfs_client.client import *
from django.conf import settings
import hashlib
from django.utils.functional import cached_property


def _random_filename(rawfilename):
    random_filename = str(time.time()) + rawfilename
    filename = hashlib.md5(random_filename.encode('utf-8')).hexdigest()
    subffix = os.path.splitext(rawfilename)[-1]
    return filename + subffix


class FDFSStorage(FileSystemStorage):
    """文件存储"""

    def _open(self, name, mode='rb'):
        pass

    @cached_property
    def location(self):
        return os.path.join(os.path.abspath(self.base_location), "static")

    def _save(self, name, content):
        res = super(FDFSStorage,self)._save(name, content)
        return res

    def url(self, name):
        return "/static/" + name



