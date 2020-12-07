# Applies the fix from https://github.com/nextcloud/server/pull/24550

set -e

source /usr/local/etc/library.sh # sets NCVER PHPVER RELEASE

[[ -d "/var/www/nextcloud" ]] || {
  echo "Nextcloud doesn't appear to be installed - aborting";
  exit 1;
}

cd "/var/www/nextcloud"

echo "ZGlmZiAtLWdpdCBhL2xpYi9wcml2YXRlL1Nlc3Npb24vQ3J5cHRvU2Vzc2lvbkRhdGEucGhwIGIv
bGliL3ByaXZhdGUvU2Vzc2lvbi9DcnlwdG9TZXNzaW9uRGF0YS5waHAKaW5kZXggZmM3NjkzYjcx
YjIuLjJiNWI1YzdiNWU3IDEwMDY0NAotLS0gYS9saWIvcHJpdmF0ZS9TZXNzaW9uL0NyeXB0b1Nl
c3Npb25EYXRhLnBocAorKysgYi9saWIvcHJpdmF0ZS9TZXNzaW9uL0NyeXB0b1Nlc3Npb25EYXRh
LnBocApAQCAtODcsNiArODcsNyBAQCBwcm90ZWN0ZWQgZnVuY3Rpb24gaW5pdGlhbGl6ZVNlc3Np
b24oKSB7CiAJCQkpOwogCQl9IGNhdGNoIChcRXhjZXB0aW9uICRlKSB7CiAJCQkkdGhpcy0+c2Vz
c2lvblZhbHVlcyA9IFtdOworCQkJJHRoaXMtPnJlZ2VuZXJhdGVJZCh0cnVlLCBmYWxzZSk7CiAJ
CX0KIAl9CiAK" | base64 -d | patch -p1

# docker images only
[[ -f /.docker-image ]] && {
  :
}

# for non docker images
[[ ! -f /.docker-image ]] && {
  :
}

exit 0