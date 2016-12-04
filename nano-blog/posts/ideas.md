# IDEAS


## Engine ##

#### Rendering ####
- Render engine holds all constant render state (textures, models, etc) 
- Render `packets` are recieved, and translated into batched drawing instructions


#### Events / UI ####
- pass cinder / system events to engine
- Engine event system processes those events and delegates to interested entities or systems
- **EXAMPLE**: mouse/touch down, move, and up
- Events can also be messages between systems

#### Jobs ####
- Systems create jobs
- Jobs can spawn new jobs & wait for child jobs to complete before completing
- Fibers?
