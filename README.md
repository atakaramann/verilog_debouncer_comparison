## Verilog Hardware Debouncer — Two Implementations

**Tools:** Quartus / ModelSim  
**Language:** Verilog HDL  

---

## What is Debouncing?

Mechanical switches produce noisy transitions (contact bounce)
lasting ~5–50ms.

<pre>
Ideal:    0000 | 111111  
               ↑ button press
              
Reality:  0000 | 101101011111 
               ↑ button press (with bounce)
</pre>

Debouncing ensures a single clean transition.

---

## Implementations

Two different hardware approaches are implemented:

- **debouncer1.v — Shift Register Based**
  - Requires consecutive stable samples
  - More conservative filtering
  - Adds small delay

- **debouncer2.v — Lock-out Timer Based**
  - Accepts first edge immediately
  - Ignores input for a short period (lock window)
  - Faster response

---

## Comparison

- Shift register → waits for stability  
- Lock-out → accepts first change, ignores the rest  

| Feature | debouncer1 | debouncer2 |
|--------|------------|------------|
| Approach | Sampling | Lock-out |
| Response | Delayed | Immediate |

---

## Key Concepts
- Contact bounce
- Shift register filtering
- Lock-out debouncing
- Synchronous design
