# Week 3 

## Task for the week: 
 - [ ] familiarize the python coding and root file structure.
 - [ ] continue to complete the vx, vy, vz, number of vertices plots. 
 - [ ] learning the meaning of track parameters.
 - [ ] draw d0-z0-plot

### Updates:
 - We do NOT need to switch to 6.20.04 ROOT (the version Alan used for the MadGraph) and stick to the latest version [6.24.02](https://root.cern/releases/release-62402/), 
but with a few changes.
```bash
pip3 install metakernel
apt install libtiff5
``` 

### Jupyter Notebook:
#### vx, vy, vz, number of vertex plot
 1. save the event information from the root file (you can see the meanings of all information from [there](https://docs.google.com/spreadsheets/d/1DkIIGYZ030AijXypR7GjrTkggs8-rWuHoXqmRZy-teg/edit#gid=0))
 2. save the values you want into a list
 3. create a histogram or np.hist for the value and find out the mean and the standard deviation of the list.
 4. define a fitted function or gaussian fit for the graph and find out the mean and the standard deviation of the fitted function. (for number of vertex plot, we don't need a fitted function)
 5. check if the mean and the standard deviation are reasonable. (mean for vx, vy, vz = 0, standard deviation for vz = 55.5, mean for number of vertex < 10) 

![image](https://user-images.githubusercontent.com/72419337/127064404-9986a078-0c14-4743-ac6e-1e2cd7cc0929.png) ![image](https://user-images.githubusercontent.com/72419337/127064142-d7d56d80-2e57-4b0e-bda1-21bfad9d7d33.png)
![image](https://user-images.githubusercontent.com/72419337/127064586-c63d5800-f02e-4ec3-9bbf-58d6ae356efb.png) ![image](https://user-images.githubusercontent.com/72419337/127064925-8d0765fe-b8e9-46b6-9d7d-ea913c876758.png)
![image](https://user-images.githubusercontent.com/72419337/127063894-4a55eefe-38f3-4dc3-8850-d186dd965908.png) ![image](https://user-images.githubusercontent.com/72419337/127063464-1c85cfdf-d4d4-4694-84ce-45d21bb596db.png)
![image](https://user-images.githubusercontent.com/72419337/127063532-67d813fc-f18d-4c67-b0c9-c1d10c3082d2.png) ![image](https://user-images.githubusercontent.com/72419337/127063557-0968788e-3ee2-44af-887e-13647c0c2b05.png)

#### d0-z0-plot
 - if one selects one event and draw the plot with z0 as the horizontal axis and d0 as the vertical axis.
![image](https://user-images.githubusercontent.com/72419337/127067087-d669b02f-ee99-4293-ae3c-f32496ffde45.png)
 - You can find the patterns, where each lines corresponds to a vertex.
 - This week's task is to draw this plot, and, for next week, we will use color to differentiate vertices from one another. 
