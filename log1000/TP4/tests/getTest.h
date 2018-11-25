#include <string>
#include <list>
#include <cppunit/TestCase.h>
#include <cppunit/TestFixture.h>
#include <cppunit/ui/text/TextTestRunner.h>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/TestResult.h>
#include <cppunit/TestResultCollector.h>
#include <cppunit/TestRunner.h>
#include <cppunit/BriefTestProgressListener.h>
#include <cppunit/CompilerOutputter.h>
#include <cppunit/XmlOutputter.h>
#include <netinet/in.h>

#include "../HashMap.h"

using namespace CppUnit;
using namespace std;

//-----------------------------------------------------------------------------

class getTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE(getTest);
    CPPUNIT_TEST(test_inexistant);
    CPPUNIT_TEST(test_existant);
    CPPUNIT_TEST_SUITE_END();
    
public:
    void setUp(void);
    void tearDown(void);
    
protected:
    void test_inexistant(void);
    void test_existant(void);
    
private:
    
    HashMap* hashMap;
};

// ------------------------ IMPLEMENTATION ------------------------

void getTest::test_inexistant(void)
{
    CPPUNIT_ASSERT(0 == hashMap->get(0));
}

void getTest::test_existant(void)
{
	hashMap->insertNode(1, 123);
    CPPUNIT_ASSERT(123 == hashMap->get(1));
}

void getTest::setUp(void)
{
    hashMap = new HashMap();
}

void getTest::tearDown(void)
{
    delete hashMap;
}
