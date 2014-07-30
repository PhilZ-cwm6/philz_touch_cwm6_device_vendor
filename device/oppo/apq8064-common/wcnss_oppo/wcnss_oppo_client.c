/*
 * Copyright (C) 2014, The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//#define LOG_NDEBUG 0

#define LOG_TAG "wcnss_oppo"

#define SUCCESS 0
#define FAILED -1

#define MAC_ADDR_PATH "/data/opponvitems/4678"
#define MAC_ADDR_SIZE 6
#define MAX_WAIT_COUNT 5
#define WAIT_TIME 500000

#include <cutils/log.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int wcnss_init_qmi(void)
{
    /* empty */
    return SUCCESS;
}

int wcnss_qmi_get_wlan_address(unsigned char *pBdAddr)
{
    int fd, ret, i;
    char buf[MAC_ADDR_SIZE];
    struct stat mac_stat;

    do {
        usleep(WAIT_TIME);
    } while (stat(MAC_ADDR_PATH, &mac_stat) && i < MAX_WAIT_COUNT);

    if (i == MAX_WAIT_COUNT) {
        ALOGE("Failed to obtain MAC address from NV\n");
        return FAILED;
    }

    fd = open(MAC_ADDR_PATH, O_RDONLY);
    if (fd < 0) {
        ALOGE("Failure opening MAC path: %d\n", errno);
        return FAILED;
    }

    ret = read(fd, buf, MAC_ADDR_SIZE);
    if (ret < 0) {
        ALOGE("Failure to read MAC data: %d\n", errno);
        close(fd);
        return FAILED;
    }

    /* swap bytes */
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        pBdAddr[i] = buf[MAC_ADDR_SIZE - 1 - i];
    }

    ALOGI("Found MAC address: %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx\n",
            pBdAddr[0],
            pBdAddr[1],
            pBdAddr[2],
            pBdAddr[3],
            pBdAddr[4],
            pBdAddr[5]);

    close(fd);

    return SUCCESS;
}

void wcnss_qmi_deinit(void)
{
    /* empty */
}
