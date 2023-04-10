import cv2
import numpy as np
from flask import Flask, jsonify, request, make_response

app = Flask(__name__)

@app.route('/api', methods=['GET'])
def get():
    # TODO: Implement GET functionality
    return jsonify({'message': 'GET response'})

@app.route('/upload', methods=['POST'])
def upload_image():
    # Read image from request
    file = request.files['file']
    file_bytes = file.read()
    file_array = np.frombuffer(file_bytes, np.uint8)
    image = cv2.imdecode(file_array, cv2.IMREAD_COLOR)

    # Process the image using OpenCV
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (7, 7), 0)
    canny = cv2.Canny(blur, 50, 150)
    contours, _ = cv2.findContours(canny, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    # Draw contours on image
    result = cv2.drawContours(image.copy(), contours, -1, (0, 255, 0), 3)

    # Convert result to JPEG and return it in the response
    success, result_buf = cv2.imencode('.jpg', result)
    if not success:
        return jsonify({'message': 'Failed to encode result as JPEG'}), 500
    response = make_response(result_buf.tobytes())
    response.headers.set('Content-Type', 'image/jpeg')
    return response

if __name__ == '__main__':
    app.run(debug=True)
