import np as np
from flask import Flask, jsonify, request, cv2

app = Flask(__name__)


@app.route('/api', methods=['GET'])
def get():
    # TODO: Implement GET functionality
    return jsonify({'message': 'GET response'})



@app.route('/upload', methods=['POST'])
## In this code:
#  we're accessing the image field from the request.files object and saving it to disk
#  using the save method of the file object.
#  Note that you should validate the file contents and handle
#  any errors that may occur when working with uploaded files.
def upload_image():
    file = request.files['file']
    file_bytes = file.read()
    file_array = np.frombuffer(file_bytes, np.uint8)
    image = cv2.imdecode(file_array, cv2.IMREAD_COLOR)
    # Process the image using OpenCV here
    # ...
    cv2.imwrite('processed_image.jpg', image)
    return jsonify({'message': 'Image processed and saved successfully'})


if __name__ == '__main__':
    app.run(debug=True)
