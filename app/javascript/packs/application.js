import "bootstrap";
import "components/navbar";
import "packs/plugin/profile.js";

import { btnHeartToggle } from "components/btn_heart_toggle";
import { initLikedRecipeNav } from "components/init_like_recipe_nav";
import { display_add_or_random } from '../components/add_or_random';
import { display_title } from '../components/planner_title';
import { display_searchbar } from '../components/searchbar_index_recipe.js';
import { display_filter } from '../components/searchbar_index_recipe.js';
import { navBackChangeWithScrollPos } from '../components/navbar_back_bgchange_with_scrollpos';

display_title();
display_searchbar();
display_filter();
btnHeartToggle();
initLikedRecipeNav();
display_add_or_random();
navBackChangeWithScrollPos();
