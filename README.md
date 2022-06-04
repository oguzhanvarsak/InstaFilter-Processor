# InstaFilter-Processor (Accepted with 8.5/9)
UoT - Introduction To Swift Programming Completion Assignment 

## Review criteria
To evaluate your peers in the best way possible, you should briefly review the work of your peers using the buttons near the top of this screen before giving scores and feedback on any of them. This will help open your eyes to what others have done.

You will be asked to provide feedback to your peers in the following areas:

Does the playground code apply a filter to each pixel of the image? Maximum of 2 pts

Are there parameters for each filter formula that can change the intensity of the effect of the filter? Maximum of 3 pts

Is there an interface to specify the order and parameters for an arbitrary number of filter calculations that should be applied to an image? Maximum of 2 pts

Is there an interface to apply specific default filter formulas/parameters to an image, by specifying each configuration’s name as a String? Maximum of 2 pts

## Instructions
Your Playground code should fulfill the following project requirements:

Be able to apply a filter formula to each pixel of the image.

The formula should have parameters that can be modified so that the filter can have a small or large effect on the image.

Be able to apply several different filters to the image, in a specific order (e.g. a ‘pipeline of filters’). These could be different formulas (e.g. brightness vs. contrast) or could be the same formula with different parameters.

Have some method or interface to apply default filter formulas and parameters that can be accessed by name.

The fun part is that you may decide for yourself exactly what type of calculations you would like to apply to the image pixels – e.g. brightness, contrast, gray-scale, etc. You may want to look up more advance calculations on the Internet for ideas. But a simple formula like the one covered in the Image Processing lecture is fine.

You must also decide on the exact architecture of the ‘app'. Try to break up the code into logical functional parts using structs and classes, wherever you think it’s most appropriate. To get you started, we recommend you think about implementing an ImageProcessing class/struct that can manage and apply your Filter class/struct instances to the image.

STEP 1: We provide an image and starter code

• In this assignment we are providing the starter code. 

• Download the starter project (download link will be provided in the peer assessment section)

STEP 2: Create a simple filter

• Start by writing some code to apply a basic filter formula to each pixel in the image and test it.

STEP 3: Create the image processor

• Encapsulate your chosen Filter parameters and/or formulas in a struct/class definition.

• Create and test an ImageProcessor class/struct to manage an arbitrary number Filter instances to apply to an image. It should allow you to specify the order of application for the Filters.

STEP 4: Create predefined filters

• Create five reasonable default Filter configurations (e.g. "50% Brightness”, “2x Contrast”), and provide an interface to access instances of such defaults by name. (e.g. could be custom subclasses of a Filter class, or static instances of Filter available in your ImageProcessor interface, or a Dictionary of Filter instances). There is no requirement to do this in a specific manner, but it’s good to think about the different ways you could go about it.

STEP 5: Apply predefined filters

• In the ImageProcessor interface create a new method to apply a predefined filter giving its name as a String parameter. The ImageProcessor interface should be able to look up the filter and apply it.

SUBMISSION: Zip your .playground file and upload it to your submission. Your peer reviewers will download your zipped file and test in their playground.  TIP: Playgrounds are a safe space, they can only access the files within the playground (you cannot access files outside of the playground).   
