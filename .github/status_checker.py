# status_checker.py

def check_status(status_code):
    if status_code == 200:
        return "Website is up"
    else:
        return "Website is down"


def main():
    status = check_status(200)
    print(status)

    if status != "Website is up":
        raise SystemExit(1)


if __name__ == "__main__":
    main()
    