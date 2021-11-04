# SUAP-EaD Django Theme

```
pip install suap_ead
```

Em ```settings.py```:

Adicione a aplicação,```suap_ead```, à variável de configuração ```INSTALLED_APPS``` antes das aplicações do django:

```
INSTALLED_APPS = 'suap_ead',
                 'django.contrib.admin',
                 'django.contrib.auth',
                 ......................
```
  
Certifique-se de que está setada a variável ```STATIC_URL = '/static/'```.

# suap_ead
suap_ead

## How to install 
```sh
pip install suap_ead
```

## How to build
```sh
git clone git@github.com:suap-ead/lib_suap_ead.git
cd suap_ead
# local build only
./release.sh -l 1.3
# local build, send to Github, publish to PyPI
./release.sh -a 1.3
```

# MIT License

Copyright (c) 2018 IFRN - Campus EaD

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
