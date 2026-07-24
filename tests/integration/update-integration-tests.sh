#!/bin/sh

cd astro-project && bun reun-moon-config
cd ../php-project && ./vendor/bin/reun-moon-config
cd ../ts-project && bun reun-moon-config
