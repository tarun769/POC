from robot.api.deco import keyword


class testclassA:

    @keyword('subtract values')
    def addnums(self, n1, n2):
        return int(n1) - int(n2)
