def isEnglish(s):
    return s.isascii()


if __name__ == '__main__':
    while True:
        inString = input('input\n\n')
        if inString == "exit" or inString == "εχιτ":
            break
        print("\n\n\n")
        outString = "\gr"
        currentLangEnglish = False
        for word in inString.split():
            if isEnglish(word) and currentLangEnglish == False:
                word = "\en " + word
                currentLangEnglish = True
            if isEnglish(word) is False and currentLangEnglish:
                word = "\gr " + word
                currentLangEnglish = False
            outString += " " + word

        print(outString)
        print("\n\n\n")
