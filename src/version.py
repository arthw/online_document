def get_version():
    ver = "1.1.0"
    with open("version.txt", "w") as f:
        f.write(ver)

    return ver