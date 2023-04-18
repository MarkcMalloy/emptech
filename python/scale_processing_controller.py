import cv2
import numpy as np
from paper_detector import PaperDetector

class ScaleProcessor:
    def __init__(self):
        # Initialize PaperDetector
        self.paper_detector = PaperDetector()
        # Initialize Corner Detection Module

        # Set default values for A4 paper size in mm
        self.a4_width_mm = 210
        self.a4_height_mm = 297
        self.detect_a4_paper()

    def detect_a4_paper(self, image):
         paper_result = self.paper_detector.find_a4_contour(image_path="../assets/antonio(1).jpg")
         
        
    def calculate_scale_resolution(self, image):
        # Detect A4 paper contour
        a4_contour = self.detect_a4_paper(image)

        if a4_contour is not None:
            print("Found an A4 contour!")
            # Calculate A4 paper width and height in pixels
            a4_width_pixels = np.linalg.norm(a4_contour[0] - a4_contour[1])
            a4_height_pixels = np.linalg.norm(a4_contour[1] - a4_contour[2])

            # Calculate scale resolution in mm per pixel
            scale_resolution_x_mm_per_pixel = self.a4_width_mm / a4_width_pixels
            scale_resolution_y_mm_per_pixel = self.a4_height_mm / a4_height_pixels
            print('The A4 width is ' + str(a4_contour[0] - a4_contour[1]) + ' pixels long')
            return scale_resolution_x_mm_per_pixel, scale_resolution_y_mm_per_pixel
        print("Didnt find shit")
        return None