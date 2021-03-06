#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��4_alios.sh �QMo�@��Wn d�M�*����Yo�V�]˻V�C�@MB�!PE*�B��DK��k��o�;mJTD/�ռ7ｙY�����P�T�����N7�}"�u��/����>���P��Ѩ�������_���!�>I���K�"�c"u���L9�E�Ʋ�r�Jn�E�۞����!���f�Ĝ��r����`���ŧ���{]��	T�h!�ca��4a&fuYo���,�̺l������ R WJS���~�B�9��M�ݱ�f��iZ�J��f�2WL��mZ�N����8
�4	!��gB�A �m#�V��ʾ��ŅV��b����I<i\��{�T���_/.��0g�sX}���c5�ˏ����ҨZT�ѩ<��爱��y��z�sv3�4���=W�����j<}sZy�oo��35|�U6�������b�K�~��`p'  