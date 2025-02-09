# SynthCircuit

Authors: Patrick Kelly, Ian Reyes

## Project Information
**Project Title:** SynthCircuit  
**Team Members:** Patrick Kelly, Ian Reyes  
**Tier Level:** [Beginner/Intermediate/Advanced]  

### Project Description
SynthCircuit is an application that emulates the flow of electricity in a circuit, where wires guide the power to various nodes. These nodes can either manipulate the flow of power or produce sound through different instruments. The result is a visually engaging, dynamic grid that showcases how music can be creatively structured and modified.

---

## Development Log

### **Friday**  
**Goals:**
- Create skeletal structure of UI
- Start on logic for circuit traversal
- Begin design templates for instruments and tools

**Progress:**
- Developed UI layout with designated areas for buttons and tools
- Implemented a moveable grid allowing object placement
- Created mock designs for instrument-note nodes
- Completed logic for circuit traversal using power priority assignment

**Challenges & Solutions:**
1. **Personal Challenge:** Learning Lua and game design was difficult
   - *Solution:* Took a pseudo-role in algorithm development using whiteboards and debugging sessions to learn from peers.

2. **Team Challenge:** Implementing a unidirectional power flow
   - *Solution:* Designed a power queue system and added input/output ports on each node.

**Learnings:**
- Balancing collaboration and individual work is key
- Debugging requires multiple perspectives
- Writing algorithms in pseudocode prevents logical errors

**AI Usage:** None  
**Tools Used & Purpose:** TBD

---

### **Saturday**  
**Goals:**
- Enable nodes to play notes, wires to show power flow, and implement a halt tool
- Allow multiple note layers for depth
- Start designing art for instruments and nodes

**Progress:**
- Shifted from a set keyboard UI to individual note nodes
- Corrected pitch manipulation using a scale and a single note MP3 file
- Integrated custom-designed art for instruments and tools
- Finalized a dark UI theme with vibrant contrasting nodes/wires
- Implemented chord selection with data carried via cursor for placement

**Challenges & Solutions:**
1. **Nested arrays complexity**
   - *Solution:* Used a whiteboard to map out relationships for debugging

2. **Pitch tuning for realistic sound**
   - *Solution:* Adjusted the pitch scale manually to achieve accuracy

**Learnings:**
- Avoid complex nested data structures for easier debugging
- UI should remain flexible and adaptable
- Dynamic changes must be accounted for in future iterations

**AI Usage:** None  
**Tools Used & Purpose:** TBD

---

### **Sunday**  
**Goals:**
- Finalize UI design
- Add sound effects (reverb, echo, etc.)
- Create a demo for submission

**Progress:**
- Implemented UI for input/output port manipulation
- Fixed tool symbol inconsistencies
- Designed title art for the project
- Deferred sound effects for post-hackathon development

**Challenges & Solutions:**
1. **Handling out-of-bounds occurrences**
   - *Solution:* Established constraints and user permissions within boundaries

2. **Resolution-dependent button design**
   - *Solution:* Enforced fullscreen mode to standardize resolution settings

**Learnings:**
- Consider screen size variations for different devices
- Fault tolerance is essential for debugging
- Clear communication and team inclusion enhance project success
- Most importantly, have fun!

**AI Usage:** None  
**Tools Used & Purpose:** TBD

