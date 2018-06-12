Manual installation: Configuration Manager 2012 R2

 

## Installing prerequisites for Configuration Manager 2012 R2

 

### Creating the System Management Container

To create a container log on to the Domain controller with
administrator account. Use ADSI-Edit to create a new object named. Select the
class as container and set the value to System Management.

Now that we have created the system management container, we
must grant the site server’s computer account the permissions that are required
to publish site information to the container. The primary site server computer
account must be granted Full Control permissions to the System Management
container and all its child objects. Use Active Directory Users and Computers
and change the delegate control of the system management module.

### Extending the Active Directory scheme

To extend the Active Directory Schema locate the extadsh.exe
which can be found in \SMSSETUP\BIN\X64 of the configuration manager setup ISO.
Copy the path and execute in CMD.

 

### Installing roles and features

After creating a system manager container, assigning
permissions and extending the AD scheme you can start adding Windows Roles and
Features to the server. As this is a simple process I won’t go in the details.
       
Server Roles

  
Web Server (IIS)

       
Features

 
- Net Framework 3.5 Features [Install all sub
features]

 
- .Net Framework 4.5 Features [Install all sub
features]

 
- BITS

  
- Remote Differential Compression

      
Roles Services


- Common HTTP Features

 
- Default Document

 
- Static Content

 
- Application Development


- ASP.NET 3.5

 
- .NET Extensibility 3.5


- ASP.NET 4.5

 
- .NET Extensibility 4.5

 
- ISAPI extensions

  
- Security

 
- Windows Authentication

  
- IIS 6 Management Compatibility


- IIS Management Console


- IIS 6 Metabase Compatibility
 
- IIS 6 WMI Compatibility
 
- IIS Management Scripts and Tools

**ATTENTION: **Before
you start the installation, you need to specify an alternate source path to
complete certain installations. This means you need to link your Windows Server
2012 R2 .ISO.

 

### Windows Assessment and Deployment Kit 8.1(Windows ADK 8.1) 

To customize, assess, and deploy Windows operating systems
to new computers we will need the Windows ADK. This is a very straightforward
installation, make sure you         select
the following features: **Deployment tools**,
**Windows Preinstallation Enviroment**
and **User State Migration Tool**.

### Windows Assessment and Deployment Kit 10(Windows ADK 10) + service pack 1
& 2

For Windows 10 and windows server 2016 support we also need
to install the Windows ADK 10. This is the same procedure as the 8.1
instalation.

 

### Installing SQL Server 2014

In this part we will be looking at the steps for Installing
SQL Server 2014 for Configuration Manager 2012 R2. 

Click on **Installation**
and click on **New SQL server standalone
installation**. 

Click **OK** once the
Setup support rules are run and verified.

Check the box for** I
accept the license terms** and click on **Next.**

After the Setup Support Rules are completed click on **Next.**

Select the Setup Role as **SQL Server Feature Installation** and click **Next**.

On the Feature Selection window, **select Database Engine Services**, **Reporting Services Native** and **Management
Tools** and click **Next**.

For Instance Configuration click on **Default Instance **and click **Next.**

For Service Accounts, Change al StartupTypes to **automatic**, and set the accounts to a **domain administrator**. Don’t forget to
change the collation to: **SQL_Latin1_General_CP1_CI_AS**.
Click **Next.**

Click **Add Current
User**, this will add the current user to SQL server administrators. Choose
the Authentication Mode as **Windows authentication
mode**. Click **Next.**

Choose Reporting Services Native Mode and click on **Install and Configure**. Click on **Next**.

Click **Install** to
start the installation. Close the windows after the installation is successful.

After the installation of SQL we need to change some
settings.

Hit **Windows-R **and
type **ssms**, hit **Enter.**

Login to the server and right click the Server and click on
Properties. Click on Memory, set Minimum server memory value to 8192 MB and set
Maximum server memory as 8192 MB. 

Click on OK and close the SQL management studio.

 

### Installing WSUS

WSUS is Microsoft’s separate, stand-alone server-based
product for distributing updates to Windows systems. WSUS also uses the WUA to
scan for patch applicability and subsequently install updates delivered by
WSUS.

To install WSUS on Windows Server 2012 R2, click on **Server Manager**, click on **Manage**, click **Add Roles and Features**, select **Windows
Server Update Services** and click on **Next**.

Choose **WSUS Services**
and **Database** as role services.

Choose an appropriate folder to store the updates.

Specify the database server where you want to store the WSUS
database.

Install.

Once the installation is complete **DO NOT** click on Launch Post-Installation tasks. Click on **Close**.

 

### Configuring Firewall Settings

In this post we will look at the steps for configuring
firewall settings for configuration manager 2012 R2. Some connections use ports
that are not configurable, and some support custom ports you specify. You must
verify that the required ports are available.

Create a GPO **Client
Push Policy Settings**.

Edit this GPO.

Make inbound rule **File
and Printer Sharing** and make sure you **allow**
the connection.

Make inbound rule**
Windows Management Instrumentation** and make sure you **allow** the connection.

Now we will configure the ports for our database.

Create a GPO **SQL
Ports**.

Edit this GPO.

Make inbound rules for TCP port **1433** and **4022**, make sure
you **allow** the connection, apply this
rule to: **Domain, Private and Public**.

Launch the command prompt and type the command **gpupdate /force** and hit **enter **on the DC and SCCM server.

 

## Installing System Center 2012 R2 Configuration Manager

Once you have downloaded the configuration Manager 2012 R2
iso file, extract the iso file to a folder on the machine where you are going
to install the SCCM. Run the file **splash**
to launch the Setup screen. Click on **Install**
to the begin the Installation.

Click on **Install a
Configuration Manager Primary Site** and click Next.

Enter a key.

**Accept** all terms.

**Download** the
prerequisites or **select** the folder
where they are located.

Specify a **Site Code**,
**Site name** and check the box **Install the Configuration Manager Console**.
Click on **Next**.

Install the primary site as a standalone site. **Yes**. **Next. Next. Next.**

Choose Configure the communication method on each site
system role and click **Next**.

Check the box for Install a **management point** and Install a **distribution
point **and click on **Next**.

Now you will see a prerequisite check, if you followed the
steps above you should see no warnings or errors. If the test succeeds begin
the installation. 

The installation takes some time to get completed. Once the
installation is complete you can click on Close. You can view the setup log
file with a tool called CMTrace. The is located SCCM 2012 R2 source DVD under
\SMSSETUP\TOOLS. Launch the CMTrace tool, open the log file ConfigMgrSetup.log
located in C drive.

 

 

## Configuring System Center 2012 R2 Configuration Manager

### Configuring Discovery and Boundaries

Active Directory Forest Discovery – As the name suggests it
discovers Active Directory sites and subnets, and then creates Configuration
Manager boundaries for each site and subnet from the forests which have been
configured for discovery. With this discovery method you can automatically
create the Active Directory or IP subnet boundaries that are within the
discovered Active Directory Forests.

Launch the System Center 2012 Configuration Manager R2
Console. On the left pane select the **Administration**,
expand **Hierarchy Configuration**, Select** Discovery Methods**. On the right pane
double click “**Active Directory Forest
Discovery**”. Check all the boxes to enable the **AD Forest****Discovery**.
With this all the Active Directory site boundaries are created automatically
along with IP address boundaries. Click on **Apply**.
When you click on **Apply**, it asks you
to run the full discovery as soon as possible. Click on **Yes**. Click on **OK**.

To enable the Active Directory Group Discovery, Double click
the **Active Directory Group Discovery**
and check the box which says “**Enable
Active Directory Group Discovery**“. Once you do that at the bottom you must
add the Groups or the Location. Click on **Add**
and click on **Location**. Click **Browse** to specify the location. Select
the **Active Directory Container**.
Click on **Apply**. When you click on
Apply, it asks you to run the full discovery as soon as possible. Click on **Yes**. Click on **OK**.

 

### Installing Site System Roles

Open the Configuration Manager console, Select **Administration**, Under **Site Configuration** select **Sites**. Click on **Add Site System Roles**. Click **Next**.
Click **Next**. Select **Application Catalog Web Service Point,
Application Catalog Website Point, Fallback status point**. Click **Next**. Click **Next**. Click **Next**. Click **Next**. Provide the **Organization Name** and choose the **color**, **Next**. **Close** the window when the installation is
complete.

 

## Configuring Client Settings

In this part we will be looking at steps on configuring
client settings in configuration manager 2012 R2. In System Center 2012 R2
Configuration Manager, you can specify client settings at a collection level,
allowing you to define different settings as necessary. We have the flexibility
to create multiple client device or client user settings and apply it to
different collections as per our requirement. When you create a client setting
a priority is assigned to it, those with a higher priority win over settings
with a lower priority. Note that the default client settings has the priority
of 10000, which means you can have 9999 client settings that would have higher
priority over the default client settings.

In this example we will select **Client Policy, Compliance Settings, Computer Agent, Computer Restart,
Remote Tools and Software Deployment.**

Client Policy – Client Policy polling interval specifies how
frequently client computers download client policy from management point.
Select **Client****Policy** from the left pane, Set **Client
Policy Polling to interval to 5 minutes.**

Compliance Settings – If compliance settings are enabled or
compliance evaluation on client is set to yes, then compliance evaluation
happens on clients.

Select **Computer****Agent**, to set the default Application
Catalog website point click “**Set Website**”.
Select use Intranet FQDN. click **OK**.
Set **“Add Default Application catalog website
to IE trusted site zones**” to **Yes**.
Specify the **Organization Name** to be
displayed in Software center. Rest of the settings remain unchanged.

Computer Restart – Computer restart device settings allow
you to specify the countdown interval for ConfigMgr-initiated restarts. Ensure
that the intervals specified are shorter in duration than the shortest
maintenance window applied to your client, so the computer restarts during the
window. We will change the temporary notification that’s displayed to user to
60 minutes.

Remote Tools – You can use Remote Tools for remote
management of client desktops for troubleshooting purposes, Remote Tools uses
the RDP functionality provided by the Windows OS and you can use this feature
to take over desktop using Remote Desktop or assisting the end user using the
Remote Assistance functionality, where both the end user and help desk look at
the same desktop.

Click on **Remote Tools**
on the left Pane, we will enable **Remote
Control****on****clients**. To do so click on **configure**.
check **Enable****Remote****Control****on****Client****Computers**. Choose **Domain**, **Private** and **Public**.
Click **OK.**

To set Permitted Viewers for remote connection and remote
assistance click “**Set Viewers**“. For
example you can add a group which consists of users from IT team who would take
a remote control for troubleshooting purpose.

Software Deployment – Software Deployment settings allow you
to specify when software deployments are re-evaluated. By default re-evaluation
for deployments occurs every 7 days, you can change the default value by
clicking on Schedule and set it to your requirement. In this example I have set
it for evaluate for every 2 days. Click **OK**.

 

## Configuration Manager 2012 R2 Client Installation

### Client Push Installation

From the Configuration Manager Console Click **Administration**, Under **Site Configuration**, Click **Sites**, at the top ribbon under Client
Installation Settings, click **Client Push
Installation. **In the **General** tab
check the box for **Enable Automatic site
wide client push installati**on. Under System types select **Servers and Workstations**. If you want
to install the client agent on domain controllers choose the option “**Always Install configuration Manager Client
on Domain Controllers**“, with this the client agents will be installed on
all the newly discovered Domain controllers. If you want to have an option of
pushing the client agent to domain controllers during client installation
wizard then choose the option “**Never Install
Configuration Manager Client on Domain Controller unless specified in Client
Push Installation Wizard**”. Click on **Apply**.
Select the **Accounts** tab, the account
that you will add here must have local administrator rights on every computer
on which you want to install the client. Once you have added the account, Click
**Apply** and **OK** to close the properties page.

 

## Boot Images and Distribution Point Configuration For OSD In SCCM 2012 R2

### PXE

PXE initiated deployments: PXE-initiated deployments let
client computers request a deployment over the network. The operating system
image and a Windows PE boot image are sent to a distribution point that is
configured to accept PXE boot requests. We will first enable the PXE support
for the clients. Launch the Configuration Manager 2012 R2 console, click on
Administration, Servers and Site system roles, right click Distribution point
and click properties. Click on PXE tab, check the box “Enable PXE support for
clients“. There is warning box that appears, click on Yes. This will enable the
PXE support for clients. When you enable the PXE support for clients the
Windows Deployment Services will be installed in the background. You will see
the WDS service running when you open services.msc. Enable the option Allow
this DP to respond to incoming PXE requests, this will allow DP to respond to
the incoming PXE requests. Enable the option Enable unknown computer support,
an unknown computer may be a computer where the Configuration Manager client is
not installed or it can be a computer that is not imported into Configuration
Manager or that has not been discovered by Configuration Manager. To deploy
operating systems to any of the computers you must enable this option. Enable
the option Require a password when computers use PXE, it is recommended to
provide a strong password for any computers that use PXE. This is more of an
additional security for your PXE deployments. User Device Affinity – This is to
specify how you want the distribution point to associate users with the
destination computer for PXE deployments. You have 3 options for user device
affinity, a) Do not use user device affinity – Select this if you do not want
to associate users with the destination computer. b) Allow user device affinity
with manual approval – Select this option to wait for approval from an
administrative user before users are associated with the destination computer.
c) Allow user device affinity with automatic approval – Select this option to
automatically associate users with the destination computer without waiting for
approval. For the option Network Interfaces, select Respond to PXE requests on
all network interfaces. Here you basically specify whether the distribution
point responds to PXE requests from all network interfaces or from specific
network interfaces. If you want a specific network interface to respond to PXE
request select Respond to PXE requests on specific network interfaces. PXE
server response delay – This option is to specify delay (in seconds) for the
distribution point before it responds to computer requests when multiple
PXE-enabled distribution points are used. By default, the Configuration Manager
PXE service point responds first to network PXE requests. Once you have
configured these options click on Apply and click on OK. 

 

### Boot images

Before you proceed for OSD, you need to make few changes to
the Boot Images too. When you install SCCM 2012 R2, you will find that there
are 2 images that are installed by SCCM. Boot Image (x64) – used when you
deploy 64 bit OS, Boot Image (x86) – used when you deploy 32 bit OS. The first
step is to enable the command support on both the boot images. Enabling this
option helps in troubleshooting OS deployment issues. To enable the command
support, in the CM console, click Software Library, expand Operating system,
Click Boot Images. Right click Boot Image (X64) and click on Properties. Click
on Customization tab and check the box Enable Command Support (testing only).
Click on Apply

After you enable the command support, on the same window
click on Data Source tab and make sure the option Deploy this boot image from
the PXE-enabled DP. This is option is enabled by default, if its not enabled
please enable it. Click on Apply and click OK.

The changes that you made to Boot Image (x64), repeat the
same for Boot Image (x86). 

After you make the changes to the Boot Images you must
distribute the content to DP. If you had distributed the boot images to DP
previously and in case if you make changes to it post that then you can Update
Distribution Points. To distribute the boot images to DP, right click on the
boot image and click Distribute Content. Distribute content of both the boot
images.

Network Access Account

To configure the Network Access Account, open the CM2012 R2
console, click on Administration, expand Overview, expand Site Configuration,
click Sites, on the top ribbon click Configure Site Components, click Software
Distribution. Click on the tab Network Access Account, choose Specify the
account that accesses network locations (by default the option is set to Use
the computer account of Configuration Manager client). Click on the orange icon
and add the user account that has enough permissions to access the content
which is required while deploying Operating System. Click on Apply and click on
OK.

 

### Capturing Boot Image

We will first create a task sequence media and create a
capture media which is in saved .iso format. This .iso file contains the
necessary files and instructions to capture a reference operating system. The
same .iso file captures the operating system and stores the captured OS in .wim
format. Once we get the .wim file we will import the file to SCCM 2012 R2 and
we can use this .wim to deploy this OS to another computer either by using SCCM
or WDS.

 The first step
involves creating a capture media which is in .iso file. Launch the ConfigMgr
console, click on Software Library, expand Overview, expand Operating Systems,
right click Task Sequences and click on Create Task Sequence Media.

Type of Media – Select the type of media as Capture Media.
Click Next.

Media Type – You can select either USB flash drive or
CD/DVD. I have tried using USB flash drive and even that works. In this example
we will choose CD/DVD, and we will store the media file in one of the shared
location on SCCM server. You can choose to store the capture media on any
shared location, it may not be necessarily SCCM server. One important thing
here you must save the capture media with .iso extension. Click on Next.

Selecting Boot Image – This is very important step. Select
the Boot Image by clicking on Browse. Select Boot Image (x64) and for DP click
on Browse and select the desired DP. Click Next.

The capture media has been created by the wizard. Click on
Close.

After creating the capture media we will now mount the
capture media (.iso file) on the windows machine and run the image capture
wizard. 

Image Destination – Provide a folder path where the captured
image should be stored. The name of the captured image should have .wim as
extension. Also provide a user account that has enough permissions to store the
captured file to the shared folder. Click Next.

Image Information – Provide the image information such as
Created by, Version and Description. Click on Next.

Click on Finish to complete the Image Capture Wizard. Note
that we have just run the image capture wizard, in the next step sysprep
captures the OS.

The computer restarts and we see that the wizard now starts
capturing volume and the OS.

Once we have got the .wim file, we can import the .wim as
operating system image in SCCM 2012 R2. To import the operating system image,
right click Operating System Images, click on Add Operating System Image. Enter
the path where the captured .wim file is present. Click on Next.

The name and version is picked up automatically, click on
Next.

The operating system image has been imported successfully.
Click on Close

After importing the image the next step is to distribute the
image to the DP. Right click on the windows image and click on Distribute
Content.

Add the DP and click Next.

The image file has been distributed to the DP. Click on
Close. Wait for sometime while the DP updates the content, check the content
status and you must see a green circle which means that content is now
available with DP.       


