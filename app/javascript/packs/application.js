import "bootstrap";
import "components/navbar";
import "packs/plugin/profile.js";
import { display_add_or_random } from '../components/add_or_random';
import { btnHeartToggle } from "components/btn_heart_toggle";
import { initLikedRecipeNav } from "components/init_like_recipe_nav";
import { display_title } from '../components/planner_title'

display_title();
btnHeartToggle();
initLikedRecipeNav();
display_add_or_random();
