from flask import Flask, jsonify, request, render_template, session
from service import Service
from constants.code import Code
import datetime
import sys


if len(sys.argv) > 1 and sys.argv[1] == 'dev':
    app = Flask(__name__, static_folder = "../frontend/dist/static", template_folder = "../frontend/dist")
else:
    app = Flask(__name__, static_folder = "../frontend/stable/static", template_folder = "../frontend/stable")

app.secret_key = b'2T3b{fvhNabY82(0*6d+4d5v;1\9>^Wvo?BwdCWcl=C"82iOF<B)`D*p$XD!k|U('
app.permanent_session_lifetime = datetime.timedelta(days=1)

service = Service()

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/api/musiclist')
def musiclist():
    keyword = request.args.get('kw')
    return jsonify(service.get_musiclist(keyword))
    
@app.route('/api/login', methods = ['POST'])
def login():
    ip = request.remote_addr
    login_data = request.json
    return jsonify(service.login(session, ip, login_data))

@app.route('/api/ping')
def ping():
    return jsonify(service.ping(session))

@app.route('/api/music', methods = ['PUT'])
def updateMusic():
    musicForm = request.json
    if session.get('login'):
        return jsonify(service.updateMusic(musicForm))
    else:
        return jsonify({'code': Code.NOT_LOGIN, 'message': '未登录或登录过期'})

@app.route('/api/music/<id>', methods = ['DELETE'])
def deleteMusic(id):
    musicForm = request.json
    if session.get('login'):
        return jsonify(service.deleteMusic(request.view_args['id']))
    else:
        return jsonify({'code': Code.NOT_LOGIN, 'message': '未登录或登录过期'})

if __name__=="__main__":
    if len(sys.argv) > 1 and sys.argv[1] == 'dev':
        app.run(host="0.0.0.0", port=2858)
    else:
        from waitress import serve
        serve(app, host="0.0.0.0", port=2857)
