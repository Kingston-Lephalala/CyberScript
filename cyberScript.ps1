Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Cybersecurity Awareness"
$form.Size = New-Object System.Drawing.Size(800, 350)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.ControlBox = $false

# Load the system warning icon
$iconHandle = [System.Drawing.SystemIcons]::Warning.Handle
$icon = [System.Drawing.Icon]::FromHandle($iconHandle)

# Create PictureBox for the icon
$iconBox = New-Object System.Windows.Forms.PictureBox
$iconBox.Image = $icon.ToBitmap()
$iconBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$iconBox.Location = New-Object System.Drawing.Point(10, 10)

# Create a label for the main message
$label = New-Object System.Windows.Forms.Label
$label.AutoSize = $true
$label.Text = "Page Hijack:`n`nPage hijacking is when you are redirected from a legitimate site to a malicious one. Be aware of that.`n`n `nHow to spot Hijacked page:`nWhen a click redirects you to another site.`n `nAlways verify the link`n `nBookmark your frequently visited sites."
$label.Location = New-Object System.Drawing.Point(50, 10)
$label.Size = New-Object System.Drawing.Size(730, 250)
$label.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$label.TextAlign = [System.Drawing.ContentAlignment]::TopLeft

# Create a label for the closing message
$closingLabel = New-Object System.Windows.Forms.Label
$closingLabel.AutoSize = $true
$closingLabel.Text = "This message will close automatically after 10 seconds."
$closingLabel.Location = New-Object System.Drawing.Point(10, 270)
$closingLabel.Size = New-Object System.Drawing.Size(780, 20)
$closingLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$closingLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

# Add controls to the form
$form.Controls.Add($iconBox)
$form.Controls.Add($label)
$form.Controls.Add($closingLabel)

# Timer to close the form after 5 seconds
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 10000
$timer.Add_Tick({
    $timer.Stop()
    $form.Close()
})

$timer.Start()

# Show the form
$form.ShowDialog()
