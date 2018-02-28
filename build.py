import sys
import os
import subprocess

# Define our variables
targetDevice = sys.argv[1]
buildTarget = sys.argv[2]
buildDirectory = sys.argv[3]
syncRepositories = sys.argv[4]
buildType = sys.argv[5]
useCCache = sys.argv[6]
makeClean = sys.argv[7]

userName = "minz"
outDir = ("out/target/product/" + str(targetDevice) + "/")

# Default to lunching for lineage by default
if (buildDirectory == "lineage-15.1"):
  romType = "lineage"
else:
  romType = "lineage"

# Give a brief message telling us what our device is, and where we're building
print("Now building for " + str(targetDevice) + " in " + str(buildDirectory))

os.chdir(str(buildDirectory))

subprocess.run(". build/envsetup.sh", shell=True)

if (syncRepositories == "true"):
  print("Syncing Repositories...")
  subprocess.run("repo sync --force-sync -j8", shell=True)

if (useCCache == "yes"):
  subprocess.run("export CCACHE_DIR=/home/ccache/" + str(userName), shell=True)
  print("CCache enabled.")
  subprocess.run("export USE_CCACHE=1", shell=True)
  subprocess.run("prebuilts/misc/linux-x86/ccache/ccache -M 100G", shell=True)
elif (useCCache == "clean"):
  subprocess.run("export CCACHE_DIR=/home/ccache/" + str(userName), shell=True)
  print("Cleaning CCache...")
  subprocess.run("ccache -C", shell=True)

if (makeClean == "yes"):
  if not (os.path.isdir(str(outDir))):
    print("Making clean...")
    subprocess.run("mka clean")
  else:
    print("No need to make clean, the out directory is empty.")
elif (os.path.isdir(str(outDir))):
  os.remove(str(outDir) + "*.zip", str(outDir) + "*.md5sum")
  print("Building dirty.")

print("Build Type is " + str(buildType))

subprocess.run("lunch " + str(romType) + "_" + str(targetDevice) + "-" + str(buildType), shell=True)
subprocess.run("mka " + str(buildTarget) + "-j8", shell=True)
