# 起動時の速度を調べるときにつかうやつ
# zmodload zsh/zprof && zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
