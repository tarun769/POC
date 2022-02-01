import re


class testclassB:
    def price_extraction(self, string):
        res = re.search(r'A\$(\d+).', string)
        return res.group(1)

