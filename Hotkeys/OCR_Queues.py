import cv2
import re
import numpy as np
import pyautogui
import pytesseract
import clipboard
import sys

def find_color_region(img, color, tolerance=10):
    target_color = np.uint8([[color]])
    hsv_target_color = cv2.cvtColor(target_color, cv2.COLOR_BGR2HSV)[0, 0]

    lower_bound = np.array([hsv_target_color[0] - tolerance, 50, 50])
    upper_bound = np.array([hsv_target_color[0] + tolerance, 255, 255])

    hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    mask = cv2.inRange(hsv_img, lower_bound, upper_bound)
    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    max_area = 0
    max_rect = None
    for cnt in contours:
        area = cv2.contourArea(cnt)
        if area > max_area:
            max_area = area
            max_rect = cv2.boundingRect(cnt)

    return max_rect

def capture_and_extract_text(img, rect):
    x, y, w, h = rect
    cropped_img = img[y:y+h, x:x+w]
    config = '-l eng --psm 6 --oem 3'
    text = pytesseract.image_to_string(cropped_img, config=config)
    extracted_text = re.sub(r'[^A-Za-z0-9&+\ ]+', '', text)
    extracted_text = extracted_text.replace('&', 'and').replace('+', 'plus')
    return extracted_text.strip()

def main():
    target_color = (228, 78, 215)  # Color code e44ed7 in BGR format

    screenshot = pyautogui.screenshot()
    img = cv2.cvtColor(np.array(screenshot), cv2.COLOR_RGB2BGR)
    rect = find_color_region(img, target_color)

    #img = cv2.resize(img, None, fx=0.5, fy=0.5)
    #img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    #img = cv2.GaussianBlur(img, (5, 5), 0)

    if rect:
        x, y, w, h = rect
        cropped_img = img[y:y+h, x:x+w]
        
        extracted_text = capture_and_extract_text(img, rect)
        
        # Copy text to clipboard
        clipboard.copy(extracted_text)

        # Use pyautogui to type the extracted text
        pyautogui.typewrite(extracted_text)

        # Close the program
        sys.exit(0)

if __name__ == "__main__":
    main()
