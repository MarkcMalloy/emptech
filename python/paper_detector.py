import cv2
import numpy as np
class PaperDetector:
    def __init__(self):
        # Set default values for A4 paper size in mm
        self.a4_width_mm = 210
        self.a4_height_mm = 297        
        
    def find_a4_contour(self, image_path):
        # Load the image
        image = cv2.imread(image_path)

        # Convert to grayscale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # Thresholding
        ret, binary = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)

        # Contour detection
        contours, hierarchy = cv2.findContours(binary, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        # Filter contours based on area
        min_area = 70000
        max_area = 5000000
        filtered_contours = []
        for contour in contours:
            area = cv2.contourArea(contour)
            if area > min_area and area < max_area:
                filtered_contours.append(contour)

        # Draw bounding boxes around detected contours
        for contour in filtered_contours:
            x, y, w, h = cv2.boundingRect(contour)
            cv2.rectangle(image, (x, y), (x + w, y + h), (0, 255, 0), 2)
            # Top left corner: x,y
            # Top right corner: x+w,y
            # Bottom left corner: x,y+h
            # Bottom right corner: x+w, y+h
            cv2.circle(image, (x, y), 6, (0, 0, 255), -1)
            cv2.circle(image, (x+w, y), 6, (0, 0, 255), -1)
            cv2.circle(image, (x, y+h), 6, (0, 0, 255), -1)
            cv2.circle(image, (x+w, y+h), 6, (0, 0, 255), -1)

            cv2.imshow('Corners', image)
            cv2.waitKey(2500)
            
            # Find corners using goodFeaturesToTrack
            roi_gray = gray[y:y + h, x:x + w]  # Extract the ROI from the grayscale image
            corners = cv2.goodFeaturesToTrack(roi_gray, 4, 0.01, 10)
            corners = np.int0(corners)

            # Draw corners on the image
            for corner in corners:
                count = count + 1
                cx, cy = corner.ravel()
                cx += x # Add ROI offset to get the correct corner coordinates in the original image
                cy += y
                cv2.circle(image, (cx, cy), 6, (0, 0, 255), -1)

        # Display or save the results
        cv2.imshow('Binary', binary)
        cv2.waitKey(0)
        cv2.imshow('Detected White Paper', image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()