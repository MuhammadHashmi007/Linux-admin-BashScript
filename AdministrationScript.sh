
choice="y"

function_MenuDisplay()
{
	echo " -------------------------"
	echo          "MAIN MENU"
	echo "--------------------------"
	echo "Select any option between (1-15)"
	echo " "
	echo "1)Operating system info"
	echo "2)Hostname  info"
	echo "3)Network info"
	echo "4)who is online"
	echo "5)Last logged in users"
	echo "6)disk usage"
	echo "7)Directory Size"
	echo "8)Process usage and total processes"
	echo "9)timezone"
	echo "10)RUnlevels"
	echo "11)Ports"
	echo "12)User Operations"
	echo "13)FIle operations"
	echo "14)Services"
	echo "15)Exit"
	echo ""
	echo "Select Option ( 1 to 14)"
	read opt
	case $opt in

	1) function_OperSysInfo
		break;;
	2) function_host
		break;;
	3) function_NetInfo
		break;;
	4) function_whoisOnline
		break;;
	5) function_lastlogged
		break;;
	6) function_diskusage
		break;;
	7) function_DirFFS
		break;;
	8) function_processes
		break;;
	9) function_timezone
		break;;
	10) function_Runlevels
		break;;
	11) function_CheckPorts
		break;;
	12) fucntion_UserOper
		break;;
	13) function_fileOper
		break;;
	14) function_Services
		break;;
	15) function_exit
		break;;
	esac
	echo " "
	echo " "
	echo " do you want to continue"
	read choice
	if [ $choice != "y" ]
             then
		     function_MenuDisplay
	else
	      exit
	fi



	
}

function_OperSysInfo()
{

	echo "OPerating system info are as follow"
	echo""
        
	sysname=$( uname )
        echo "System name of this machine is ==> $sysname"

	NetHost=$( uname -n )
	echo "System network name is ==> $NetHost"

	kernalVer=$( uname -v )
	echo "system kernal inofrmation is ==>$kernalVer"

	kernalRel=$( uname -r )
	echo "System kernal release info is ==>$kernalRel"

	macHardware=$( uname -m )
	echo"System machine hardware is ==>$macHardware"

	CPUinfo=$( lscpu  )
	echo"System CPU info is ==>$CPUinfo"

}

function_host()
{
	echo "Hostname and DNS sytem info"
	echo ""
	host=$( hostname )
	echo "hostname of system is ==>$host"

}


function_NetInfo()
{
	echo "Network info of the system "
	echo ""

	Netinfo=$( ifconfig  )
	echo -n "your ip address and network info ==>$Netinfo"

	Iproute=$( ip route | column -t )
	echo -n "Default gateaway of th system ==>$Iproute"

	echo "network routing ==>$( netstat -nr )"

	echo "Interface traffic information ==>$( netstat -i )"


}

function_whoisOnline()
{
	echo "WHo is online"
	echo ""
	who=$( who | wc -l )

	whoname=$( users | tr ' ' '\n' | sort -u)
	echo " total users online ==>$who and ==>$whoname"

}




function_lastlogged()
{
	echo "Last logged in SYtem and users"
       echo " "

	lastlog=$( last )		
 	echo " Last logs ===>$lastlog"	
}

function_diskusage()
{
	echo  "Disk usage aree as follow"
	echo ""

	diskuse=$( du /home/kali )
	echo "Disk usage ==>$diskuse"

	disksize=$( du -h /home/kali )
	echo "Disk usage sizes ==>$disksize"

	totalsize=$( du -sh /home/kali )
	echo "DIsk total size ==>$totalsize"


}


function_DirFFS()
{

 echo "enter directory name ==>"
 read Dirname
 echo " "
 echo "your directory name ==>$Dirname"

 Files=$( find $Dirname -type f |wc -l )
 Folder=$( find $Dirname -type d |wc -l )
 Size=$(du -sh $Dirname | cut -f 1 )

 echo "no of files of $Dirname ==> $Files"
 echo "no of folders of $Dirname ==> $Folders"
 echo "total size of $Dirname ==>$Size"


}

function_processes()
{
	totalproc=$( ps -aux | wc -l )
	echo "total no of processes  are ==>$totalproc"

	procdisp=$( ps -aux | less )
	echo " displaying all processes==>$procdisp "
}

function_exit()
{
	echo "EXIT "
	exit
}

function_timezone()

{


	echo "YOu have entered timezone please selct you want ot see the time zone or change/set "
	echo "please enter proper path and name "
	echo "or if you want to see the timezines"

	echo " 1) list timezones"
	echo " 2) set timezone"
	echo " 3) timezone "
	echo " 4) date/time"
	read input

	case $input in

        1)
	   echo " THe timezones are "
           timedatectl list-timezones
	   break;;
        2)
       	   echo " TO enter the time zone please enter the path "
	   read path
           timedatectl set-timezone  $path	
	   break;;

	3) 
	   echo " timezones are "	   
           timedatectl
	   break;;
       
 	4)	 
	
	CURRENTDATE=`date +"%Y-%m-%d %T"`
	CURRENTDATEONLY=`date +"%b %d, %Y"`
	CURRENTEPOCTIME=`date +"%Y-%m-%d %T"`
 
	echo Current DCURRENTDATE=`date +"%Y-%m-%d %T"`
	echo Current Date is: ${CURRENTDATEONLY}
	echo Current Date and Time is: `date +"%Y-%m-%d %T"`
	echo Current Date and Time is: ${CURRENTDATE}
	echo Current Unix epoch time is: ${CURRENTEPOCTIME}ate is: ${CURRENTDATEONLY}
	break;;
esac
	echo " do you want to continue  for timezon session"
	read choice
	if [ $choice != "y" ]
             then
	      function_timezone
	else
	      function_MenuDisplay
	fi



}

function_Runlevels()
{
	echo "PLease enter the runlevel mode you want to go" 

	echo ""
	echo "1) Run-level ==> 1 for Emergency mode,single user mode , -rd.break "
	echo "2) Run level ==> 2 for unused ttesting purpose"
	echo "3) Run level ==> 3 for cli(multi-user)"
	echo "4) Run level ==> 4 for unsued Testing purpose"
	echo "5) Run level ==> 5 for graphical user interface wich you already are "
	echo "6) Run level ==> 6 for REBOOT"

	read level
	if [ $level==1 ];then
		echo "you are sure you want to enter to emergency mode"
		read yes
		if [ $yes=='y' ];then
			init 1
		else
			function_MenuDisplay
		fi

	
	elif [ $level==2 ];then
		echo "you are sure you want to enter unused testing mode"
		read yes
		if [ $yes=='y' ];then
			init 2
		else
			390749function_MenuDisplay
		fi

	elif [ $level==3 ];then
		echo"you are sure you want to enter cli mode"
		read yes
		if [ $yes='y' ];then
			init 3
		else
			function_MenuDispay
		fi

	elif [ $level==4 ];then
		echo"you are sure you want to enter unsed testing mode"
		read yes 
		if [ $yes=='y' ];then
			init 4
		else
			function_MenuDisplay
		fi

	elif [ $level==5 ];then
		echo"you are sure you want to enter graphical user interface"
		read yes
		if [ $yes=='y' ];then
			init 5
		else
			fucntion_MenuDisplay
		fi

	elif [ $level==6 ];then
		echo"you sure you want to reboot"
		read yes
		if [ $yes=='y' ];then
			init 6
		else
			function_MenuDisplay
		fi
	fi 
	echo " do you want to continue  for timezon session"
	read choice
	if [ $choice != "y" ]
             then
	      function_Runlevels
	else
	      function_MenuDisplay
	fi


}




function_CheckPorts()
{
	echo " which port you want to check "
	read port

	ports=$( netstat -atnp | grep $port )

	echo " ports information is as follow "
	echo " $ports "
}

function_UserOper()
{
	echo "You have entered for user operations "
	echo " please select options from ( 1 -10 ) "
	echo ""
	echo "1)Create a user"
	echo "2)Create group"
	echo "3)Add user to any primary group"
	echo "4) Add user to Secondary group "
	echo "5)Delete a user"
	echo "6)Change password"
	echo "7)Delete a group"
	echo "8)Confirm id,s and group"
	echo "9)Administrative rules (permissions)"
	echo "10)return to main menu"
	echo "11)exit from script"
	 
	read option
	case $option in

	1)
		echo " You want to create a user please type name of user"
		read User
         	if [ `sed -n "/^$User/p" /etc/passwd` ];then
		
		echo "this user==>$User is already created please try another"

		else
		useradd $User
		echo " Your user has been created successfully ==> $User"
		fi
		break;;


	2)
		echo " YOu want to add group pplease type the name of the group"
		read Group
		groupadd $Group
		echo " Your group has been created by the name ==> $Group"
		break;;
	
	3)
		echo " please type the name of user and group ypu want to add the user"
		read Uname
		echo " enter group name "
		read Gname

		usermod -g $Gname $Uname

		echo " User ==>$Uname is added to Group ==>$Gname "
		break;;

	4) 
		echo " please type the name of user and group ypu want to add the user"
		read Uname
		echo " enter group name if you want to add secondary group for user "
		read Gname

		usermod -G $Gname $Uname

		echo " User ==>$Uname is added to Secondary Group ==>$Gname "
		break;;

	5)                                  
              	echo " please type the name of user you want to delete permanantly"
		read Uname
 
		userdel $Uname

		echo " User ==>$Uname has succesfully deleted "
		break;;

	6) 
		echo " please type the name of user for which you want to chnage password"
		read Uname
	
		passwd $Uname
		echo " User ==>$Uname password has changed successfully "
		break;;

	7) 
		echo " please type the name of Group you want to delete permanantly"
		read Gname

		groupdel $Gname

		echo " Group ==>$Gname has succesfully deleted "
		break;;

	8)
		echo " please type the name of user you want to check it,s id and group"
		read Uname

		echo " User ==> $( id $Uname )  "
		break;;
	esac

	echo " do you want to continue  for timezon session"
	read choice
	if [ $choice != "y" ]
             then
	      function_UserOper
	else
	      function_MenuDisplay
	fi


                                                   
}

function_fileOper()
{	
	echo ""
	echo ""
	echo " please enter the number of your selection below"
	echo ""
	echo "1.  Create a file" 
	echo "2.  Delete a file" 
	echo "3.  Create a directory" 
	echo "4.  Delete a directory" 
	echo "5.  Create a symbolic link"
	echo "6.  Change ownership of a file"
	echo "7.  Change permissions on a file" 
	echo "8.  Modify text within a file" 
	echo "9.  Compress a file" 
	echo "10. Decompress a file"
	echo "11. Return to main menu"
	echo ""
	echo  " Please enter nay of the option above :"

        read option
	case $option in

		1)
			echo " Please enter the name of the file you want to create "
			echo " " 
			read file
			touch $file
			echo " YOur file has been created with name ==> $file"
			break;;

		2)

			echo " Please enter the name of the file you want to delete "
			echo " "
			read file
			rm -rf $file
			echo " YOur file has been deleted sucessfully with name ==> $file"
			break;;

		3)
			echo " Please enter the name of the directory you want to create "
			echo " "
			read dir
			mkdir $dir
			echo " YOur file has been created sucessfully with name ==> $dir"
			break;;
		4)	
			echo " Please enter the name of the file you want to delete "
			echo " "
			read dir
			rm -rf $dir
			echo " YOur directory has been deleted sucessfully with name ==> $dir"
			break;;

		5)
 			echo " Please enter the input file for the symbolic link;"
			read symlinfile
			echo " Please enter the output file for the symbolic link" 
			read symloutfile
			ln -s $symlinfile $symloutfile
			cat $symloutfile
		        echo " Symbolic link created successfully at $symloutfile"
			break;;

		6)
			echo "Which file's ownership should be changed?" 
			read chownfile
			echo " Please enter the username for the new owner of $chownfile: " 
			read chownuser
			echo  " Please enter the new group for $chownfile: "
			read chowngroup
			chown $chownuser.$chowngroup $chownfile 
		        echo "Ownership of $chownfile changed successfully to $chownuser."
			break;;


		7)
			echo " Which file's permissions should be changed? "
			read chmodfile
			echo " Please enter the three-digit numeric string for the permissions you would like to set:" 
			echo ""
			echo " (format is [owner][group][all]  |  ex: 777  for full control for everyone )" 
			echo ""
			read chmodnum
			chmod $chmodnum $chmodfile 
			echo " Permissions for $chmodfile changed successfully.}"  
			break;;			
		
		8)	echo " please enter the file or path you want to edit as  "
			echo " "

			read editfile
			echo " Which program would you like to use to edit this file?" 
			echo " please enter the number of your selection below:"
			echo " 1. vim" 
			echo " 2. nano" 
			echo " 3. mcedit" 	
			echo " 4. emacs" 
			echo " 5. pico" 
			echo ""
			read editapp
			echo ""

			case $editapp in

			1 ) vim $editfile || echo " Failed to open vim. Please check if it is installed.";;
		
			2 ) nano $editfile || echo " Failed to open nano. Please check if it is installed.";;

			3 ) mcedit $editfile || echo " Failed to open mcedit. Please check if it is installed.";;

			4 ) emacs $editfile || echo " Failed to open emacs. Please check if it is installed.";;
	
			5 ) pico $editfile || echo " Failed to open pico. Please check if it is installed.";;
	

			* ) echo " Please make a valid selection.";;


			esac
			break;;

esac

	echo " do you want to continue  for timezon session"
	read choice
	if [ $choice != "y" ]
             then
	      function_fileOper
	else
	      function_MenuDisplay
	fi



}


function_Services()
{
	echo "You have entered services mode please select what you want to do in down options"
	echo " "
	echo " 1) Start a service "
	echo " 2) Stop a service "
	echo " 3) enable a service"
	echo " 4) restart a service"
	read opt
	case $opt in

		1) 
			echo "please enter the service you want to start"
			read service
			systemctl start $service
			echo ""
			echo " your service has been started"
			break;;
		
		2)
			
			echo "please enter the service you want to stop"
			read service
			systemctl stop $service
			echo ""
			echo " your service has been stopped"
			break;;
		

		3)
			echo "please enter the service you want to enable"
			read service
			systemctl enable $service
			echo ""
			echo " your service has been enable"
			break;;
		
		4)
			echo "please enter the service you want to restart"
			read service
			systemctl restart $service
			echo ""
			echo " your service has been restarted"
			break;;
		

	esac
	echo " do you want to continue  for timezon session"
	read choice
	if [ $choice != "y" ]
             then
	      function_Services
	else
	      function_MenuDisplay
	fi


}


function_MenuDisplay
