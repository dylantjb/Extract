function x
    for file in $argv
        if test -f $file
            switch $file
                case '*.cbt' '*.tar.bz2' '*.tar.gz' '*.tar.xz' '*.tbz2' '*.tgz' '*.txz' '*.tar'
                    tar xvf $file
                case '*.lzma'
                    unlzma $file
                case '*.bz2'
                    bunzip2 $file
                case '*.cbr' '*.rar'
                    unrar x -ad $file
                case '*.gz'
                    gunzip $file
                case '*.cbz' '*.epub' '*.zip'
                    unzip $file
                case '*.z'
                    uncompress $file
                case '*.7z' '*.apk' '*.arj' '*.cab' '*.cb7' '*.chm' '*.deb' '*.dmg' '*.iso' '*.lzh' '*.msi' '*.pkg' '*.rpm' '*.udf' '*.wim' '*.xar'
                    7z x $file
                case '*.xz'
                    unxz $file
                case '*.exe'
                    cabextract $file
                case '*.cpio'
                    cpio -id < $file
                case '*.cba' '*.ace'
                    unace x $file
                case '*.zpaq'
                    zpaq x $file
                case '*.arc'
                    arc e $file
                case '*.cso'
                    ciso 0 $file $file.iso && extract $file.iso && rm -f $file
                case '*'
                    echo "extract: '$file' - unknown archive method"
                    return 1
            end
        else
            echo "'$file' - file does not exist"
            return 1
        end
    end
end
