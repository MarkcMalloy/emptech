import io
import cv2
import numpy as np
import mediapipe as mp
from flask import Flask, request, jsonify, send_file

from hand_processing_controller import HandProcessor
from paper_processing_controller import PaperController

app = Flask(__name__)
number = 0
@app.route('/upload-image', methods=['POST'])
def upload_image():
    # Load image from request
    file = request.files['file']
    file_bytes = file.read()
    file_array = np.frombuffer(file_bytes, np.uint8)
    image = cv2.imdecode(file_array, cv2.IMREAD_COLOR)

    # Initialize HandProcessor & ScaleProcessor
    scale_processor = PaperController()
    hand_processor = HandProcessor()
    # Detect A4 contour  
    paper_contours = scale_processor.detect_a4_paper(image)    
    # Detect hand landmarks
    hand_landmarks = hand_processor.detect_hand_landmarks(image)                                                                           
    # Draw hand landmarks on image
    drawn_image = paper_contours
    drawn_image = hand_processor.draw_hand_landmarks(hand_landmarks, image)

    # Convert image to JPEG format and return as response
    success, encoded_image = cv2.imencode('.jpg', paper_contours)
    response = encoded_image.tobytes()

    return send_file(io.BytesIO(response), mimetype='image/jpeg')

if __name__ == '__main__':
    app.run(debug=True)
