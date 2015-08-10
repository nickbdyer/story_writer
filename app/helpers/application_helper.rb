def set_active_line(story, id)
   story.parent_reference = (id == "0") ? id : story.parent_reference + id
  [story.retrieve_line(story.parent_reference), story.collect_child_lines_of(story.parent_reference)]
end

def add_new_line(story, params)
  story.add_line(params["newline"], params["reference"])
  story.parent_reference = "0" if params["reference"] == "0"
  [story.retrieve_line(story.parent_reference), story.collect_child_lines_of(story.parent_reference)]
end
