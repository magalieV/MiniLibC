/*
** EPITECH PROJECT, 2019
** Test
** File description:
** Test
*/

#include <stdio.h>
//#include <string.h>

extern int strcmp(const char *, const char *);
extern int strncmp(const char *, const char *, unsigned long);
extern char *strchr(const char *s, int c);
extern int strcasecmp(const char *, const char *);
extern char *rindex(const char *s, int c);
extern size_t strcspn(const char *s, const char *reject);
extern char *strpbrk(const char *s, const char *accept);
extern char *strstr(const char *meule_de_foin, const char *aiguille);

int COUNT = 0;
int PASSED = 0;
int FAILED = 0;

void check_int_result(size_t got, size_t expected, int line)
{
    COUNT++;
    if (got == expected) {
        printf("Passed(%d)\n", COUNT);
        PASSED++;
    } else {
        printf("Failed(%d): line %d\tExpected: %ld Got: %ld\n",
            COUNT, line, expected, got);
        FAILED++;
    }
}

void test_strcmp(void)
{
    printf("[****] Test strcmp\n");
    check_int_result(strcmp("salut", "salut"), 0, 42);
    check_int_result(strcmp("salut", "salu"), 1, 43);
    check_int_result(strcmp("salut", "salub"), 1, 44);
    check_int_result(strcmp("salu", "salut"), -1, 45);
    check_int_result(strcmp("salua", "salut"), -1, 46);
    check_int_result(strcmp("", "a"), -1, 47);
    check_int_result(strcmp("a", ""), 1, 48);
    check_int_result(strcmp("", ""), 0, 49);
}

void test_strncmp(void)
{
    printf("\n[****] Test stncmp\n");
    check_int_result(strncmp("salut", "salut", 5), 0, 55);
    check_int_result(strncmp("salut", "salu", 5), 116, 56);
    check_int_result(strncmp("salut", "salub", 5), 18, 57);
    check_int_result(strncmp("salu", "salut", 3), 0, 58);
    check_int_result(strncmp("salua", "salut", 6), -19, 59);
    check_int_result(strncmp("", "a", 2), -97, 60);
    check_int_result(strncmp("a", "", 1), 97, 61);
    check_int_result(strncmp("", "", 1), 0, 62);
}

void check_str_result(char *got, char *expected, int line)
{
    COUNT++;
    if (strcmp(expected, "null") == 0 && got == NULL) {
        printf("Passed(%d)\n", COUNT);
        PASSED++;
        return;
    } else if (strcmp(expected, "null") == 0 && got != NULL) {
        printf("Failed(%d): line %d\tExpected: %s Got: %s\n",
            COUNT, line, expected, got);
        FAILED++;
        return;
    }
    if (strcmp(expected, got) == 0) {
        printf("Passed(%d)\n", COUNT);
        PASSED++;
    } else {
        printf("Failed(%d): line %d\tExpected: %s Got: %s\n",
               COUNT, line, expected, got);
        FAILED++;
    }
}

void test_strchr(void)
{
    printf("\n[****] Test strchr\n");
    check_str_result(strchr("salut", 's'), "salut", 91);
    check_str_result(strchr("salut", 't'), "t", 92);
    check_str_result(strchr("salut", 'a'), "alut", 93);
    check_str_result(strchr("salusa", 's'), "salusa", 94);
    check_str_result(strchr("salut", 'e'), "null", 95);
    check_str_result(strchr("salu", '\0'), "\0", 96);
    check_str_result(strchr("", 'e'), "null", 97);
}

void test_strcasecmp(void)
{
    printf("\n[****] Test strcasecmp\n");
    check_int_result(strcasecmp("salut", "salut"), 0, 103);
    check_int_result(strcasecmp("salut", "sAlUT"), 0, 104);
    check_int_result(strcasecmp("salut", "salu"), 116, 105);
    check_int_result(strcasecmp("salut", "salU"), 116, 106);
    check_int_result(strcasecmp("salut", "salub"), 18, 107);
    check_int_result(strcasecmp("saluT", "salub"), 18, 108);
    check_int_result(strcasecmp("salu", "salut"), -116, 109);
    check_int_result(strcasecmp("salu", "saluT"), -116, 110);
    check_int_result(strcasecmp("salua", "salut"), -19, 111);
    check_int_result(strcasecmp("saluA", "salut"), -19, 112);
    check_int_result(strcasecmp("", "a"), -97, 113);
    check_int_result(strcasecmp("", "A"), -65, 114);
    check_int_result(strcasecmp("a", ""), 97, 115);
    check_int_result(strcasecmp("A", ""), 65, 116);
    check_int_result(strcasecmp("", ""), 0, 117);
    check_int_result(strcasecmp("salut, ca, va, Et, Toi ?", "salut, ca, va, et, toi ?"), 0, 118);
}

void end_test()
{
    printf("\n(EndTest)\nPassed: %d\tFailed: %d\n", PASSED, FAILED);
}

void test_rindex(void)
{
    printf("\n[****] Test rindex\n");
    check_str_result(rindex("salut", 's'), "salut", 129);
    check_str_result(rindex("salut", 't'), "t", 130);
    check_str_result(rindex("salut", 'a'), "alut", 131);
    check_str_result(rindex("salusa", 's'), "sa", 132);
    check_str_result(rindex("Bonjour, comment va-tu ?", 'o'), "omment va-tu ?", 133);
    check_str_result(rindex("salut", 'e'), "null", 134);
    check_str_result(rindex("salu", '\0'), "\0", 135);
    check_str_result(rindex("", 'e'), "null", 136);
}

void test_strcspn(void)
{
    printf("\n[****] Test strcspn\n");
    check_int_result(strcspn("salut", "t"), 4, 142);
    check_int_result(strcspn("salut", "lu"), 2, 143);
    check_int_result(strcspn("salut", "salut"), 0, 144);
    check_int_result(strcspn("salut", "a"), 1, 145);
    check_int_result(strcspn("salut", "e"), 5, 146);
    check_int_result(strcspn("", "a"), 0, 147);
    check_int_result(strcspn("a", ""), 1, 148);
    check_int_result(strcspn("", ""), 0, 149);
}

void test_strpbrk()
{
    printf("\n[****] Test strpbrk\n");
    check_str_result(strpbrk("salut", "t"), "t", 155);
    check_str_result(strpbrk("salut", "trop"), "t", 156);
    check_str_result(strpbrk("salut", "hay"), "alut", 157);
    check_str_result(strpbrk("salut", "a"), "alut", 158);
    check_str_result(strpbrk("salut", "e"), "null", 159);
    check_str_result(strpbrk("", "a"), "null", 160);
    check_str_result(strpbrk("a", ""), "null", 161);
    check_str_result(strpbrk("", ""), "null", 162);
}

void test_strstr()
{
    printf("\n[****] Test strstr\n");
    check_str_result(strstr("salut", "t"), "t", 168);
    check_str_result(strstr("salut", "lut"), "lut", 169);
    check_str_result(strstr("salut", "salut"), "salut", 170);
    check_str_result(strstr("salut", "sa"), "salut", 171);
    check_str_result(strstr("salut", "hay"), "null", 172);
    check_str_result(strstr("", "a"), "null", 173);
    check_str_result(strstr("a", ""), "a", 174);
    check_str_result(strstr("", ""), "\0", 175);
}

int main()
{
    test_strcmp();
    test_strncmp();
    test_strchr();
    test_strcasecmp();
    test_rindex();
    test_strcspn();
    test_strpbrk();
    test_strstr();
    end_test();
    return (0);
}