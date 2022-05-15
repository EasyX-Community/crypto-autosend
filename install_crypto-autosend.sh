#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}

# Autofilled Variables (do not change)
export vPWD=$(pwd)
export vPATH=$(echo $PATH)
export vVER=$(cat bin/.crypto-autosend.version)

# Clear variables
export vHOST=""
export vPORT=""
export vUSER=""
export vPASS=""
export vWALLETPASS=""
export vTOADDR=""
export vMINXFER=""
export vCOMMENT=""

if [ -f "bin/.crypto-autosend.config" ] ; then

  source bin/.crypto-autosend.config

  echo ""
  echo "crypto-autosend ${vVER}"
  echo ""
  echo "rpc host                [$vHOST]"
  echo "rpc port                [$vPORT]"
  echo "rpc user                [$vUSER]"
  echo ""
  echo "to addr                 [$vTOADDR]"
  echo "min xfer                [$vMINXFER]"
  echo "comment                 [$vCOMMENT]"
  echo ""

else

  echo "apt updating..."
  apt update
  echo ""

  vDIALOG=$(dpkg-query -l dialog)
  if [[ "no packages found matching" == *"${vDIALOG}"* ]]; then
    echo "installing dialog"
    echo ""
    apt install -y dialog
    echo ""
  fi

  vCONTINUEVAR=1
  while [ "$vCONTINUEVAR" == "1" ]
  do

    while [ "$vHOST" == "" ]
    do
      vHOST=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "RPC IP: " 8 60)
    done

    while [ "$vPORT" == "" ]
    do
      vPORT=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "RPC Port: " 8 60)
    done

    while [ "$vUSER" == "" ]
    do
      vUSER=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "RPC User: " 8 60)
    done

    while [ "$vPASS" == "" ]
    do
      vPASS=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "RPC Password: " 8 60)
    done

    while [ "$vWALLETPASS" == "" ]
    do
      vWALLETPASS=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "Wallet Password: " 8 60)
    done

    while [ "$vTOADDR" == "" ]
    do
      vTOADDR=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "To Address: " 8 60)
    done

    while [ "$vMINXFER" == "" ]
    do
      vMINXFER=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "Minimum amount to transfer: " 8 60)
    done

    while [ "$vCOMMENT" == "" ]
    do
      vCOMMENT=$(dialog --stdout --title "Configuration" \
        --backtitle "crypto-autosend ${vVER} setup" \
        --inputbox "Transaction Comment: " 8 60)
    done

    dialog --stdout --title "Configuration" \
      --backtitle "crypto-autosend ${vVER} setup" \
      --yesno "Should I install cronjob to run every 5 min?" 10 60 \
    3>&1 1>&2 2>&3 3>&-
    vCRONJOB=$?

    dialog --stdout --title "Configuration" \
      --backtitle "crypto-autosend ${vVER} setup" \
      --yesno "Should I install cronjob to update crypto-autosend weekly?" 10 60 \
    3>&1 1>&2 2>&3 3>&-
    vCRONJOBUPDATE=$?

    if [ $vCRONJOB -eq 0 ] ; then
      vCRONJOBENG="yes"
    else
      vCRONJOBENG="no"
    fi

    if [ $vCRONJOBUPDATE -eq 0 ] ; then
      vCRONJOBUPDATEENG="yes"
    else
      vCRONJOBUPDATEENG="no"
    fi

    dialog --stdout --title "Configuration" \
      --backtitle "crypto-autosend ${vVER} setup" \
      --yesno "Is this information correct?\n\nRPC IP: ${vHOST}\RPC Port: ${vPORT}\nRPC User: ${vUSER}\nRPC Password: ${vPASS}\nWallet Password: ${vWALLETPASS}\nSend To Address: ${vTOADDR}\nMinimum transfer amount: ${vMINXFER}\nComment: ${vCOMMENT}\n\nInstall Cronjob: ${vCRONJOBENG}\nInstall Update Cronjob: ${vCRONJOBUPDATEENG}"17 60 \
    3>&1 1>&2 2>&3 3>&-
    vCONTINUEVAR=$?

  done

  echo "" | tee bin/.crypto-autosend.config > /dev/null 2>&1
  echo "#!/usr/bin/env bash" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "#" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "## coind RPC Connection Info" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "#" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Coind settings" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vHOST=\"${vHOST}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vPORT=\"${vPORT}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vUSER=\"${vUSER}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vPASS=\"${vPASS}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Wallet password to unlock wallet (leave blank for none)" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vWALLETPASS=\"${vWALLETPASS}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "#" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "## General Settings" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "#" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Address to send RTM's to" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vTOADDR=\"${vTOADDR}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Minimum RTM to send" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vMINXFER=\"${vMINXFER}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Comment to add" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vCOMMENT=\"${vCOMMENT}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "# Location of this repository" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "export vREPODIR=\"${vPWD}\"" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1
  echo "" | tee -a bin/.crypto-autosend.config > /dev/null 2>&1

fi

source bin/.crypto-autosend.config

# CHMOD the crypto-autosend scripts
chmod +x bin/crypto-autosend*

# Check if vPWD/bin is added to $PATH
if [[ "${vPATH}" == *"${vPWD}/bin"* ]]; then
  echo "crypto-autosend directory already in path [${vPATH}]"
  echo ""
else
  echo "Adding crypto-autosend directory to \$PATH"
  echo "export PATH=${vPWD}/bin:\$PATH" | tee -a ${HOME}/.bashrc
  echo ""
fi

# ADD CRYPTO-AUTOSEND CRONJOB
if [[ $vCRONJOB -eq 0 ]] ; then
  vCRONJOBENG="yes"
  vCRONENTRIES=$(crontab -l)
  if [[ "$vCRONENTRIES" != *"${vPWD}/bin/crypto-autosend ;"* ]] ; then
    echo "installing crypto-autosend cronjob"
    echo -e "$(crontab -l)\n\n# crypto-autosend cronjob" | crontab -
    echo -e "$(crontab -l)\n0 * * * * ${vPWD}/bin/crypto-autosend ;" | crontab -
  else
    echo "refusing to install crypto-autosend cron, cron already exists!"
  fi
else
  vCRONJOBENG="no"
  echo "skipping crypto-autosend cronjob install"
fi

# ADD CRYPTO-AUTOSEND-UPDATE CRONJOB
if [[ $vCRONJOBUPDATE -eq 0 ]] ; then
  vCRONJOBUPDATEENG="yes"
  vCRONENTRIES=$(crontab -l)
  if [[ "$vCRONENTRIES" != *"@weekly ${vPWD}/bin/crypto-autosend-update ;"* ]] ; then
    echo "installing crypto-autosend-update cronjob"
    echo -e "$(crontab -l)\n\n# crypto-autosend-update cronjob" | crontab -
    echo -e "$(crontab -l)\n@weekly ${vPWD}/bin/crypto-autosend-update ;" | crontab -
  else
    echo "refusing to install crypto-autosend-update cron, cron already exists!"
  fi
else
  vCRONJOBUPDATEENG="no"
  echo "skipping crypto-autosend-update cronjob install"
fi

echo ""
echo "Please execute 'source ${HOME}/.bashrc' or log out and back in again"
echo ""
echo "crypto-autosend installation is complete!"
echo ""

# Clear ENV vars for security
source bin/.crypto-autosend.config.clear
