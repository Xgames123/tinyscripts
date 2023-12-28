# Maintainer: ldev <ldev@ldev.eu.org>
pkgver=r29.c61f313
pkgrel=1

pkgname='tinyscripts'
pkgdesc='A bunch of tiny shell scripts. Most are for linux.'
arch=('any')
licence=('MIT')

depends=('bash')
makedepends=('git')
source=(
  'git+https://github.com/Xgames123/tinyscripts'
  )
md5sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
  cd $pkgname
  mkdir -p "$pkgdir/usr/bin"
  for file in $(ls bin) ; do 
    # 755 rwxr-xr-x
    install -Dm 755 "bin/$file" -t "$pkgdir/usr/bin/"
  done
}
