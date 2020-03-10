import http.server
import socketserver
from http import HTTPStatus
from redis import Redis

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        value = redis.incr("hello")
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(f'Hello world #{value}'.encode())

redis = Redis(host='redis-server', port=6379, db=0)
httpd = socketserver.TCPServer(('', 8000), Handler)
httpd.serve_forever()