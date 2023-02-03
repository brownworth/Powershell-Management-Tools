# -----------------------------------------------------------
#
# This script will take a list of computer names
# in machines.txt:
# - attempt to install the LLDP/CDP discovery module on each
# - initiate a set of parallel LLDP capture(s) on the machine(s)
# - return the Computer name, switch name, and port description
# - format the list as a table
#
# -----------------------------------------------------------

$script_path = split-path -parent $MyInvocation.MyCommand.Definition 

$host_names = get-content "$script_path\machines.txt"
$data = invoke-command -computername $host_names -errorAction SilentlyContinue -scriptblock {
    install-packageprovider -name NuGet -minimumversion 2.8.5.201 -force | out-null
    Set-PSRepository PSGallery -InstallationPolicy Trusted
    Install-Module -Name PSDiscoveryProtocol
    Set-ExecutionPolicy Bypass -Scope Process
    $LLDP_capture = Invoke-DiscoveryProtocolCapture
    $port_data = Get-DiscoveryProtocolData $LLDP_capture
    Return $port_data
}

$data | Select-Object PSComputerName, Device, PortDescription