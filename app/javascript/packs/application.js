import "bootstrap";
import "components/navbar";
import "packs/plugin/profile.js";

import { initLikedRecipeNav } from "components/init_like_recipe_nav";
import { display_add_or_random } from '../components/add_or_random';
import { display_title } from '../components/planner_title';
import { display_searchbar } from '../components/searchbar_index_recipe.js';
import { display_filter } from '../components/searchbar_index_recipe.js';
import { navBackChangeWithScrollPos } from '../components/navbar_back_bgchange_with_scrollpos';
import { changeClassWhenSelect } from '../components/multiselect_searchbox';
import { addFiltersToSearch } from '../components/add_search_to_searchbox';


display_title();
display_searchbar();
display_filter();
initLikedRecipeNav();


//  window.onload = function(){
//    setTimeout(display_add_or_random, 5000)
// };

display_add_or_random();
navBackChangeWithScrollPos();

changeClassWhenSelect();

addFiltersToSearch();

