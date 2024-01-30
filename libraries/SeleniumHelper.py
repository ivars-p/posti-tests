from robot.libraries.BuiltIn import BuiltIn


def get_webelements_child(parent_element, child_locator):
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    return selenium_lib.find_element(child_locator, parent=parent_element)
