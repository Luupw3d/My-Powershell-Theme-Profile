oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\half-life-mod.omp.json" | Invoke-Expression
Import-Module posh-git
Import-Module Terminal-Icons
#Import-Module DirColors
Enable-PoshTooltips

#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History

# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#-------------------------------  Set Hot-keys END    -------------------------------

#-------------------------------   Set Alias BEGIN    -------------------------------
# 1. 查看目录 ls & ll
function ListDirectory {
	(Get-ChildItem).Name
	Write-Host("")
}
#删除默认的ls
Remove-Item alias:\ls
#设置新的别名
Set-Alias -Name ls -Value Get-ChildItemColorFormatWide
Set-Alias -Name ll -Value Get-ChildItemColor

# 2. 打开当前工作目录
function OpenCurrentFolder {
	param
	(
		# 输入要打开的路径
		# 用法示例：open C:\
		# 默认路径：当前工作文件夹
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder
#-------------------------------    Set Alias END     -------------------------------
