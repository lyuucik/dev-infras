from http.server import HTTPServer, BaseHTTPRequestHandler
import sys

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/hello':
            self.send_response(200)
            self.send_header('Content-Type', 'text/plain')
            self.end_headers()
            self.wfile.write(b'Hello World')
        else:
            self.send_response(404)
            self.end_headers()
    
    def log_message(self, format, *args):
        sys.stdout.write("%s - - [%s] %s\n" %
                        (self.address_string(),
                         self.log_date_time_string(),
                         format % args))
        sys.stdout.flush()

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 80), Handler)
    print('Server running on port 80')
    server.serve_forever()
