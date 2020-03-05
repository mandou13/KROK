import "bootstrap";
import "components/navbar";
import "packs/plugin/profile.js";
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!


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
import { handleClickOnTab } from '../components/handleClickOnTab';
import { getGeoloc } from '../components/get_geoloc';


import { initMapbox } from '../plugins/init_mapbox';
import { plannerSearchClick } from './plugin/plannerSearchSimulateClick';
import { scrollToNavbarTop  } from '../components/scrollToNavbarTop'
// import { handleColorBtnAddOldPlanner } from '../components/handleColorBtnAddOldPlanner';

display_title();
display_searchbar();
display_filter();
initLikedRecipeNav();
initSelect2();


//  window.onload = function(){
//    setTimeout(display_add_or_random, 5000)
// };
display_add_or_random();
navBackChangeWithScrollPos();
changeClassWhenSelect();
addFiltersToSearch();
update_servings();
update_servings_planner();
handleClickOnTab();
plannerSearchClick();
// handleColorBtnAddOldPlanner();

initMapbox();

getGeoloc();

scrollToNavbarTop();


