import "bootstrap";
import "components/navbar";
import "packs/plugin/profile.js";

import { initLikedRecipeNav } from "components/init_like_recipe_nav";
import { display_add_or_random } from '../components/add_or_random';
import { display_title } from '../components/planner_title';
import { display_searchbar } from '../components/searchbar_index_recipe';
import { display_filter } from '../components/searchbar_index_recipe.js';
import { navBackChangeWithScrollPos } from '../components/navbar_back_bgchange_with_scrollpos';
import { changeClassWhenSelect } from '../components/multiselect_searchbox';
import { addFiltersToSearch } from '../components/add_search_to_searchbox';
import { update_servings } from '../components/recipe_servings';
import { update_servings_planner } from '../components/recipe_servings_planner';

display_title();
display_searchbar();
display_filter();
initLikedRecipeNav();
display_add_or_random();
navBackChangeWithScrollPos();
changeClassWhenSelect();
addFiltersToSearch();
update_servings();
update_servings_planner();
