1.--make a new machine in virtual box set name ROUTER
	--set adapter 1 'Bridge adapter'
	--set adapter 2 'Internal network' name=VLAN
	--set adapter 3 'internal network' name=HOTSPOT
	--set adapter 4 'Hots Only Adapter'
2.--install mikrotik on these machine (A>I>Y>Y)
3.--type system identity set name=ROUTER
4.--open winbox version random
5.--open IP>DHCP CLIENT>and ADD 'ether1' to make internet access
6.--open terminal type ; tool fetch url=https://raw.githubusercontent.com/fajpras/conf/CLI/MIKROTIK/MIKK.src
7.--install another one ; tool fetch url=https://raw.githubusercontent.com/fajpras/conf/CLI/MIKROTIK/SWIT.src
8.--after done installed these file go delete the DHCP CLIEN
9.--open terminal on winbox type; impor file-name=MIKK.rsc ENTER 
10.--for ROUTER configuration is DONE 
	--in terminal type file set SWIT.rsc content and copy all thing inside that
11.--make one machine with name SWITCH and install mikrotik on it
12.--change adapter again and run winbox 
13.--open terminal and paste it