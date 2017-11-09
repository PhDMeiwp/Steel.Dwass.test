@echo off
del /a /f /s /q "F:\~\test108\.git\*.*" & git init & git add -A & git commit -m "Source file update" & git branch master & git remote add origin git@github.com:PhDMeiwp/Steel.Dwass.test.git & git push origin master -f
