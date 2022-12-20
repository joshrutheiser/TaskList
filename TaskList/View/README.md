# Learning

## Creating Complete Button Animation

1. How to chain swift animations?
The experience needs to perform a multi-step animation that first grows the size of the circle, then fills the circle with a checkmark, and finally, reduces the size of the circle back to the original size. Following the completion of the animation is when the task complete function is called.

One approach is to use delays to sequence each animation. Dispatch queue, timers, or delay modifiers can be used. I landed on using the delay modifier for the animation stages and then dispatch queue syncAfter parameter to call model changes and to reset the view once the animation completes.

2. Should I use a Button or Circle to create the complete checkmark?

I decided to just use the circle icon as it simplifies the code. If I went with circle, I would need to have separate circles for stroke and fill since both modifiers can't be applied to the same circle. Using Button doesn't simplify things and adds unecessary additional code. Simply using the on tap gesture with the Image is sufficient.






For reference:
https://www.markdownguide.org/basic-syntax/
