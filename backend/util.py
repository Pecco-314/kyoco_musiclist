import hashlib

class Util:
    def password(data):
        hash256 = hashlib.sha256()
        hash256.update(data.encode('utf-8'))
        return hash256.hexdigest()