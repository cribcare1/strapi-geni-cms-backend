/**
 * webhook router
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreRouter("api::webhook.webhook" as any);
