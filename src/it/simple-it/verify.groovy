def logLines = new File(basedir, "build.log").findAll({ it.startsWith("[INFO] Checking if") })

assert "[INFO] Checking if 'Parent Document' document exists in space 'AC'..." in logLines
assert "[INFO] Checking if 'Bar Document' document exists in space 'AC'..." in logLines
assert "[INFO] Checking if 'Foo Document' document exists in space 'AC'..." in logLines

