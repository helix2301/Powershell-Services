Add-Type -AssemblyName System.Windows.Forms

$FormObject=[System.Windows.Forms.Form]
$LabelObject=[System.Windows.Forms.Label]
$comboBoxObject=[System.Windows.Forms.ComboBox]


$DefaultFont='Verdana,10'

##Setup Base Form
$AppForm=New-Object $FormObject
$AppForm.ClientSize='800,600'
$AppForm.Text='Lipani Security - Service Inspector'
$AppForm.BackColor='White'
$AppForm.Font=$DefaultFont

#Building The Form
$lblService=New-Object $LabelObject
$lblService.Text='Services :'
$lblService.Autosize=$true
$lblService.Location=New-Object System.Drawing.Point(20, 20)

$ddlService=New-Object $comboBoxObject
$ddlService.width='300'
$ddlService.Location=New-Object System.Drawing.Point(225,20)

Get-Service | ForEach-Object {$ddlService.Items.Add($_.Name)}

$lblForName=New-Object $LabelObject
$lblForName.Text='Services Friendy Name :'
$lblForName.Autosize=$true
$lblForName.Location=New-Object System.Drawing.Point(20, 80)

$lblName=New-Object $LabelObject
$lblName.Text=''
$lblName.Autosize=$true
$lblName.Location=New-Object System.Drawing.Point(450, 80)

$lblForStatus=New-Object $LabelObject
$lblForStatus.Text='Status :'
$lblForStatus.Autosize=$true
$lblForStatus.Location=New-Object System.Drawing.Point(300, 180)

$lblStatus=New-Object $LabelObject
$lblStatus.Text=''
$lblStatus.Autosize=$true
$lblStatus.Location=New-Object System.Drawing.Point(450, 180)

$AppForm.Controls.AddRange(@($lblService, $ddlService, $lblName, $lblForName, $lblForStatus, $lblStatus))

##Add Funcations

Function GetServiceDetails{
    $ServiceName=$ddlService.SelectedItem
    Write-Host "Service Name: $ServiceName"
    $details=Get-Service -Name $serviceName | select *
}

##Add functions

$ddlService.Add_SelectedIndexChanged({GetServiceDetails})

##Show Form
$AppForm.ShowDialog()

##Garbage Collection
$AppForm.Dispose()

#https://youtu.be/jPhznpFna7E?t=610