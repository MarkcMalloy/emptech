import cv2
import mediapipe as mp


class HandProcessor:
    def __init__(self):
        self.mp_hands = mp.solutions.hands
        self.hands = self.mp_hands.Hands(max_num_hands=1)
        self.mp_drawing = mp.solutions.drawing_utils
        self.hand_landmarks = None

    def process_image(self, image):
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = self.hands.process(image)
        if results.multi_hand_landmarks:
            self.hand_landmarks = results.multi_hand_landmarks[0]

    def draw_hand_landmarks(self, image):
        if self.hand_landmarks:
            for finger_name, finger_connections in mp.solutions.hands.HAND_CONNECTIONS.items():
                for idx, conn in enumerate(finger_connections):
                    finger_conns = conn
                    x1, y1 = self.hand_landmarks.landmark[finger_conns[0]].x, self.hand_landmarks.landmark[
                        finger_conns[0]].y
                    x2, y2 = self.hand_landmarks.landmark[finger_conns[1]].x, self.hand_landmarks.landmark[
                        finger_conns[1]].y
                    x1, y1 = int(x1 * image.shape[1]), int(y1 * image.shape[0])
                    x2, y2 = int(x2 * image.shape[1]), int(y2 * image.shape[0])
                    cv2.line(image, (x1, y1), (x2, y2), (255, 0, 0), 2)


def detect_hand_landmarks(self, image):
    results = self.hands.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
    if results.multi_hand_landmarks:
        return results.multi_hand_landmarks[0]
    else:
        return None
