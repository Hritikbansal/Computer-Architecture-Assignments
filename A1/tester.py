# import required libraries
import sys
import os
import glob
import zipfile
import shutil

# from pathlib import Path

# check whether all the required files are present in directory
def check_file_presence(path):
    dir = [i for i in os.listdir(path)]
    # print(dir)
    if ("bubblesort.asm" in dir):   
        pass

    else:
        print("bubblesort.asm absent in", path)

    if ("mergesort.asm" in dir):
        pass
    else:
        print("mergesort.asm absent in", path)

    if ("quicksort.asm" in dir):
        pass
    else:
        print("quicksort.asm absent in", path)

        
    return 1


# check whether code is in intended format
def check_code_format(path):
    bs_search = 1
    ms_search = 1
    qs_search = 1
    # check code of bubblesort
    try:
        fu = open(os.path.join(path, "bubblesort.asm"), "r")
 

        bs_search = 1
        t = []
        for x in fu:
            if (bs_search == 1) and (".bubblesort:" in x):
                bs_search += 1
            elif (bs_search == 2) and (".main:" in x):
                bs_search += 1
                t = ["mov", "r3"]
            elif bs_search == 3:
                if all(i in x for i in t):
                    bs_search += 1
                    t = ["@", "Print"]
            elif bs_search == 4:
                if all(i in x for i in t):
                    bs_search += 1
                    break
        fu.close()
        # print('bs: ', bs_search)
        if bs_search != 5:
            print("bubblesort.asm is not in required format")
        else:
            print("bubblesort.asm is in the required format")
 
    except:
        print("Not checking format of bubblesort.asm, file absent in", path)

    # check code of mergesort
    try:
        fu = open(os.path.join(path, "mergesort.asm"), "r")
        ms_search = 1
        t = []
        for x in fu:
            if (ms_search == 1) and (".mergesort:" in x):
                ms_search += 1
            elif (ms_search == 2) and (".merge:" in x):
                ms_search += 1
            elif (ms_search == 3) and (".main:" in x):
                ms_search += 1
                t = ["add", "r4", "r2", "r3"]
            elif ms_search == 4:
                if all(i in x for i in t):
                    ms_search += 1
                    t = ["@", "Print"]
            elif ms_search == 5:
                if all(i in x for i in t):
                    ms_search += 1
                    break
        fu.close()
        # print('ms: ', ms_search)
        if ms_search != 6:
            print("mergesort.asm is not in required format")
        else:
            print("mergesort.asm is in the required format")
    except:
        print("Not checking format of mergesort.asm, file absent in", path)

    # check code of quicksort
    try: 
        fu = open(os.path.join(path, "quicksort.asm"), "r")
        qs_search = 1
        for x in fu:
            if (qs_search == 1) and (".quicksort:" in x):
                qs_search += 1
            elif (qs_search == 2) and (".main:" in x):
                qs_search += 1
                t = ["add", "r4", "r2", "r3"]
            elif qs_search == 3:
                if all(i in x for i in t):
                    qs_search += 1
                    t = ["@", "Print"]
            elif qs_search == 4:
                if all(i in x for i in t):
                    qs_search += 1
                    break
        fu.close()
        # print('qs: ', qs_search)
        if qs_search != 5:
            print("quicksort.asm is not in required format")
        else:
            print("quicksort.asm is in the required format")
    except:
        print("Not checking format of quicksort.asm, file absent in", path)

    if (bs_search == 5) and (ms_search == 6) and (qs_search == 5):
        return 1
    else:
        return 0

# main function
def main():
    # check each and every submission
    root = "./submission/"

    # check whether all files are present folder being checked
    #check_file_presence(root)

    path = "./submission/"
    if os.path.exists(path) and os.path.isdir(path):
        shutil.rmtree(path)

    # extract all submissions
    zipfiles = glob.glob("./*.zip")
    # print(zipfiles)
    for file in zipfiles:
        with zipfile.ZipFile(file, "r") as zip_ref:
            zip_ref.extractall("submission")


    # check whether code is intended format
    if check_code_format(root) == 0:
        exit()
    else:
        print("all files are in required format")

if __name__ == "__main__":
    main()