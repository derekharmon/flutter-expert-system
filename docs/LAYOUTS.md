# Layouts

This document describes the layout mock-ups to be implemented for the **expert system** using Flutter. Additionally, it gives you a brief description of their purpose and intended interaction(s) with the user.

## YesNoLayout

![YesNoLayout mock-up](https://github.com/derekharmon/flutter_expert_system/raw/master/docs/layouts/YesNoLayout.png)

`YesNoLayout` is used in many places throughout the application where only a _Yes_ or _No_ answer is necessary from the user.

This may be abbreviated `YNLayout` to save space.

## TypeInLayout

![TypeInLayout mock-up](https://github.com/derekharmon/flutter_expert_system/raw/master/docs/layouts/TypeInLayout.png)

`TypeInLayout` is used when soliciting a new question from the user to train the **expert system**. They must enter the question using their mobile device's virtual keyboard. The new question must have a _Yes_ or _No_ answer, but otherwise can be freely-formulated.

All `TypeInLayout`s may be replaced by `SpeechLayout`s time-permitting, and if speech recognition works reliably enough. I believe training the **expert system** by typing-in all of the questions it needs to learn is fine at the Prototype stage, but using the mobile device's speech-to-text capabilities can provide a more productive user experience. 

This may be abbreviated `TypLayout` to save space.

## SpeechLayout

![SpeechLayout mock-up](https://github.com/derekharmon/flutter_expert_system/raw/master/docs/layouts/SpeechLayout.png)

`SpeechLayout` is an alternative method for user input of new questions for the **expert system** to learn. The app will prompt the user to supply a _Yes_ or _No_ question in the central Text region of the screen, then a beep will signal the user that their Microphone is listening, the user can provide a question that will be parsed by the device's speech recognition library into text, and there will be a bong after a pause in the user's utterance. A `YesNoLayout` will always follow to confirm that the app has the correct transcription of the question.

It may be a good idea to include a floating action button in the lower right corner to let the user control mute the Microphone, since now may not be a good time for the user to speak to their device.

It is a goal to replace `TypeInLayout`s with `SpeechLayout`s to improve the user experience when training the **expert system**.

This may be abbreviated `SpeLayout` to save space.
