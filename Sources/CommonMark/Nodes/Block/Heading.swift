import cmark

/**
 A heading.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [4.2 ATX headings](https://spec.commonmark.org/0.29/#atx-headings)
 >
 > An ATX heading consists of a string of characters,
 > parsed as inline content,
 > between an opening sequence of 1–6 unescaped # characters
 > and an optional closing sequence of any number of unescaped # characters.
 > The opening sequence of # characters must be followed by a space
 > or by the end of line.
 > The optional closing sequence of #s must be preceded by a space
 > and may be followed by spaces only.
 > The opening # character may be indented 0-3 spaces.
 > The raw contents of the heading are stripped of leading and trailing spaces
 > before being parsed as inline content.
 > The heading level is equal to the number of # characters
 > in the opening sequence.

 > ## [4.3 Setext headings](https://spec.commonmark.org/0.29/#setext-headings)
 > A setext heading consists of one or more lines of text,
 > each containing at least one non-whitespace character,
 > with no more than 3 spaces indentation,
 > followed by a setext heading underline.
 > The lines of text must be such that,
 > were they not followed by the setext heading underline,
 > they would be interpreted as a paragraph:
 > they cannot be interpretable as a
 > code fence, ATX heading, block quote,
 > thematic break, list item, or HTML block.
 */
public final class Heading: Node {
    required init(_ cmark_node: OpaquePointer) {
        precondition(cmark_node_get_type(cmark_node) == CMARK_NODE_HEADING)
        super.init(cmark_node)
    }

    public var headerLevel: Int {
        get {
            return Int(cmark_node_get_heading_level(cmark_node))
        }

        set { cmark_node_set_heading_level(cmark_node, Int32(newValue)) }
    }
}
