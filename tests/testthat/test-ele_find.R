if (0) {
    library(curlR)

    port = 4444
    kill_selenium(port)
    p <- init_selenium(port)

    p %>% go("https://cn.bing.com/")
    getElementByName(p, "q") %>% ele_fillText("curlR", key = "enter")
    # getElementByName(p, "go") %>% ele_click()

    # GET ALL results
    xs = ele_find_all(p, "//ol/li")

    # GET the first result
    x = ele_find_first(p, "//ol/li")
    a = ele_child(x, "//a") # get link
    a %>% clickElement()
    # if page changed, previous node will be destroyed
}
