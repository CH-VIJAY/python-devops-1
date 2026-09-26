from flask import Flask, jsonify, request
import os
app = Flask(__name__)
VERSION = os.getenv("APP_VERSION", "1.0.0")
@app.route('/')
def home():
    return jsonify({"message": "Hello from Python Application", "version": VERSION})
@app.route('/api/v1/<int:num>', methods=['GET'])
def health():
    return jsonify({"Status": "Active"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
