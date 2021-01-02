/*
// EDITED BY SAM FRISCH //

Name: Akshath Jain
Date: 3/15/19
Purpose: define the CheckboxGroup object
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/grouped_buttons/blob/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';

class CheckboxGroup_edit extends StatefulWidget {
  /// A list of strings that describes each Checkbox. Each label must be distinct.
  final List<String> labels;

  /// Specifies which boxes to be automatically check.
  /// Every element must match a label.
  /// This is useful for clearing all selections (set it to []).
  /// If this is non-null, then the user must handle updating this list; otherwise, the state of the CheckboxGroup won't change.
  final List<String> checked;

  /// Specifies which boxes should be disabled.
  /// If this is non-null, no boxes will be disabled.
  /// The strings passed to this must match the labels.
  final List<String> disabled;

  /// Called when the value of the CheckboxGroup changes.
  final void Function(bool isChecked, String label, int index) onChange;

  /// Called when the user makes a selection.
  final void Function(List<String> selected) onSelected;

  /// The style to use for the labels.
  final TextStyle labelStyle;

  /// Specifies the orientation to display elements.

  /// Called when needed to build a CheckboxGroup element.
  final Widget Function(Checkbox checkBox, Text label, int index) itemBuilder;

  //THESE FIELDS ARE FOR THE CHECKBOX

  /// The color to use when a Checkbox is checked.
  final Color activeColor;

  /// The color to use for the check icon when a Checkbox is checked.
  final Color checkColor;

  /// If true the checkbox's value can be true, false, or null.
  final bool tristate;

  //SPACING STUFF

  /// Empty space in which to inset the CheckboxGroup.
  final EdgeInsetsGeometry padding;

  /// Empty space surrounding the CheckboxGroup.
  final EdgeInsetsGeometry margin;

  final bool singleSelection;

  CheckboxGroup_edit({
    Key key,
    @required this.labels,
    this.checked,
    this.disabled,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    this.activeColor, //defaults to toggleableActiveColor,
    this.checkColor = const Color(0xFFFFFFFF),
    this.tristate = false,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.singleSelection = false,
  }) : super(key: key);

  @override
  _CheckboxGroup_editState createState() => _CheckboxGroup_editState();
}

class _CheckboxGroup_editState extends State<CheckboxGroup_edit> {
  List<String> _selected = [];
  bool isChecked1 = false;
  bool isChecked2 = false;
  int lastSelected = -1;

  @override
  void initState() {
    super.initState();

    //set the selected to the checked (if not null)
    _selected = widget.checked ?? [];
  }

  void onChanged(bool isChecked, int i) {
    bool isAlreadyContained = _selected.contains(widget.labels.elementAt(i));

    if (mounted) {
      setState(() {
        if (!isChecked && isAlreadyContained) {
          _selected.remove(widget.labels.elementAt(i));
        } else if (isChecked && !isAlreadyContained) {
          _selected.add(widget.labels.elementAt(i));
        }

        if (widget.onChange != null)
          widget.onChange(isChecked, widget.labels.elementAt(i), i);
        if (widget.onSelected != null) widget.onSelected(_selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //set the selected to the checked (if not null)
    if (widget.checked != null) {
      _selected = [];
      _selected.addAll(widget.checked); //use add all to prevent a shallow copy
    }

    List<Widget> content = [];

    for (int i = 0; i < widget.labels.length; i += 2) {
      Checkbox cb1 = Checkbox(
        value: _selected.contains(widget.labels[i]),
        onChanged: (widget.disabled != null &&
                widget.disabled.contains(widget.labels.elementAt(i)))
            ? null
            : (bool isChecked) {
                isChecked1 = isChecked;
                onChanged(isChecked, i);
              },
        checkColor: widget.checkColor,
        activeColor:
            widget.activeColor ?? Theme.of(context).toggleableActiveColor,
        tristate: widget.tristate,
      );

      Text t1 = Text(widget.labels[i], style: widget.labelStyle);

      if (i + 1 <= widget.labels.length) {
        Checkbox cb2 = Checkbox(
          value: _selected.contains(widget.labels[i + 1]),
          onChanged: (widget.disabled != null &&
                  widget.disabled.contains(widget.labels.elementAt(i + 1)))
              ? null
              : (bool isChecked) {
                  isChecked2 = isChecked;
                  onChanged(isChecked, i + 1);
                },
          checkColor: widget.checkColor,
          activeColor:
              widget.activeColor ?? Theme.of(context).toggleableActiveColor,
          tristate: widget.tristate,
        );

        Text t2 = Text(widget.labels[i + 1], style: widget.labelStyle);

        content.add(Row(children: <Widget>[
          SizedBox(width: 12.0),
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                if (widget.singleSelection) {
                  if (lastSelected != i)
                    isChecked1 = true;
                  else {
                    lastSelected = i;
                    isChecked1 = !isChecked1;
                  }
                  lastSelected = i;
                  onChanged(isChecked1, i);
                } else {
                  bool isChecked = false;
                  if (!_selected.contains(widget.labels.elementAt(i))) {
                    isChecked = true;
                  }
                  onChanged(isChecked, i);
                }
              },
              child: Row(
                children: [
                  cb1,
                  SizedBox(width: 12.0),
                  t1,
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                if (widget.singleSelection) {
                  if (lastSelected != i + 1)
                    isChecked2 = true;
                  else {
                    lastSelected = i + 1;
                    isChecked2 = !isChecked2;
                  }
                  lastSelected = i + 1;
                  onChanged(isChecked2, i + 1);
                } else {
                  bool isChecked = false;
                  if (!_selected.contains(widget.labels.elementAt(i + 1))) {
                    isChecked = true;
                  }
                  onChanged(isChecked, i + 1);
                }
              },
              child: Row(
                children: [
                  cb2,
                  SizedBox(width: 12.0),
                  t2,
                ],
              ),
            ),
          ),
        ]));
      } else {
        content.add(InkWell(
          onTap: () {
            if (widget.singleSelection) {
              if (lastSelected != i)
                isChecked1 = true;
              else {
                lastSelected = i;
                isChecked1 = !isChecked1;
              }
              lastSelected = i;
              onChanged(isChecked1, i);
            }
          },
          child: Row(children: <Widget>[
            SizedBox(width: 12.0),
            cb1,
            SizedBox(width: 12.0),
            t1,
          ]),
        ));
      }
    }

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: Column(children: content),
    );
  }
}
