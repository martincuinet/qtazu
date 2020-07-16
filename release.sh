release_number=0.1.0
twine --help || exit 1
echo "__version__ = \"$release_number\"" > qtazu/__version__.py
git add qtazu/__version__.py 
git commit qtazu/__version__.py -m $release_number
git pull --rebase origin master
git tag v$release_number
git push origin master --tag
python setup.py bdist_wheel --universal
twine upload dist/qtazu-$release_number-py2.py3-none-any.whl
