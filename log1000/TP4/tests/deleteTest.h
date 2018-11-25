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

class deleteTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE(deleteTest);
    CPPUNIT_TEST(deleteKeyNotExisting);
    CPPUNIT_TEST(deleteWorking);
    CPPUNIT_TEST_SUITE_END();
    
public:
    void setUp(void);
    void tearDown(void);
    
protected:
    void deleteKeyNotExisting(void);
    void deleteWorking(void);
    
private:
    
    HashMap* hashMap;
};

// ------------------------ IMPLEMENTATION ------------------------

void deleteTest::deleteKeyNotExisting(void)
{
    CPPUNIT_ASSERT(0==hashMap->deleteNode(1));
}

void deleteTest::deleteWorking(void)
{
	hashMap->insertNode(1, 123);
	hashMap->deleteNode(1);
    CPPUNIT_ASSERT(0==hashMap->sizeofMap());
}

void deleteTest::setUp(void)
{
    hashMap = new HashMap();
}

void deleteTest::tearDown(void)
{
    delete hashMap;
}
