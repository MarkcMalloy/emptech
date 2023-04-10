from flask import Flask, jsonify, request

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
    file_size = len(file.read())
    file.seek(0)  # Reset file pointer to beginning of file
    file.save('uploaded_image.jpg')
    return jsonify({'message': f'Image uploaded successfully ({file_size} bytes)'})


if __name__ == '__main__':
    app.run(debug=True)
