/**
 * webhook controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::webhook.webhook" as any);
