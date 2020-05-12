##!/usr/bin/env bash

#' filename : install-TinyTeX_hithesis.sh
#' Date : 2020-05-11
#' contributor : Yanshuo Chu
#' function: minimum install of TeX package for hithesis

wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh
tlmgr update --self --all
tlmgr path add
fmtutil-sys --all

tlmgr install tex-gyre ctex splitindex ntheorem newtx fontaxes psnfss pdfpages \
    enumitem environ trimspaces footmisc varwidth changepage placeins multirow \
    subfigure ccaption splitindex xltxtra realscripts siunitx jknapltx algorithm2e \
    ifoddpage relsize listings glossaries mfirstuc textcase xfor datatool tracklang \
    pdflscape rsfs txfonts xecjk newpx fancyhdr hyphen-german

realpath $HOME/.TinyTeX/bin/x86_64-linux/* | xargs -n 1 ln -s -f
export PATH="$HOME/bin:$PATH";


if [ ! -d $HOME/.fonts ]; then
    mkdir $HOME/.fonts;
fi

wget https://github.com/StellarCN/scp_zh/raw/master/fonts/SimSun.ttf -O $HOME/.fonts/SimSun.ttf
wget https://github.com/StellarCN/scp_zh/raw/master/fonts/SimHei.ttf -O $HOME/.fonts/SimHei.ttf
wget https://github.com/Halfish/lstm-ctc-ocr/raw/master/fonts/simkai.ttf -O $HOME/.fonts/simkai.ttf
wget https://github.com/Halfish/lstm-ctc-ocr/raw/master/fonts/simfang.ttf -O $HOME/.fonts/simfang.ttf
wget https://github.com/dangxinchudian/interfacedbcms/raw/master/tcpdf/msyh.ttf -O $HOME/.fonts/msyh.ttf
wget https://github.com/owent-utils/font/raw/master/%E5%BE%AE%E8%BD%AF%E9%9B%85%E9%BB%91/MSYH.TTC -O $HOME/.fonts/msyh.ttc
wget https://github.com/owent-utils/font/raw/master/%E5%BE%AE%E8%BD%AF%E9%9B%85%E9%BB%91/MSYHBD.TTC -O $HOME/.fonts/msyhbd.ttc
wget https://github.com/junmer/source-han-serif-ttf/raw/master/SubsetTTF/CN/SourceHanSerifCN-Regular.ttf -O $HOME/.fonts/SourceHanSerifCN-Regular.ttf

fc-cache -f $HOME/.fonts/