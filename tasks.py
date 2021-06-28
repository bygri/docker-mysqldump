import os
from invoke import task


DOCKER_REPO = 'tobygriffin/mysqldump'


@task
def docker_build(c):
  if len(c.run('git status --porcelain').stdout):
    print('There are uncommitted changes in the working directory.')
    return
  tag_name = c.run('git rev-parse --short HEAD').stdout[:-1]
  image_name = DOCKER_REPO + ':' + tag_name
  c.run(
    'docker buildx build --platform "linux/amd64,linux/arm64" '
    '--push -t {} .'.format(image_name))
