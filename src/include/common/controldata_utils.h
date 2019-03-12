/*
 * controldata_utils.h
 *		Common code for pg_controldata output
 *
 *	Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group
 *	Portions Copyright (c) 1994, Regents of the University of California
 *
 *	src/include/common/controldata_utils.h
 */
#ifndef COMMON_CONTROLDATA_UTILS_H
#define COMMON_CONTROLDATA_UTILS_H

#include "catalog/pg_control.h"

extern ControlFileData *get_controlfile(const char *DataDir,
										const char *progname,
										bool *crc_ok_p);
extern void update_controlfile(const char *DataDir, const char *progname,
							   ControlFileData *ControlFile);

#endif							/* COMMON_CONTROLDATA_UTILS_H */
