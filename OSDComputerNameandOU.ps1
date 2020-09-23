#region GUI

#[void][System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') 
#[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') 

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$Global:ErrorProvider = New-Object System.Windows.Forms.ErrorProvider

$screen = [System.Windows.Forms.Screen]::AllScreens

$Form = New-Object System.Windows.Forms.Form    
$Form.FormBorderStyle = 'FixedDialog'
$Form.StartPosition = 'CenterScreen'
$Form.Width = $($screen[0].bounds.Width / 6)
$Form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($PSHome + '\powershell.exe')
$Form.Text = 'Active Directory Information'
$Form.ControlBox = $false
$Form.TopMost = $true
$Form.Font = 'Microsoft Sans Serif,8'

<#
$ComputerName_Textbox = New-Object System.Windows.Forms.TextBox
$ComputerName_Textbox.TabIndex = 1
#Temp name for testing
$ComputerName_Textbox.text = 'wc-r015123123sc'
#>
$ComputerName_Campus_Label = New-Object system.Windows.Forms.Label
$ComputerName_Campus_Label.Text = 'Campus'
$ComputerName_Campus_Label.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($ComputerName_Campus_Label.Text, $ComputerName_Campus_Label.Font)).Width), 30)
$ComputerName_Campus_Textbox = New-Object System.Windows.Forms.TextBox
$ComputerName_Campus_Textbox.Text = 'WC'

$ComputerName_BuildingRoom_Label = New-Object system.Windows.Forms.Label
$ComputerName_BuildingRoom_Label.Text = 'Building/Room'
$ComputerName_BuildingRoom_Label.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($ComputerName_BuildingRoom_Label.Text, $ComputerName_BuildingRoom_Label.Font)).Width), 30)
$ComputerName_BuildingRoom_Textbox = New-Object System.Windows.Forms.TextBox
$ComputerName_BuildingRoom_Textbox.Text = 'R016'

$ComputerName_PCCNumber_Label = New-Object system.Windows.Forms.Label
$ComputerName_PCCNumber_Label.Text = 'PCC#'
$ComputerName_PCCNumber_Label.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($ComputerName_PCCNumber_Label.Text, $ComputerName_PCCNumber_Label.Font)).Width), 30)
$ComputerName_PCCNumber_Textbox = New-Object System.Windows.Forms.TextBox
$ComputerName_PCCNumber_Textbox.Text = (Get-WmiObject -Query "Select * from Win32_SystemEnclosure").SMBiosAssetTag

$ComputerName_Suffix_Label = New-Object system.Windows.Forms.Label
$ComputerName_Suffix_Label.Text = 'Suffix'
$ComputerName_Suffix_Label.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($ComputerName_Suffix_Label.Text, $ComputerName_Suffix_Label.Font)).Width), 30)
$ComputerName_Suffix_Textbox = New-Object System.Windows.Forms.TextBox
$ComputerName_Suffix_Textbox.Text = 'LL'

$ComputerName_Group = New-Object System.Windows.Forms.GroupBox
$ComputerName_Group.Size = New-Object System.Drawing.Size($($Form.Width * .8), 50)
$ComputerName_Group.Location = New-Object System.Drawing.Point($($Form.Width * .05), 10)
$ComputerName_Group.Text = 'Computer name:'

#$ComputerName_Textbox.Size = New-Object System.Drawing.Size($($ComputerName_Group.Width * .9), 50)
$ComputerName_Campus_Textbox.Size = New-Object System.Drawing.Size($($ComputerName_Group.Width * .1), 50)
$ComputerName_BuildingRoom_Textbox.Size = New-Object System.Drawing.Size($($ComputerName_Group.Width * .2), 50)
$ComputerName_PCCNumber_Textbox.Size = New-Object System.Drawing.Size($($ComputerName_Group.Width * .3), 50)
$ComputerName_Suffix_Textbox.Size = New-Object System.Drawing.Size($($ComputerName_Group.Width * .2), 50)


#$ComputerName_Group.Height = $ComputerName_Textbox.Height * 2.2
$ComputerName_Group.Height = ($ComputerName_Campus_Textbox.Height + $ComputerName_Campus_Label.Height) * 1.5
#$ComputerName_Textbox.Location = New-Object System.Drawing.Size($(($ComputerName_Group.Width - $ComputerName_Textbox.Width) * .5), $(($ComputerName_Group.Height - $ComputerName_Textbox.Height) * .75))
$ComputerName_Campus_Textbox.Location = New-Object System.Drawing.Point($(($ComputerName_Group.Width - $ComputerName_Campus_Textbox.Width) * .1), $(($ComputerName_Group.Height - $ComputerName_Campus_Textbox.Height) * .75))
$ComputerName_BuildingRoom_Textbox.Location = New-Object System.Drawing.Point($($ComputerName_Campus_Textbox.Location.X + $ComputerName_Campus_Textbox.Width), $(($ComputerName_Group.Height - $ComputerName_BuildingRoom_Textbox.Height) * .75))
$ComputerName_PCCNumber_Textbox.Location = New-Object System.Drawing.Point($($ComputerName_BuildingRoom_Textbox.Location.X + $ComputerName_BuildingRoom_Textbox.Width), $(($ComputerName_Group.Height - $ComputerName_PCCNumber_Textbox.Height) * .75))
$ComputerName_Suffix_Textbox.Location = New-Object System.Drawing.Point($($ComputerName_PCCNumber_Textbox.Location.X + $ComputerName_PCCNumber_Textbox.Width), $(($ComputerName_Group.Height - $ComputerName_Suffix_Textbox.Height) * .75))

$ComputerName_Campus_Label.Location = New-Object System.Drawing.Point($ComputerName_Campus_Textbox.Location.X, $($ComputerName_Campus_Textbox.Location.Y - 20))
$ComputerName_BuildingRoom_Label.Location = New-Object System.Drawing.Point($ComputerName_BuildingRoom_Textbox.Location.X, $($ComputerName_BuildingRoom_Textbox.Location.Y - 20))
$ComputerName_PCCNumber_Label.Location = New-Object System.Drawing.Point($ComputerName_PCCNumber_Textbox.Location.X, $($ComputerName_PCCNumber_Textbox.Location.Y - 20))
$ComputerName_Suffix_Label.Location = New-Object System.Drawing.Point($ComputerName_Suffix_Textbox.Location.X, $($ComputerName_Suffix_Textbox.Location.Y - 20))

$EDU_RadioButton = New-Object System.Windows.Forms.RadioButton
$EDU_RadioButton.TabStop = $true
$EDU_RadioButton.Text = 'EDU'
$EDU_RadioButton.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($EDU_RadioButton.Text, $EDU_RadioButton.Font)).Width + 30), 30)

$PCC_RadioButton = New-Object System.Windows.Forms.RadioButton
$PCC_RadioButton.TabStop = $true
$PCC_RadioButton.Text = 'PCC'
$PCC_RadioButton.Size = New-Object System.Drawing.Size($(([System.Windows.Forms.TextRenderer]::MeasureText($PCC_RadioButton.Text, $PCC_RadioButton.Font)).Width + 30), 30)

$Domain_Group = New-Object System.Windows.Forms.GroupBox
$Domain_Group.Size = New-Object System.Drawing.Size($($Form.Width * .8), $($EDU_RadioButton.Height + $PCC_RadioButton.Height))
$Domain_Group.Location = New-Object System.Drawing.Point($($Form.Width * .05), $($($ComputerName_Group.Location.Y + $ComputerName_Group.Size.Height + 5)))
$Domain_Group.TabIndex = 2
$Domain_Group.Text = 'Select Domain'

$EDU_RadioButton.Location = New-Object System.Drawing.Point($(($Domain_Group.Width - ($EDU_RadioButton.Width + $PCC_RadioButton.Width)) * .5), $(($Domain_Group.Height - $EDU_RadioButton.Height) * .75))
$PCC_RadioButton.Location = New-Object System.Drawing.Point($($EDU_RadioButton.Location.X + $EDU_RadioButton.Width), $(($Domain_Group.Height - $PCC_RadioButton.Height) * .75))

$Location_Dropdown = New-Object System.Windows.Forms.ComboBox
$Location_Dropdown.DropDownStyle = 'DropDown'
$Location_Dropdown.Items.AddRange(@('Adult Education', 'Desert Vista', 'District', 'Downtown', 'East', 'Maintenance and Security', 'Northwest', 'West'))
$Location_Dropdown.AutoCompleteMode = 'SuggestAppend'
$Location_Dropdown.AutoCompleteSource = 'ListItems'
$Location_Dropdown.TabIndex = 3

$Location_Group = New-Object System.Windows.Forms.GroupBox
$Location_Group.Size = New-Object System.Drawing.Size($($Form.Width * .8), 50)
$Location_Group.Location = New-Object System.Drawing.Point($($Form.Width * .05), $($($Domain_Group.Location.Y + $Domain_Group.Size.Height + 5)))
$Location_Group.Text = 'Select Campus'

$Location_Dropdown.Size = New-Object System.Drawing.Size($($Location_Group.Width * .9), 50)
$Location_Group.Height = $Location_Dropdown.Height * 2.2
$Location_Dropdown.Location = New-Object System.Drawing.Point($(($Location_Group.Width - $Location_Dropdown.Width) * .5), $(($Location_Group.Height - $Location_Dropdown.Height) * .75))

$Submit_Button = New-Object System.Windows.Forms.Button
$Submit_Button.Size = New-Object System.Drawing.Size(80, 25)
$Submit_Button.Location = New-Object System.Drawing.Point($((($Location_Group.Width - $Submit_Button.Width) * .5) + $Location_Dropdown.Location.X), $($Location_Group.Location.Y + $Location_Group.Size.Height + 5))
$Submit_Button.Text = 'OK'
$Submit_Button.TabIndex = 4
$Form.AcceptButton = $Submit_Button

#$Form.Height = $($ComputerName_Group.Size.Height + $Domain_Group.Size.Height + $Location_Group.Size.Height + $Submit_Button.Size.Height) * 1.5
$Form.Height = $Submit_Button.Location.Y * 1.4
$Form.Controls.AddRange(@($ComputerName_Group, $Domain_Group, $Location_Group, $Submit_Button))
#$ComputerName_Group.Controls.Add($ComputerName_Textbox)
$ComputerName_Group.Controls.AddRange(@($ComputerName_Campus_Textbox, $ComputerName_Campus_Label, $ComputerName_BuildingRoom_Textbox, $ComputerName_BuildingRoom_Label,$ComputerName_PCCNumber_Textbox, $ComputerName_PCCNumber_Label, $ComputerName_Suffix_Textbox, $ComputerName_Suffix_Label))
$Domain_Group.Controls.AddRange(@($EDU_RadioButton, $PCC_RadioButton))
$Location_Group.Controls.Add($Location_Dropdown)

#endregion

#region Functions

function Find-Group() {
    $FormGroups = @()
    ForEach ($control in $Form.Controls) {
        if ($control.ToString().StartsWith('System.Windows.Forms.GroupBox')) {
            $FormGroups += $control
        }
    }
    return $FormGroups
}

function Confirm-NoError {
    $i = 0
    foreach ($group in Find-Group) {
        if ($ErrorProvider.GetError($group)) {
            $i++
        }
    }
    if ($i -gt 0) {
        return $false
    }
    else {
        return $true
    }
}
#endregion

#region Actions
$Submit_Button.Add_Click( { 

        # Verify Computer Name
        $ErrorProvider.SetError($ComputerName_Group, '')
        Switch -regex ($ComputerName_Textbox.Text) {
            #Normal Campus
            '([a-z]{4}|(([a-z]{2}|\d{2})-[a-z]{1,2}))\d{8,9}([a-z]{2}|v\d{1})' {
                $ComputerName = $ComputerName_Textbox.Text.ToUpper()
                break
            }
            #CARES Act
            '[a-z]{3}-[a-z]{3}\d{6}[a-z]{2}' {
                $ComputerName = $ComputerName_Textbox.Text.ToUpper()
                break
            }
            default {
                $ErrorProvider.SetError($ComputerName_Group, 'Computer name invalid, please correct the computer name.')
            }
        }

        # Verify Location
        if ($Location_Dropdown.Items -contains $Location_Dropdown.Text) {
            $ErrorProvider.SetError($Location_Group, '')
        }
        else {
            $ErrorProvider.SetError($Location_Group, 'Select a location')
        }

        # Verify Domain
        $ErrorProvider.SetError($Domain_Group, '')
        if ($EDU_RadioButton.Checked -eq $true) {
            $Domain = 'EDU-Domain.pima.edu'
            $OULocation = "LDAP://OU=$($Location_Dropdown.Text),OU=Staging,DC=$Domain,DC=pima,DC=edu"
        }
        if ($PCC_RadioButton.Checked -eq $true) {
            $Domain = 'PCC-Domain.pima.edu'
            $OULocation = "LDAP://OU=$($Location_Dropdown.Text),OU=Staging,DC=$Domain,DC=pima,DC=edu"
        }
        elseif (($EDU_RadioButton.Checked -or $PCC_RadioButton.Checked) -eq $false) {
            $ErrorProvider.SetError($Domain_Group, 'Select a domain')
        } 
        
        if (Confirm-NoError) {
            # Temp Messagebox, for testing
            [void][System.Windows.Forms.MessageBox]::Show("Computer Name: $($ComputerName) `nOU: $($OULocation)", "Test Submission")
            #$TSEnvironment = New-Object -COMObject Microsoft.SMS.TSEnvironment 
            #$TSEnvironment.Value("OSDComputerName") = "$($ComputerName)"
            #$TSEnvironment.Value("OSDDomainOUName") = "$($OULocation)"
            #$TSEnvironment.Value("OSDDomainName") = "$($Domain)"
            $Form.Close()
        }
    })

#endregion

[void]$Form.ShowDialog()