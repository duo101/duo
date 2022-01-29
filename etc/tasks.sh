clear
date +'%M : %S' | figlet
echo ""
lua duo.lua -task . | gawk '
BEGIN   { fails=0 }
/FAIL/  { ++fails }
        { sub(/^PASS/,"\033[1;32mPASS \033[0m")
          sub(/^FAIL/,"\033[1;31mFAIL \033[0m")
          print }
END     { print("\n==> \033[1;33m"fails"\033[0m failures")
          exit(fails) }'