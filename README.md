# DataMiningProject

This the part of the final project for my Data Mining class. It was a group project and I have only included the code that I contributed. We found this dataset on Kaggle.


## Description of Problem

College students were given videos to watch, videos which would confuse a typical college student, and videos which would not confuse a typical college student. While viewing the videos, students wore a single-channel MindSet device to measure frontal lobe brain activity. Concluding the video, the students measured his or hers confusion level. Given this problem, we would like to predict if a student is experiencing confusion based on their repspective brain activity.


## Research/Project Question

Which statistical predictive model would be able to classify most accurately an individual as being confused based on his/hers respected brain activity data?


## Data for Models

Response Variable: 
      user.definedlabeln - whether the subject is actually confused.

Predictor Variables:
      VideoID,
      Attention: measured as the proprietary measure of mental focus,
      Mediation: measured as the proprietary measure of calmness,
      Raw: the raw EEG signal,
      Delta: 1-3 Hz of power spectrum,
      Theta: 4-7 Hz of power spectrum,
      Alpha1: Lower 8-11 Hz of power spectrum,
      Aplha2: Higher 8-11 Hz of power spectrum,
      Beta1: Lower 12-29 Hz of power spectrum,
      Beta2: Higher 12-29 Hz of power spectrum,
      Gamma1: Lower 30-100 Hz of power spectrum,
      Gamma2: Higher 30-100 Hz of power spectrum
 
 
Note: The original dataset included two other variables; SubjectID and predefinedlabel- whether the subject is expected to be confused. SubjectID was removed because it has no effect on whether an individual is confused or not. The predefinedlabel variable was removed because we wanted to answer our project question and classify confusion of a person soley based on brain activity data, not a predetermined outcome deduced from the videos a student was watching.


## Supervised Learning

Since this dataset includes true measures of student confusion, this project will utilize supervised learning to predict whether a student is confused or not.


## Classification

This will be a classification problem since the outcome variable is binary. The student is either confused or they are not.
