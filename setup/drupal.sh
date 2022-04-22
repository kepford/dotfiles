#!/bin/bash
# PHP CodeSniffer
# https://www.drupal.org/node/1419988
composer global require drupal/coder
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

