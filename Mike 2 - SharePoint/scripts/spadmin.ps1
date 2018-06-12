# Add spadmin to local Admin Group
$domain = "red"
$strComputer = "mike2"
$username = "spAdmin"
$computer = [ADSI]("WinNT://" + $strComputer + ",computer")
$computer.name
$Group = $computer.psbase.children.find("administrators")
$Group.name
$Group.Add("WinNT://" + $domain + "/" + $username)