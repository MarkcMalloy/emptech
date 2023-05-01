import math
import numpy as np
import mediapipe as mp
import cv2


class HandProcessor:
    def __init__(self):
        self.mp_hands = mp.solutions.hands
        self.hands = self.mp_hands.Hands(min_detection_confidence=0.5, min_tracking_confidence=0.5)

    def detect_hand_landmarks(self, image):
        image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = self.hands.process(image_rgb)
        return results.multi_hand_landmarks

    def draw_hand_landmarks(self, hand_landmarks, image, mm_per_pixel):
        drawn_image = np.copy(image)
        if hand_landmarks:
            for hand_lm in hand_landmarks:
                for idx, lm in enumerate(hand_lm.landmark):
                    h, w, _ = image.shape
                    cx, cy = int(lm.x * w), int(lm.y * h)
                    cv2.circle(drawn_image, (cx, cy), 5, (255, 0, 0), cv2.FILLED)

                # Draw distances as text on image
                for i in range(len(hand_lm.landmark) - 1):
                    x1, y1 = int(hand_lm.landmark[i].x * w), int(hand_lm.landmark[i].y * h)
                    x2, y2 = int(hand_lm.landmark[i + 1].x * w), int(hand_lm.landmark[i + 1].y * h)
                    distance = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
                    distance = distance * mm_per_pixel
                    cx = (x1 + x2) // 2
                    cy = (y1 + y2) // 2
                    cv2.putText(drawn_image, f'{distance:.2f} mm', (cx, cy), cv2.FONT_HERSHEY_SIMPLEX, 1.1,
                                (255, 0, 0), 2, cv2.LINE_AA)
        return drawn_image

    def calculate_distance(self, image, hand_landmarks):
        if not hand_landmarks:
            return None

        # Get coordinates of landmarks
        landmarks = []
        for hand_lm in hand_landmarks:
            for idx, lm in enumerate(hand_lm.landmark):
                h, w, _ = image.shape
                cx, cy = int(lm.x * w), int(lm.y * h)
                landmarks.append([cx, cy])

        # Calculate distance between landmarks
        distance = 0
        for i in range(len(landmarks) - 1):
            x1, y1 = landmarks[i]
            x2, y2 = landmarks[i + 1]
            distance += math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

        return distance