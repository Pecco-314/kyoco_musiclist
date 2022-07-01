import psycopg2

class Dao:
    def __init__(self):
        self.rconnection, self.rcursor = self.connect()

    def connect(self):
        connection = psycopg2.connect(host="localhost", user="postgres", password="postgres", database="kyoco")
        cursor = connection.cursor()
        return connection, cursor

    def insert_music(self, cursor, name, description):
        sql = "insert into music(name, description) values (%s, %s)"
        cursor.execute(sql, name, description)

    def add_tag(self, cursor, music_id, tag_name, tag_type = 'normal'):
        sql = "insert into music_tag(music_id, tag_name, tag_type) values (%s, %s, %s)"
        cursor.execute(sql, (music_id, tag_name, tag_type))

    def delete_tag(self, cursor, music_id, tag_name):
        sql = "delete from music_tag where music_id = %s and tag_name = %s"
        cursor.execute(sql, (music_id, tag_name))

    def get_musiclist(self):
        sql = "select music.id, music.name, music.description, array_agg(music_tag.tag_name), array_agg(music_tag.tag_type) from music LEFT OUTER JOIN music_tag on music.id = music_tag.music_id group by music.id order by music.id desc;"
        self.rcursor.execute(sql)
        result = []
        for id, name, description, tag_name, tag_type in self.rcursor.fetchall():
            item = {}
            item['id'] = id
            item['name'] = name
            item['description'] = description
            item['tags'] = []
            for i in range(len(tag_name)):
                if tag_name[i] is None:
                    continue
                tag = {}
                tag['name'] = tag_name[i]
                tag['type'] = tag_type[i]
                item['tags'].append(tag)
            result.append(item)
        return result
    
    def insert_music(self, cursor, name, description):
        sql = 'insert into music (name, description) values (%s, %s) returning id'
        cursor.execute(sql, (name, description))
        return cursor.fetchone()[0]
    
    def update_music(self, cursor, id, name, description):
        sql = 'update music set (name, description) = (%s, %s) where id = %s'
        cursor.execute(sql, (name, description, id))

    def delete_music(self, cursor, music_id):
        sql = 'delete from music where id = %s'
        cursor.execute(sql, (music_id,))

    def get_tags(self, music_id):
        sql = 'select tag_name, tag_type from music_tag where music_id = %s'
        self.rcursor.execute(sql, (music_id,))
        return [{'name': tag_name, 'type': tag_type} for (tag_name, tag_type) in self.rcursor.fetchall()]