#!/bin/bash

# formatting

header_colour='\e[1;36m'
end_colour='\e[0m'

# intro

intro_logo_line_1_1=" "
intro_logo_line_1_2="_"
intro_logo_line_1_3="    "
intro_logo_line_1_4="_"
intro_logo_line_1_5="                 "
intro_logo_line_1_6="_"
intro_logo_line_2="| |  [_] _ _  ___  _ _ [_] _ _" 
intro_logo_line_3="| |_ | || ' |/ . || | || || ' |"
intro_logo_line_4="|___||_||_|_|\_  | \__||_||_|_|"
intro_logo_line_5_1="               "
intro_logo_line_5_2="|_|"
intro_description="Linux quick-wins enumeration for privilege escalation\n"

echo -e "\n\n$intro_logo_line_1_1$intro_logo_line_1_2$intro_logo_line_1_3$intro_logo_line_1_4$intro_logo_line_1_5$intro_logo_line_1_6"
echo -e "$intro_logo_line_2\n$intro_logo_line_3\n$intro_logo_line_4\n$intro_logo_line_5_1$intro_logo_line_5_2\n"
echo -e "$intro_description\n\n"

# Check host information
echo -e $header_colour"Host"$end_colour
uname -a
echo -e "\n"

# Current user
echo -e $header_colour"User"$end_colour
whoami
id
echo -e "\n"

# Shell users
echo -e $header_colour"Shell users"$end_colour
grep "/bin/bash\|/bin/zsh\|/bin/sh" /etc/passwd
echo -e "\n"

# SUID
echo -e $header_colour"SUID"$end_colour
find / -type f -perm -04000 -ls 2>/dev/null
echo -e "\n"

# Cron jobs
echo -e $header_colour"Cron jobs"$end_colour
cat /etc/crontab 2>/dev/null
echo -e "\n"

# PATH
echo -e $header_colour"\$PATH"$end_colour
echo $PATH
echo -e "\n"

# Capabilities
echo -e $header_colour"Capabilities"$end_colour
getcap -r / 2>/dev/null
echo -e "\n"

