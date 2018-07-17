import os
import sys

from .core import logger
from .core import config



def run():
    pass


if __name__ == '__main__':
    logger.start('INFO', stream=sys.stdout)
    project_path = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
    config_path = os.path.join(os.path.abspath(project_path), 'etc', 'config.yml')
    config.load(config_path)
    run()
