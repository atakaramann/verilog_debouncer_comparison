## Verilog Hardware Debouncer — Two Implementations

**Tools:** Quartus / ModelSim  
**Language:** Verilog HDL  

---

## What is Debouncing?

Mechanical switches produce noisy transitions (contact bounce) 
lasting ~5–50ms.


Ideal: 0000|111111
Reality: 0000|101101011111


Debouncing removes this noise and ensures a single clean transition.

---

## Implementation 1 — Shift Register (debouncer1.v)

### Working
Samples input each clock and stores last 4 values:


shift_reg = {shift_reg[2:0], sw_out}


Output updates only if all samples match:
- `1111` → HIGH  
- `0000` → LOW  
- else → hold  

### Notes
- Simple design  
- Delay = 4 clock cycles  
- Needs stable input  

---

## Implementation 2 — Lock-out Timer (debouncer2.v)

### Working
On input change:
1. Output updates immediately  
2. Lock activated (`4'b1111`)  
3. Lock shifts out over 4 cycles  


locked = |lock_reg


### Notes
- Instant response  
- Ignores input during lock  
- Better for fast signals  

---

## Comparison

| Feature | debouncer1 | debouncer2 |
|--------|------------|------------|
| Method | Sampling | Lock-out |
| Response | Delayed | Immediate |
| Noise handling | Stable window | Ignore period |
| Complexity | Low | Medium |

---

## Key Concepts

- Contact bounce  
- Shift register filtering  
- Lock-out debouncing  
- Synchronous design  
