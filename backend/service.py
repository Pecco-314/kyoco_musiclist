from dao import Dao
from util import Util
from constants.code import Code

class Service:
    def __init__(self):
        self.dao = Dao()    

    def get_musiclist(self, keyword):
        musiclist = self.dao.get_musiclist()
        l1, l2, l3, l4 = [], [], [], []
        keyword = keyword.strip().lower()

        def add_music(l, music):
            TAG_INDEX = {'singer': 0, 'normal': 1}
            music['tags'].sort(key=lambda tag: TAG_INDEX[tag['type']])
            l.append(music)

        for music in musiclist:
            musicname = music['name'].lower()
            if musicname == keyword:
                add_music(l1, music)
            elif musicname.find(keyword) != -1:
                add_music(l2, music)
            else:
                for tag in music['tags']:
                    tagname = tag['name'].lower()
                    if tagname == keyword:                
                        add_music(l3, music)
                        break
                    elif tagname.find(keyword) != -1:
                        add_music(l4, music)
                        break
        return {'code': Code.OK, 'data': l1 + l2 + l3 + l4}

    def login(self, session, login_data):
        PASSWORD = 'e9b2bab43d002e46f8c07f8d61c95906387941d88aca594f9bb727eea549b02f'
        password = login_data['password']
        session.permanent = True
        if Util.password(password) == PASSWORD:
            session['login'] = True
            return {'code': Code.OK, 'message': '登录成功'}
        else:
            return {'code': Code.WRONG_PASSWORD, 'message': '密码错误'}

    def ping(self, session):
        return {'code': Code.OK, 'data': { 'isLogin': bool(session.get('login')) } }

    def updateMusic(self, musicForm):
        connection, cursor = self.dao.connect()
        id = musicForm['id']
        if id is None:
            id = self.dao.insert_music(cursor, musicForm['name'], musicForm['description'])
        else:
            self.dao.update_music(cursor, musicForm['id'], musicForm['name'], musicForm['description'])
        old_tags = self.dao.get_tags(id)
        new_tags = musicForm['tags']
        for tag in old_tags:
            if tag not in new_tags:
                self.dao.delete_tag(cursor, id, tag['name'])
        for tag in new_tags:
            if tag not in old_tags:
                self.dao.add_tag(cursor, id, tag['name'], tag['type'])
        connection.commit()
        musicForm['id'] = id
        return {'code': Code.OK, 'data': musicForm}

    def deleteMusic(self, music_id):
        connection, cursor = self.dao.connect()
        self.dao.delete_music(cursor, music_id)
        connection.commit()
        return {'code': Code.OK}