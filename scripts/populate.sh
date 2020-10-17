#!/bin/bash
WKSP=$(get_workspace.sh)
EMPT=$(workspace_empty.sh $WKSP)

if [ $EMPT -ne 1 ] ; then
	exit 0
fi



case $WKSP in
	

	SLACK) exec google-chrome --new-window "https://app.slack.com/client/T04700HRA/GTZF4586B" ;;
	#MCHAT) exec google-chrome --new-window "https://chat.madwire.net/channel/Madwire" ;;
	ZOOM) exec zoom ;;
	MAIL) exec google-chrome --new-window "https://mail.google.com/mail/u/0/#inbox" ;;
	JIRA) exec google-chrome --new-window "https://madsoftware.atlassian.net/secure/RapidBoard.jspa?rapidView=8&assignee=5ce2a6689435c90fd6f02c63" ;;
	L9) exec anydesk ;;

	NPP) exec notepadqq ;;
	MSQL) exec mysql-workbench ;;
	POST) exec Postman ;;
	CAPT) exec Captain ;;
	MONG) exec robo3t ;;

	PHP1) exec phpstorm.sh ~/.captain/headproxy/order-collector ;;
	PHP2) exec phpstorm.sh ~/.captain/headproxy/crm2 ;;
	PHP3) exec phpstorm.sh ~/.captain/headproxy/crm-api ;;
	PHP4) exec phpstorm.sh ~/MadwireGit/crm-infra ;;
	PHP5) exec phpstorm.sh ~/.captain/headproxy/crm2-job-runner ;;
	PHP6) exec psmad madscripts ;;
	PHP7) exec phpstorm.sh ~/MadwireGit/v3userlib ;;
	
	CH*)
		CHNUM=${WKSP//[!0-9]/}
		if [ $CHNUM -ge 10 ] ; then
			exec google-chrome --new-window --incognito
		else
			exec google-chrome --new-window
		fi
	;;

	F*)
		exec nautilus 
	;;

	T*)
		exec xterm 
	;;


esac
