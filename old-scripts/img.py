#Originally by solarwind from http://bbs.archlinux.org/viewtopic.php?id=45910
#requires cUrl
###

import sys, os

#Define globals.
tmp = "temp.data" #Temporary file filename.
img = "" #Image filename.
ext = "" #File extension.

#Define functions.
def uploadsingle():
    print("Uploading: " + img)
    os.system("curl -H Expect: -F fileupload=\"@" + img + "\" -F xml=yes -# \"http://www.imageshack.us/index.php\" > " + tmp)

    file = open(tmp, "r")
    content = file.read()

    #Get the image link.
    start = content.find("<image_link>")
    end = content.find("</image_link>")
    link = content[start + 12 : end]

    #Get the thumbnail link.
    start = content.find("<thumb_link>")
    end = content.find("</thumb_link>")
    forum_link = content[start + 12 : end]

    print("Image link:\t\t" + link)
    print("Link for forums:\t[url= + link + ][img]" + forum_link + "[/img][/url]")

def uploadall(extension):
    print("Uploading: *." + extension)
    outfile = open("links.txt", "a")
    list = os.listdir("./")
    for fname in list:
        if fname.endswith(ext):
            print("Uploading: " + fname)
            os.system("curl -H Expect: -F fileupload=\"@" + fname + "\" -F xml=yes -# \"http://www.imageshack.us/index.php\" > " + tmp)
            file = open(tmp, "r")
            content = file.read()
            #Get the image link.
            start = content.find("<image_link>")
            end = content.find("</image_link>")
            link = content[start + 12 : end]
            #Get the thumbnail link.
            start = content.find("<thumb_link>")
            end = content.find("</thumb_link>")
            forum_link = content[start + 12 : end]
            #Append link data to the outfile.
            outfile.write("File: " + fname + "\n")
            outfile.write("Image link:\t\t" + link + "\n")
            outfile.write("Link for forums:\t[url= + link + ][img]" + forum_link + "[/img][/url]\n\n")
            os.system("rm " + tmp) #Remove temporary file.

#Process command line arguments and execute program.
if sys.argv[1] == "all":
    ext = sys.argv[2]
    uploadall(ext)
else:
    img = sys.argv[1]
    uploadsingle()

os.system("rm " + tmp) #Remove temporary file.



