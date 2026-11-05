#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    const device _27* vp_s0 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(0)]];
    float4 m_39 [[attribute(5)]];
    uint4 m_34 [[attribute(7)]];
    float4 m_37 [[attribute(14)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _1357, thread const int& _1358, thread const int& _1359, thread const int& _1360, thread int& _1361, thread int& _1362, thread int& _1363, thread int& _1364, thread int& _1365, thread int& _1366, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _1369 = _1358;
    int _1371 = _1359;
    float _1373 = as_type<float>(_1357) + 0.0;
    bool _1375 = _1373 != 0.0;
    bool _1377 = isnan(_1373);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    int _1385 = 0;
    int _1387 = _1383 ? (-1) : 0;
    if (!_1383)
    {
        float _1389 = as_type<float>(_1357) * 1.0;
        _1369 = as_type<int>(_1389);
    }
    int _1391 = _1369;
    bool _1393 = !_1383;
    int _1395 = _1391;
    int _1397 = _1391;
    if (!_1393)
    {
        float _1399 = as_type<float>(_1357) + 0.0;
        bool _1401 = _1399 >= 0.0;
        bool _1403 = isnan(_1399);
        bool _1405 = _1401 || _1403;
        bool _1407 = isnan(0.0);
        bool _1409 = _1405 || _1407;
        _1387 = _1409 ? (-1) : 0;
        if (!_1409)
        {
            _1395 = 2147483647;
        }
        int _1411 = _1395;
        bool _1413 = !_1409;
        int _1415 = _1411;
        _1397 = _1411;
        if (!_1413)
        {
            float _1417 = as_type<float>(_1357) + 0.0;
            bool _1419 = _1417 > as_type<float>(0x7f800000u /* inf */);
            bool _1421 = isnan(_1417);
            bool _1423 = _1419 || _1421;
            bool _1425 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1427 = _1423 || _1425;
            _1385 = 2139095040;
            _1387 = _1427 ? (-1) : 0;
            if (_1427)
            {
                float _1429 = as_type<float>(_1357) + 1.0;
                _1415 = as_type<int>(_1429);
            }
            int _1431 = _1415;
            int _1433 = _1431;
            _1397 = _1431;
            if (!_1427)
            {
                float _1435 = 0.0 + as_type<float>(_1357);
                bool _1437 = _1435 != as_type<float>(0x7f800000u /* inf */);
                bool _1439 = isnan(_1435);
                bool _1441 = _1437 || _1439;
                bool _1443 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1445 = _1441 || _1443;
                _1387 = _1445 ? (-1) : 0;
                if (!_1445)
                {
                    _1433 = _1357;
                }
                int _1447 = _1433;
                bool _1449 = !_1445;
                _1397 = _1447;
                if (!_1449)
                {
                    float _1451 = as_type<float>(_1357) * 18446744073709551616.0;
                    float _1453 = rsqrt(_1451);
                    float _1455 = _1451 * _1453;
                    float _1457 = _1453 * 0.5;
                    float _1459 = -_1455;
                    float _1461 = 0.0 + _1459;
                    float _1463 = fma(_1457, _1461, 0.5);
                    float _1465 = fma(_1455, _1463, _1455);
                    float _1467 = -_1465;
                    float _1469 = 0.0 + _1467;
                    float _1471 = fma(_1465, _1469, _1451);
                    float _1473 = fma(_1457, _1471, _1465);
                    float _1475 = _1473 * 2.3283064365386962890625e-10;
                    _1397 = as_type<int>(_1475);
                    _1371 = as_type<int>(_1465);
                    _1385 = as_type<int>(_1461);
                }
            }
        }
    }
    int _1477 = _1397;
    int _1479 = _1371;
    int _1481 = _1385;
    int _1483 = _1387;
    _1361 = _1360;
    _1362 = 0;
    _1363 = _1477;
    _1364 = _1479;
    _1365 = _1481;
    _1366 = _1483;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[10].y, (*spvDescriptorSet0.vp_c7)._m0[10].y, _58);
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].x * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _62);
    float _66 = rsqrt(_60);
    float _68 = rsqrt(_64);
    float _70 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _72 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _78 = _70 * _74;
    float _80 = -_78;
    float _82 = fma(_72, _76, _80);
    float _84 = precise::max(_82, -1.0);
    float _86 = precise::min(_84, 1.0);
    float _88 = abs(_86);
    float _90 = fma(_88, -0.5, 0.5);
    int _92 = as_type<int>(_90) + (-218103808);
    bool _96 = uint(_92) >= 1920991232u;
    bool _98 = !_96;
    int _120;
    if (!_98)
    {
        int _100 = as_type<int>(_90);
        int _102 = as_type<int>(_78);
        int _104 = as_type<int>(_68);
        int _106 = 400;
        int _108;
        int _110;
        int _112;
        int _114;
        int _116;
        int _118;
        _54(_100, _102, _104, _106, _108, _110, _112, _114, _116, _118, out.gl_Position, out.gl_PointSize);
        _120 = _112;
        _122 = true;
    }
    else
    {
        float _124 = rsqrt(_90);
        float _126 = _90 * _124;
        float _128 = _124 * 0.5;
        float _130 = -_126;
        float _132 = 0.0 + _130;
        float _134 = fma(_128, _132, 0.5);
        float _136 = fma(_126, _134, _126);
        float _138 = -_136;
        float _140 = 0.0 + _138;
        float _142 = fma(_136, _140, _90);
        float _144 = fma(_128, _142, _136);
        _120 = as_type<int>(_144);
    }
    _122 = false;
    int _146 = _120;
    float _148 = as_type<float>(in.m_34.x);
    float _150 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _152 = fma((*spvDescriptorSet0.vp_c7)._m0[10].w, 0.02999999932944774627685546875, 0.0030000000260770320892333984375);
    float _154 = _152 * 0.15915493667125701904296875;
    float _156 = sqrt(_152);
    float _158 = abs(_86);
    bool _160 = _158 > 0.569999992847442626953125;
    float _162 = _154 * 6.283185482025146484375;
    float _164 = sin(_162);
    float _166 = abs(_86);
    float _168 = _160 ? as_type<float>(_146) : _166;
    float _170 = _168 * _168;
    float _172 = in.m_37.y;
    float _174 = _156 + _164;
    float _176 = fma(_170, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
    float _178 = in.m_39.x;
    float _180 = _174 * 0.15915493667125701904296875;
    float _182 = fma(_170, _176, 0.0467568598687648773193359375);
    float _184 = _180 * 6.283185482025146484375;
    float _186 = cos(_184);
    float _188 = fma(_170, _182, 0.074846573173999786376953125);
    int _190 = as_type<int>(_150) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _192 = _190 + as_type<int>(_148);
    int _194 = _192 * 48;
    int _196 = _194 + 32;
    int _198 = _194 + 16;
    int _200 = _194 + 48;
    uint _203 = uint(int(uint(_196) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_203)];
    float _205 = as_type<float>(_dmw1.x);
    int _207 = _196 + 4;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.y);
    int _213 = _196 + 8;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>(_dmw1.z);
    int _219 = _196 + 12;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw1.w);
    uint _225 = uint(int(uint(_198) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_225)];
    float _227 = as_type<float>(_dmw0.x);
    int _229 = _198 + 4;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw0.y);
    int _235 = _198 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    float _239 = as_type<float>(_dmw0.z);
    int _241 = _198 + 12;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw0.w);
    uint _247 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_247)];
    float _249 = as_type<float>(_dmw2.x);
    int _251 = _200 + 4;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>(_dmw2.y);
    int _257 = _200 + 8;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    float _261 = as_type<float>(_dmw2.z);
    int _263 = _200 + 12;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    float _267 = as_type<float>(_dmw2.w);
    float _269 = fma(_170, _188, 0.166670143604278564453125);
    float _271 = _170 * _269;
    float _273 = _186 * _186;
    float _275 = fma(_168, _271, _168);
    float _277 = abs(_186);
    float _279 = _277 * _273;
    float _281 = _275;
    if (_160)
    {
        float _283 = fma(_275, -2.0, 1.57079637050628662109375);
        _281 = _283;
    }
    float _285 = _281;
    bool _287 = _86 >= 0.0;
    bool _289 = isnan(_86);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = (*spvDescriptorSet0.vp_c7)._m0[10].x * 0.100000001490116119384765625;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _279 * 0.4363323152065277099609375;
    bool _303 = !_295;
    float _305 = -_285;
    float _307 = _303 ? _305 : _285;
    float _309 = -_307;
    float _311 = fma(_299, _301, _309);
    float _313 = _311 * _172;
    float _315 = in.m_41.x;
    float _317 = in.m_41.y;
    float _319 = in.m_41.z;
    float _321 = _313 * 0.15915493667125701904296875;
    float _323 = _321 * 6.283185482025146484375;
    float _325 = sin(_323);
    float _327 = _321 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _325 * _319;
    float _333 = _329 * _319;
    float _335 = -_331;
    float _337 = fma(_329, _315, _335);
    float _339 = fma(_325, _315, _333);
    float _341 = _211 * _317;
    float _343 = _233 * _317;
    float _345 = fma(_337, _205, _341);
    float _347 = _255 * _317;
    float _349 = fma(_337, _227, _343);
    float _351 = fma(_339, _217, _345);
    float _353 = fma(_337, _249, _347);
    float _355 = fma(_339, _239, _349);
    float _357 = _223 + _351;
    float _359 = fma(_339, _261, _353);
    float _361 = _245 + _355;
    float _363 = _357 * _178;
    float _365 = _267 + _359;
    float _367 = _361 * _178;
    float _369 = _363 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _373 = _365 * _178;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[2].x, _369);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[0].x, _371);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[2].z, _375);
    float _381 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[0].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _387 = _363 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _391 = _383 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _395 = _385 + _393;
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[1].x, _387);
    float _399 = _391 * _391;
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[1].z, _397);
    float _403 = fma(_395, _395, _399);
    float _405 = _401 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _407 = sqrt(_403);
    float _409 = _405 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].x, _409);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[2].z, _411);
    float _415 = _413 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _417 = _407 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _419 = _367;
    float _421 = _413;
    float _423 = _401;
    float _425 = _415;
    if (!_417)
    {
        _419 = _385;
    }
    float _427 = _419;
    float _429 = _427;
    if (!_417)
    {
        _421 = _383;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_417)
    {
        _423 = _405;
    }
    float _435 = _423;
    bool _437 = !_417;
    float _439 = _435;
    if (!_437)
    {
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _445 = _407 + _443;
        float _447 = _405 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _449 = rsqrt(_403);
        float _451 = _445 * _441;
        float _453 = _451 * 0.15915493667125701904296875;
        float _455 = _453 * 6.283185482025146484375;
        float _457 = cos(_455);
        float _459 = _453 * 6.283185482025146484375;
        float _461 = sin(_459);
        float _463 = _457 + (-1.0);
        float _465 = _463 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _467 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _469 = fma(_405, _457, _465);
        float _471 = _449 * _467;
        float _473 = _469 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _475 = fma(_395, _471, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _477 = fma(_391, _471, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].x, _473);
        float _481 = fma(_477, (*spvDescriptorSet0.vp_c4)._m0[2].z, _479);
        float _483 = _481 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _439 = _469;
        _429 = _475;
        _433 = _477;
        _425 = _483;
    }
    float _485 = _439;
    float _487 = _429;
    float _489 = _433;
    float _491 = _425;
    float _493 = _485 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _495 = _485 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].x, _493);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].x, _495);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _505 = _501 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _509 = _505 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _511 = _505 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _513 = _505 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _515 = _505 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].x, _509);
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].x, _511);
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].x, _513);
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    float _525 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[8].z, _517);
    float _527 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[7].z, _519);
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _531 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[10].z, _523);
    float _533 = _525 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _535 = _527 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _537 = _529 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _539 = _531 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _535;
    out.gl_Position.y = _533;
    out.gl_Position.z = _537;
    out.gl_Position.w = _539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[10].y, (*spvDescriptorSet0.vp_c7)._m0[10].y, _58);
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].x * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _62);
    float _66 = rsqrt(_60);
    float _68 = rsqrt(_64);
    float _70 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _72 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _78 = _70 * _74;
    float _80 = -_78;
    float _82 = fma(_72, _76, _80);
    float _84 = precise::max(_82, -1.0);
    float _86 = precise::min(_84, 1.0);
    float _88 = abs(_86);
    float _90 = fma(_88, -0.5, 0.5);
    int _92 = as_type<int>(_90) + (-218103808);
    bool _96 = uint(_92) >= 1920991232u;
    bool _98 = !_96;
    int _120;
    if (!_98)
    {
        int _100 = as_type<int>(_90);
        int _102 = as_type<int>(_78);
        int _104 = as_type<int>(_68);
        int _106 = 400;
        int _108;
        int _110;
        int _112;
        int _114;
        int _116;
        int _118;
        _54(_100, _102, _104, _106, _108, _110, _112, _114, _116, _118, out.gl_Position, out.gl_PointSize);
        _120 = _112;
        _122 = true;
    }
    else
    {
        float _124 = rsqrt(_90);
        float _126 = _90 * _124;
        float _128 = _124 * 0.5;
        float _130 = -_126;
        float _132 = 0.0 + _130;
        float _134 = fma(_128, _132, 0.5);
        float _136 = fma(_126, _134, _126);
        float _138 = -_136;
        float _140 = 0.0 + _138;
        float _142 = fma(_136, _140, _90);
        float _144 = fma(_128, _142, _136);
        _120 = as_type<int>(_144);
    }
    _122 = false;
    int _146 = _120;
    float _148 = as_type<float>(in.m_34.x);
    float _150 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _152 = fma((*spvDescriptorSet0.vp_c7)._m0[10].w, 0.02999999932944774627685546875, 0.0030000000260770320892333984375);
    float _154 = _152 * 0.15915493667125701904296875;
    float _156 = sqrt(_152);
    float _158 = abs(_86);
    bool _160 = _158 > 0.569999992847442626953125;
    float _162 = _154 * 6.283185482025146484375;
    float _164 = sin(_162);
    float _166 = abs(_86);
    float _168 = _160 ? as_type<float>(_146) : _166;
    float _170 = _168 * _168;
    float _172 = in.m_37.y;
    float _174 = _156 + _164;
    float _176 = fma(_170, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
    float _178 = in.m_39.x;
    float _180 = _174 * 0.15915493667125701904296875;
    float _182 = fma(_170, _176, 0.0467568598687648773193359375);
    float _184 = _180 * 6.283185482025146484375;
    float _186 = cos(_184);
    float _188 = fma(_170, _182, 0.074846573173999786376953125);
    int _190 = as_type<int>(_150) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _192 = _190 + as_type<int>(_148);
    int _194 = _192 * 48;
    int _196 = _194 + 32;
    int _198 = _194 + 16;
    int _200 = _194 + 48;
    uint _203 = uint(int(uint(_196) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_203)];
    float _205 = as_type<float>(_dmw1.x);
    int _207 = _196 + 4;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.y);
    int _213 = _196 + 8;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>(_dmw1.z);
    int _219 = _196 + 12;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw1.w);
    uint _225 = uint(int(uint(_198) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_225)];
    float _227 = as_type<float>(_dmw0.x);
    int _229 = _198 + 4;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw0.y);
    int _235 = _198 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    float _239 = as_type<float>(_dmw0.z);
    int _241 = _198 + 12;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw0.w);
    uint _247 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_247)];
    float _249 = as_type<float>(_dmw2.x);
    int _251 = _200 + 4;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>(_dmw2.y);
    int _257 = _200 + 8;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    float _261 = as_type<float>(_dmw2.z);
    int _263 = _200 + 12;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    float _267 = as_type<float>(_dmw2.w);
    float _269 = fma(_170, _188, 0.166670143604278564453125);
    float _271 = _170 * _269;
    float _273 = _186 * _186;
    float _275 = fma(_168, _271, _168);
    float _277 = abs(_186);
    float _279 = _277 * _273;
    float _281 = _275;
    if (_160)
    {
        float _283 = fma(_275, -2.0, 1.57079637050628662109375);
        _281 = _283;
    }
    float _285 = _281;
    bool _287 = _86 >= 0.0;
    bool _289 = isnan(_86);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = (*spvDescriptorSet0.vp_c7)._m0[10].x * 0.100000001490116119384765625;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _279 * 0.4363323152065277099609375;
    bool _303 = !_295;
    float _305 = -_285;
    float _307 = _303 ? _305 : _285;
    float _309 = -_307;
    float _311 = fma(_299, _301, _309);
    float _313 = _311 * _172;
    float _315 = in.m_41.x;
    float _317 = in.m_41.y;
    float _319 = in.m_41.z;
    float _321 = _313 * 0.15915493667125701904296875;
    float _323 = _321 * 6.283185482025146484375;
    float _325 = sin(_323);
    float _327 = _321 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _325 * _319;
    float _333 = _329 * _319;
    float _335 = -_331;
    float _337 = fma(_329, _315, _335);
    float _339 = fma(_325, _315, _333);
    float _341 = _211 * _317;
    float _343 = _233 * _317;
    float _345 = fma(_337, _205, _341);
    float _347 = _255 * _317;
    float _349 = fma(_337, _227, _343);
    float _351 = fma(_339, _217, _345);
    float _353 = fma(_337, _249, _347);
    float _355 = fma(_339, _239, _349);
    float _357 = _223 + _351;
    float _359 = fma(_339, _261, _353);
    float _361 = _245 + _355;
    float _363 = _357 * _178;
    float _365 = _267 + _359;
    float _367 = _361 * _178;
    float _369 = _363 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _373 = _365 * _178;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[2].x, _369);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[0].x, _371);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[2].z, _375);
    float _381 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[0].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _387 = _363 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _391 = _383 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _395 = _385 + _393;
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[1].x, _387);
    float _399 = _391 * _391;
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[1].z, _397);
    float _403 = fma(_395, _395, _399);
    float _405 = _401 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _407 = sqrt(_403);
    float _409 = _405 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].x, _409);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[2].z, _411);
    float _415 = _413 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _417 = _407 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _419 = _367;
    float _421 = _413;
    float _423 = _401;
    float _425 = _415;
    if (!_417)
    {
        _419 = _385;
    }
    float _427 = _419;
    float _429 = _427;
    if (!_417)
    {
        _421 = _383;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_417)
    {
        _423 = _405;
    }
    float _435 = _423;
    bool _437 = !_417;
    float _439 = _435;
    if (!_437)
    {
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _445 = _407 + _443;
        float _447 = _405 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _449 = rsqrt(_403);
        float _451 = _445 * _441;
        float _453 = _451 * 0.15915493667125701904296875;
        float _455 = _453 * 6.283185482025146484375;
        float _457 = cos(_455);
        float _459 = _453 * 6.283185482025146484375;
        float _461 = sin(_459);
        float _463 = _457 + (-1.0);
        float _465 = _463 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _467 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _469 = fma(_405, _457, _465);
        float _471 = _449 * _467;
        float _473 = _469 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _475 = fma(_395, _471, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _477 = fma(_391, _471, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].x, _473);
        float _481 = fma(_477, (*spvDescriptorSet0.vp_c4)._m0[2].z, _479);
        float _483 = _481 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _439 = _469;
        _429 = _475;
        _433 = _477;
        _425 = _483;
    }
    float _485 = _439;
    float _487 = _429;
    float _489 = _433;
    float _491 = _425;
    float _493 = _485 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _495 = _485 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].x, _493);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].x, _495);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _505 = _501 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _509 = _505 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _511 = _505 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _513 = _505 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _515 = _505 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].x, _509);
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].x, _511);
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].x, _513);
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    float _525 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[8].z, _517);
    float _527 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[7].z, _519);
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _531 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[10].z, _523);
    float _533 = _525 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _535 = _527 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _537 = _529 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _539 = _531 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _535;
    out.gl_Position.y = _533;
    out.gl_Position.z = _537;
    out.gl_Position.w = _539;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _122 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[10].y, (*spvDescriptorSet0.vp_c7)._m0[10].y, _58);
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].x * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _62);
    float _66 = rsqrt(_60);
    float _68 = rsqrt(_64);
    float _70 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].z;
    float _72 = _66 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].x;
    float _78 = _70 * _74;
    float _80 = -_78;
    float _82 = fma(_72, _76, _80);
    float _84 = precise::max(_82, -1.0);
    float _86 = precise::min(_84, 1.0);
    float _88 = abs(_86);
    float _90 = fma(_88, -0.5, 0.5);
    int _92 = as_type<int>(_90) + (-218103808);
    bool _96 = uint(_92) >= 1920991232u;
    bool _98 = !_96;
    int _120;
    if (!_98)
    {
        int _100 = as_type<int>(_90);
        int _102 = as_type<int>(_78);
        int _104 = as_type<int>(_68);
        int _106 = 400;
        int _108;
        int _110;
        int _112;
        int _114;
        int _116;
        int _118;
        _54(_100, _102, _104, _106, _108, _110, _112, _114, _116, _118, out.gl_Position, out.gl_PointSize);
        _120 = _112;
        _122 = true;
    }
    else
    {
        float _124 = rsqrt(_90);
        float _126 = _90 * _124;
        float _128 = _124 * 0.5;
        float _130 = -_126;
        float _132 = 0.0 + _130;
        float _134 = fma(_128, _132, 0.5);
        float _136 = fma(_126, _134, _126);
        float _138 = -_136;
        float _140 = 0.0 + _138;
        float _142 = fma(_136, _140, _90);
        float _144 = fma(_128, _142, _136);
        _120 = as_type<int>(_144);
    }
    _122 = false;
    int _146 = _120;
    float _148 = as_type<float>(in.m_34.x);
    float _150 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _152 = fma((*spvDescriptorSet0.vp_c7)._m0[10].w, 0.02999999932944774627685546875, 0.0030000000260770320892333984375);
    float _154 = _152 * 0.15915493667125701904296875;
    float _156 = sqrt(_152);
    float _158 = abs(_86);
    bool _160 = _158 > 0.569999992847442626953125;
    float _162 = _154 * 6.283185482025146484375;
    float _164 = sin(_162);
    float _166 = abs(_86);
    float _168 = _160 ? as_type<float>(_146) : _166;
    float _170 = _168 * _168;
    float _172 = in.m_37.y;
    float _174 = _156 + _164;
    float _176 = fma(_170, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
    float _178 = in.m_39.x;
    float _180 = _174 * 0.15915493667125701904296875;
    float _182 = fma(_170, _176, 0.0467568598687648773193359375);
    float _184 = _180 * 6.283185482025146484375;
    float _186 = cos(_184);
    float _188 = fma(_170, _182, 0.074846573173999786376953125);
    int _190 = as_type<int>(_150) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _192 = _190 + as_type<int>(_148);
    int _194 = _192 * 48;
    int _196 = _194 + 32;
    int _198 = _194 + 16;
    int _200 = _194 + 48;
    uint _203 = uint(int(uint(_196) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_203)];
    float _205 = as_type<float>(_dmw1.x);
    int _207 = _196 + 4;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.y);
    int _213 = _196 + 8;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>(_dmw1.z);
    int _219 = _196 + 12;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw1.w);
    uint _225 = uint(int(uint(_198) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_225)];
    float _227 = as_type<float>(_dmw0.x);
    int _229 = _198 + 4;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw0.y);
    int _235 = _198 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    float _239 = as_type<float>(_dmw0.z);
    int _241 = _198 + 12;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw0.w);
    uint _247 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_247)];
    float _249 = as_type<float>(_dmw2.x);
    int _251 = _200 + 4;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>(_dmw2.y);
    int _257 = _200 + 8;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    float _261 = as_type<float>(_dmw2.z);
    int _263 = _200 + 12;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    float _267 = as_type<float>(_dmw2.w);
    float _269 = fma(_170, _188, 0.166670143604278564453125);
    float _271 = _170 * _269;
    float _273 = _186 * _186;
    float _275 = fma(_168, _271, _168);
    float _277 = abs(_186);
    float _279 = _277 * _273;
    float _281 = _275;
    if (_160)
    {
        float _283 = fma(_275, -2.0, 1.57079637050628662109375);
        _281 = _283;
    }
    float _285 = _281;
    bool _287 = _86 >= 0.0;
    bool _289 = isnan(_86);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = (*spvDescriptorSet0.vp_c7)._m0[10].x * 0.100000001490116119384765625;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _279 * 0.4363323152065277099609375;
    bool _303 = !_295;
    float _305 = -_285;
    float _307 = _303 ? _305 : _285;
    float _309 = -_307;
    float _311 = fma(_299, _301, _309);
    float _313 = _311 * _172;
    float _315 = in.m_41.x;
    float _317 = in.m_41.y;
    float _319 = in.m_41.z;
    float _321 = _313 * 0.15915493667125701904296875;
    float _323 = _321 * 6.283185482025146484375;
    float _325 = sin(_323);
    float _327 = _321 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _325 * _319;
    float _333 = _329 * _319;
    float _335 = -_331;
    float _337 = fma(_329, _315, _335);
    float _339 = fma(_325, _315, _333);
    float _341 = _211 * _317;
    float _343 = _233 * _317;
    float _345 = fma(_337, _205, _341);
    float _347 = _255 * _317;
    float _349 = fma(_337, _227, _343);
    float _351 = fma(_339, _217, _345);
    float _353 = fma(_337, _249, _347);
    float _355 = fma(_339, _239, _349);
    float _357 = _223 + _351;
    float _359 = fma(_339, _261, _353);
    float _361 = _245 + _355;
    float _363 = _357 * _178;
    float _365 = _267 + _359;
    float _367 = _361 * _178;
    float _369 = _363 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _373 = _365 * _178;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[2].x, _369);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[0].x, _371);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[2].z, _375);
    float _381 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[0].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _387 = _363 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _391 = _383 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _395 = _385 + _393;
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c7)._m0[1].x, _387);
    float _399 = _391 * _391;
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c7)._m0[1].z, _397);
    float _403 = fma(_395, _395, _399);
    float _405 = _401 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _407 = sqrt(_403);
    float _409 = _405 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].x, _409);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[2].z, _411);
    float _415 = _413 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _417 = _407 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _419 = _367;
    float _421 = _413;
    float _423 = _401;
    float _425 = _415;
    if (!_417)
    {
        _419 = _385;
    }
    float _427 = _419;
    float _429 = _427;
    if (!_417)
    {
        _421 = _383;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_417)
    {
        _423 = _405;
    }
    float _435 = _423;
    bool _437 = !_417;
    float _439 = _435;
    if (!_437)
    {
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _445 = _407 + _443;
        float _447 = _405 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _449 = rsqrt(_403);
        float _451 = _445 * _441;
        float _453 = _451 * 0.15915493667125701904296875;
        float _455 = _453 * 6.283185482025146484375;
        float _457 = cos(_455);
        float _459 = _453 * 6.283185482025146484375;
        float _461 = sin(_459);
        float _463 = _457 + (-1.0);
        float _465 = _463 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _467 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _469 = fma(_405, _457, _465);
        float _471 = _449 * _467;
        float _473 = _469 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _475 = fma(_395, _471, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _477 = fma(_391, _471, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].x, _473);
        float _481 = fma(_477, (*spvDescriptorSet0.vp_c4)._m0[2].z, _479);
        float _483 = _481 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _439 = _469;
        _429 = _475;
        _433 = _477;
        _425 = _483;
    }
    float _485 = _439;
    float _487 = _429;
    float _489 = _433;
    float _491 = _425;
    float _493 = _485 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _495 = _485 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].x, _493);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].x, _495);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _505 = _501 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _509 = _505 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _511 = _505 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _513 = _505 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _515 = _505 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].x, _509);
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].x, _511);
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].x, _513);
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    float _525 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[8].z, _517);
    float _527 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[7].z, _519);
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _531 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[10].z, _523);
    float _533 = _525 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _535 = _527 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _537 = _529 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _539 = _531 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _535;
    out.gl_Position.y = _533;
    out.gl_Position.z = _537;
    out.gl_Position.w = _539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

