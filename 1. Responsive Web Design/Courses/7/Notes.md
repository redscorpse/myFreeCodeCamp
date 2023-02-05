- The `rem` unit stands for `root em`, and is relative to the font size of the `html` element.
- New CSS properties:
	- `justify-content:` `space-between` / `flex-end`
  - `align-items: flex-end;`

---
- The `:not` pseudo-selector can be used to select all elements that do not match the given CSS rule.
```css
div:not(#example) {
  color: red;
}
```
The above selects all `div` elements without an `id` of `example`.