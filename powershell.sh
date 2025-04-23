# Simplified Job Processor and Server Monitor Script

# Configuration Section
# ----------------------
$Logfile = "C:\Autodesk\JobProlog.txt"          # Path to the log file.
$MailFrom = "global.vault.admin@flowpne.com"          # Replace with your actual sending email address.
$MailTo = "jagan.v@celerosft.com"            # Replace with the recipient's email address.
$MailCC = ""                                  # Optional: CC email address. Leave empty if not needed.
$MailSubjectPrefix = "JOBSERVER Status: "      # Subject prefix for the email.
$SmtpServer = "smtprelay.flowpne.com"         # Replace with your SMTP server address.
$SmtpPort = 25                                # REPLACE WITH YOUR ACTUAL SMTP PORT (e.g., 25, 465, 587)
$UseSsl = $false                              # Set to $true if your SMTP server requires SSL/TLS (e.g., for ports 465 or 587)
$TargetServer = "CUNBA-VAULTJOB1.int.flowpne.com"                   # The name of your server to monitor.
$JobProcessorExeName = "Job Processor.exe"   # The exact name of the job processor executable.


# -------------------
# Function Definitions
# -------------------

function Get-FormattedTime {
    return (Get-Date).ToString("HH:mm")
}

function Send-StatusEmail {
    param(
        [string]$Subject,
        [string]$Body
    )
    try {
        if ($UseSsl) {
            Send-MailMessage -From $MailFrom -To $MailTo -Cc $MailCC -Subject $Subject -Body $Body -SmtpServer $SmtpServer -Port $SmtpPort -UseSsl
        } else {
            Send-MailMessage -From $MailFrom -To $MailTo -Cc $MailCC -Subject $Subject -Body $Body -SmtpServer $SmtpServer -Port $SmtpPort
        }
        Write-Output "$(Get-Date -Format "F") - Email sent: $Subject"
        Add-Content $Logfile "$(Get-Date -Format "F") - Email sent: $Subject"
    }
    catch {
        Write-Error "Error sending email: $($_.Exception.Message)"
        Add-Content $Logfile "$(Get-Date -Format "F") - Error sending email: $($_.Exception.Message)"
    }
}

# ----------------
# Main Script Logic
# ----------------

$StartTime = Get-FormattedTime
Add-Content $Logfile "$(Get-Date -Format "F") - Script started at : $StartTime"

$serverReachable = $false
$jobProcessorRunning = $false
$issuesFound = $false
$emailBody = "Status check for server '$TargetServer' at $(Get-Date -Format "F"):`n`n"

# 1. Check Server Reachability (Ping)
if (Test-NetConnection -ComputerName $TargetServer -ErrorAction SilentlyContinue) {
    $serverReachable = $true
    Write-Output "$TargetServer is reachable."
    Add-Content $Logfile "$(Get-Date -Format "F") - $TargetServer is reachable."
} else {
    Write-Warning "$TargetServer is NOT reachable."
    Add-Content $Logfile "$(Get-Date -Format "F") - $TargetServer is NOT reachable."
    $emailBody += "ERROR: Server '$TargetServer' is NOT reachable (ping failed).`n`n"
    $issuesFound = $true
}

# 2. Check Job Processor Process if the server is reachable
if ($serverReachable) {
    try {
        $process = Invoke-Command -ComputerName $TargetServer -ScriptBlock {
            param($exeName)
            Get-Process -Name $exeName -ErrorAction SilentlyContinue
        } -ArgumentList $JobProcessorExeName -ErrorAction Stop

        if ($process) {
            $jobProcessorRunning = $true
            Write-Output "Process '$JobProcessorExeName.exe' is running on $TargetServer."
            Add-Content $Logfile "$(Get-Date -Format "F") - Process '$JobProcessorExeName.exe' is running on $TargetServer."
        } else {
            Write-Warning "Process '$JobProcessorExeName.exe' is NOT running on $TargetServer."
            Add-Content $Logfile "$(Get-Date -Format "F") - Process '$JobProcessorExeName.exe' is NOT running on $TargetServer."
            $emailBody += "ERROR: Process '$JobProcessorExeName.exe' is NOT running on '$TargetServer'.`n`n"
            $issuesFound = $true
        }
    } catch {
        $err = $_
        Write-Error "Error checking processes on $TargetServer: $($err.Exception.Message)"
        Add-Content $Logfile "$(Get-Date -Format "F") - Error checking processes on $TargetServer: $($err.Exception.Message)"
        $emailBody += "ERROR: Exception while checking job processor: $($err.Exception.Message)`n`n"
        $issuesFound = $true
    }
}


;

Showing below error

At line:89 char:50
+ ...       Write-Error "Error checking processes on $TargetServer: $($err. ...
+                                                    ~~~~~~~~~~~~~~
Variable reference is not valid. ':' was not followed by a valid variable name character. Consider using ${} to delimit the name.
At line:90 char:85
+ ... ate -Format "F") - Error checking processes on $TargetServer: $($err. ...
+                                                    ~~~~~~~~~~~~~~
Variable reference is not valid. ':' was not followed by a valid variable name character. Consider using ${} to delimit the name.
At line:97 char:1
+ }
+ ~
Unexpected token '}' in expression or statement.
    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException
    + FullyQualifiedErrorId : InvalidVariableReferenceWithDrive