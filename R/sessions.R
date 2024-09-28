create_courses <- function(name) {

  # new courses
  from_courses <- here::here("courses", "00-template")
  to_courses <- here::here("courses", name)
  dir.create(to_courses)
  file.copy(list.files(from_courses, full.names = TRUE),
            to_courses,
            recursive = TRUE)
  
  index <- readLines(here::here("courses", name, "index.qmd"))
  index_new_links <- gsub("UPDATE-DIR-NAME", name, index)
  writeLines(index_new_links, here::here("courses", name, "index.qmd"))

}

delete_session <- function(name) {
  courses <- here::here("courses", name)
  
  unlink(courses, recursive = TRUE)
}

