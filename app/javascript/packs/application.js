import "bootstrap";
import { display_title } from './plugin/planner_title'
import { display_searchbar } from '../components/searchbar_index_recipe.js'
import { display_filter } from '../components/searchbar_index_recipe.js'
import "components/navbar";
import "packs/plugin/profile.js";
import { display_add_or_random } from '../components/add_or_random'


display_title();
display_searchbar();
display_filter();

display_add_or_random();
