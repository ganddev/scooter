# README

## Task
It is expected to find the smalles amount of fleet engineers for a given amount of scooters in district. Theerfor it is expected to create a API or CLI tool.

### Restrictions
One fleet engineer or fleet manager can only work in one district.

### Example inputparams
There the following values are give:
- Array of integers which represents the number if scooters in a district.
- Number of scooters which a fleet engineer can work on
- Number of scooters which a fleet manager can work on

Example for input parameters.
```json
{
  'scooters': [15, 10],
  'c': 12,
  'p': 5
}
```
### Expected output
```json
{
  'fleet_engineers': 3
}
```
## Solution
The task is solved with an small rails app and the usage of grape. This enables developers to build an API on top of rails. The API excepts the input parameters and return an output in json format as described above. The heart of the application is the class which calculates the smallest number of need fleet engineers. It is placed in the folder `services/fleet_engineers_calculator.rb`. Related tests are place in `spec/services/fleet_engineers_calculator.rb`. All other parts for the API are placed under `api/api`.

### HOW to run the soltuion
1. Ensure you have docker and curl installed
2. Run the following command from the root folder of the project
```bash
docker build -t scooter .
```
3. After build is completed run command
```bash
docker run -d -p 3000:3000 scooter
```
4. Fire request against the API like
```bash
curl -X POST "http://localhost:3000/fleet_engineers/min" -H "accept: application/json" -H "Content-Type: application/json" -d '{"scooters":[12,13],"c":12,"p":5}'
```



