<#
The MIT License (MIT)

Copyright (c) 2014 Vidar Kongsli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
#>
function Write-Leet {
Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
	$text,
    [Parameter(Mandatory=$false)]
    [switch]$hardcore = $false)
Begin {
    $leet_light =[ordered]@{
        'a' = @('4','@');
        'b' = @('8');
        'e' = @('3');
        'f' = @('ph');
        'g' = @('6','9');
        'i' = @('1','!','|');
        'l' = @('|','1');
        'o' = @('0','()');
        's' = @('5','$');
        't' = @('7');
        'z' = @('2')
    }    
	$leet_hardcore = [ordered]@{
		'a' = @('4','/-\','@');
		'b' = @('8',']3',']8','|3','|8','13');
		'c' = @('(','{');
		'd' = @(')','|)');
        'e' = @('3','ii');
        'f' = @('|=','(=',']]=','ph');
        'g' = @('6','9','[[6','&','(');
        'h' = @('#','|-|','(-)');
        'i' = @('1','!','|');
        'l' = @('|','1','|_');
        'm' = @('/\/\','|V|','(V)');
        'n' = @('/\/','|\|','(\)');
        'o' = @('0','()');
        's' = @('5','$');
        't' = @('7','+');
        'u' = @('(_)','|_|');
        'v' = @('\/');
        'w' = @('\/\/','|/\|','(/\)');
        'x' = @('><');
        'y' = @("'/");
        'z' = @('2')
    }    
    $leet = if($hardcore) { $leet_hardcore } else { $leet_light }
}
Process {
    $res = ''
    foreach ($item in $text.ToCharArray()) {
    	$key = $item.ToString()
		$possibilities = $leet.Get_Item($key)
		if ($possibilities) {
			$res += $possibilities[(get-random -Maximum $possibilities.Count)]
		} else {
			$res += $item
		}
    }
    $res
}
End {}
}