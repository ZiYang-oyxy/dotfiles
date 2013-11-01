/*
 * Track bandwidth of every client behinds linux router
 *
 * Author: Ouyang Xiongyi <hh123okbb@gmail.com>
 *
 * Changes:
 *         OuyangXY: Create file, 2013-10-30
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version
 * 2 of the License, or (at your option) any later version.
 */

static struct nf_hook_ops bwt_nf_ops = {
	.hook = bandwidth_tracker,
	.owner = THIS_MODULE,
	.pf = PF_INET,
	.hooknum = NF_INET_POST_ROUTING,
	.priority = NF_IP_PRI_FIRST,
}

static int __init bwt_init(void)
{
	int ret = 0;

	if (init_net.proc_net != NULL) {
		bwt_dir = proc_mkdir("bwt", init_net.proc_net);
		if (!bwt_dir) {
			printk(KERN_ERR "Failed to mkdir /proc/net/bwt\n");
			return -ENOMEM;
		}
	} else {
		printk(KERN_ERR "Can't find /proc/net/\n");
		return -ENOENT;
	}

	ret = nf_register_hooks(bwt_nf_ops, ARRAY_SIZE(btw_nf_ops));
	if (ret) {
		printk(KERN_ERR "Failed to register");
	}
	return ret;
}

static void __exit bwt_exit(void)
{
	if (bwt_dir != NULL) {
		bwt_dir = NULL;
		remove_proc_entry("bwt", init_net.proc_net);
	}
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Ouyang Xiongyi <hh123okbb@gmail.com>");
MODULE_DESCRIPTION("Bandwidth Tracker");
