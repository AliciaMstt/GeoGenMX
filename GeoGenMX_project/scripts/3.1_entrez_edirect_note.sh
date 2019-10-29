
#Important note, I've had problems using the xtract command from Entrez NCBI

#The following error would appear:
#Unable to locate xtract executable. Please execute the following

 # ftp-cp ftp.ncbi.nlm.nih.gov /entrez/entrezdirect xtract.Linux.gz
#  gunzip -f xtract.Linux.gz
 # chmod +x xtract.Linux
#Next I would restore the value of the environment variable $PATH: 


PATH=$(getconf PATH)

#Then I would rerun the installation instructions for NCBI :

  cd ~
  /bin/bash
  perl -MNet::FTP -e \
    '$ftp = new Net::FTP("ftp.ncbi.nlm.nih.gov", Passive => 1);
     $ftp->login; $ftp->binary;
     $ftp->get("/entrez/entrezdirect/edirect.tar.gz");'
  gunzip -c edirect.tar.gz | tar xf -
  rm edirect.tar.gz
  builtin exit
  export PATH=${PATH}:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"
  ./edirect/setup.sh

#This would solve the problem however only in the current environment, meaning that whenever I opened a new terminal the value of PATH was #different again and then I had to repeat all the previous steps to run the Entrez xtract instruction. I am thinking I have to modify my PATH #variable permanently in my bash configuration but I didnt do it, because I dont wanna break anything else. 
