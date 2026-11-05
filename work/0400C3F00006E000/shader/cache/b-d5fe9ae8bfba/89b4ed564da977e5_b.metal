#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texturecube<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _47(thread const int& _1382, thread const int& _1383, thread const int& _1384, thread const int& _1385, thread int& _1386, thread int& _1387, thread int& _1388, thread int& _1389, thread int& _1390, thread int& _1391)
{
    float _1394 = as_type<float>(_1382) + 0.0;
    bool _1396 = _1394 != 0.0;
    bool _1398 = isnan(_1394);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    int _1406 = as_type<int>(_1394);
    int _1408 = _1383;
    int _1410 = _1384;
    int _1412 = _1404 ? (-1) : 0;
    if (!_1404)
    {
        float _1414 = as_type<float>(_1382) * 1.0;
        _1406 = as_type<int>(_1414);
    }
    int _1416 = _1406;
    bool _1418 = !_1404;
    int _1420 = _1416;
    if (!_1418)
    {
        float _1422 = as_type<float>(_1382) + 0.0;
        bool _1424 = _1422 >= 0.0;
        bool _1426 = isnan(_1422);
        bool _1428 = _1424 || _1426;
        bool _1430 = isnan(0.0);
        bool _1432 = _1428 || _1430;
        int _1434 = as_type<int>(_1422);
        _1412 = _1432 ? (-1) : 0;
        if (!_1432)
        {
            _1434 = 2147483647;
        }
        int _1436 = _1434;
        bool _1438 = !_1432;
        _1420 = _1436;
        if (!_1438)
        {
            float _1440 = abs(as_type<float>(_1382));
            float _1442 = _1440 + 0.0;
            bool _1444 = _1442 > as_type<float>(0x7f800000u /* inf */);
            bool _1446 = isnan(_1442);
            bool _1448 = _1444 || _1446;
            bool _1450 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1452 = _1448 || _1450;
            int _1454 = as_type<int>(_1442);
            _1412 = _1452 ? (-1) : 0;
            if (_1452)
            {
                float _1456 = as_type<float>(_1382) + 1.0;
                _1454 = as_type<int>(_1456);
            }
            int _1458 = _1454;
            _1420 = _1458;
            if (!_1452)
            {
                float _1460 = abs(as_type<float>(_1382));
                float _1462 = _1460 + (-0.0);
                float _1464 = 0.0 + _1462;
                bool _1466 = _1464 != as_type<float>(0x7f800000u /* inf */);
                bool _1468 = isnan(_1464);
                bool _1470 = _1466 || _1468;
                bool _1472 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1474 = _1470 || _1472;
                int _1476 = as_type<int>(_1464);
                _1412 = _1474 ? (-1) : 0;
                if (!_1474)
                {
                    _1476 = _1382;
                }
                int _1478 = _1476;
                bool _1480 = !_1474;
                _1420 = _1478;
                if (!_1480)
                {
                    float _1482 = as_type<float>(_1382) * 18446744073709551616.0;
                    float _1484 = rsqrt(_1482);
                    float _1486 = _1482 * _1484;
                    float _1488 = _1484 * 0.5;
                    float _1490 = -_1486;
                    float _1492 = 0.0 + _1490;
                    float _1494 = fma(_1488, _1492, 0.5);
                    float _1496 = fma(_1486, _1494, _1486);
                    float _1498 = -_1496;
                    float _1500 = 0.0 + _1498;
                    float _1502 = fma(_1496, _1500, _1482);
                    float _1504 = fma(_1488, _1502, _1496);
                    float _1506 = _1504 * 2.3283064365386962890625e-10;
                    _1420 = as_type<int>(_1506);
                    _1408 = as_type<int>(_1496);
                    _1410 = as_type<int>(_1492);
                }
            }
        }
    }
    int _1508 = _1420;
    int _1510 = _1408;
    int _1512 = _1410;
    int _1514 = _1412;
    _1386 = _1508;
    _1387 = _1385;
    _1388 = 0;
    _1389 = _1510;
    _1390 = _1512;
    _1391 = _1514;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _235 = false;
    float _51 = in.m_36.x;
    float _53 = in.m_36.y;
    float2 _588 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_588, float2(0.0), isnan(_588))).x;
    float2 _599 = float2(_51, _53);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_599, float2(0.0), isnan(_599))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float _67 = in.m_38.y;
    float _69 = in.m_38.x;
    float _71 = in.m_38.z;
    float _73 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _75 = -_73;
    float _77 = _67 * _75;
    float _79 = -_73;
    float _81 = _69 * _79;
    float _83 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _85 = _77 + _83;
    float _87 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _89 = _81 + _87;
    float _91 = -_73;
    float _93 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _95 = fma(_71, _91, _93);
    float _97 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _99 = _85 * _85;
    float _101 = fma(_63, 2.0, -1.0);
    float _103 = fma(_65, 2.0, -1.0);
    float _105 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[8].x, _97);
    float _107 = fma(_89, _89, _99);
    float _109 = _77 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _111 = _77 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _113 = -_73;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].z, _105);
    float _117 = fma(_95, _95, _107);
    float _119 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, _109);
    float _121 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[9].x, _111);
    float _123 = sqrt(_117);
    float _125 = -_73;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[7].z, _119);
    float _129 = -_73;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].z, _121);
    float _133 = _101 * _85;
    float _135 = fma(_61, 2.0, -1.0);
    float _137 = _115 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _131 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _141 = rsqrt(_117);
    float _143 = fma(_135, _89, _133);
    float _145 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _147 = _137 + _145;
    float _149 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _151 = _139 + _149;
    float _153 = fma(_103, _95, _143);
    float _155 = _147 * _147;
    float _157 = -_123;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _127 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _165 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _167 = _163 + _165;
    float _169 = abs(_161);
    float _171 = log2(_169);
    float _173 = -_141;
    float _175 = fma(_173, _153, 0.0);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_167, _167, _155);
    float _181 = _177 + 0.001000000047497451305389404296875;
    float _183 = fma(_151, _151, _179);
    float _185 = abs(_181);
    float _187 = -_185;
    float _189 = _187 + 1.0;
    float _191 = sqrt(_183);
    float _193 = fma(_181, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _195 = as_type<int>(_189) + (-218103808);
    float _197 = _171 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _199 = fma(_181, _193, -0.212114393711090087890625);
    bool _203 = uint(_195) >= 1920991232u;
    float _205 = fma(_181, _199, 1.570728778839111328125);
    float _207 = exp2(_197);
    float _209 = _191 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _211 = !_203;
    float _233;
    if (!_211)
    {
        int _213 = as_type<int>(_189);
        int _215 = as_type<int>(_133);
        int _217 = 1073741824;
        int _219 = 1056;
        int _221;
        int _223;
        int _225;
        int _227;
        int _229;
        int _231;
        _47(_213, _215, _217, _219, _221, _223, _225, _227, _229, _231);
        _233 = as_type<float>(_221);
        _235 = true;
    }
    else
    {
        float _237 = rsqrt(_189);
        float _239 = _189 * _237;
        float _241 = _237 * 0.5;
        float _243 = -_239;
        float _245 = 0.0 + _243;
        float _247 = fma(_241, _245, 0.5);
        float _249 = fma(_239, _247, _239);
        float _251 = -_249;
        float _253 = 0.0 + _251;
        float _255 = fma(_249, _253, _189);
        float _257 = fma(_241, _255, _249);
        _233 = _257;
    }
    _235 = false;
    float _259 = _233;
    float _261 = rsqrt(_183);
    float _263 = _205 * _259;
    float _265 = fma(_167, _261, 1.0);
    float _267 = _147 * _261;
    float _269 = _151 * _261;
    float _271 = 1.0 / _265;
    float _273 = -_267;
    float _275 = _267 * _273;
    float _277 = -_269;
    float _279 = _267 * _277;
    float _281 = -_269;
    float _283 = _269 * _281;
    float _285 = _275 + _283;
    float _287 = _279 * _271;
    float _289 = fma(_283, _271, 1.0);
    float _291 = fma(_275, _271, 1.0);
    float _293 = fma(_285, _271, 1.0);
    float _295 = _269 * _287;
    float _297 = _287 * _287;
    float _299 = _269 * _291;
    float _301 = _287 * _293;
    float _303 = -_295;
    float _305 = fma(_267, _289, _303);
    float _307 = -_297;
    float _309 = fma(_291, _289, _307);
    float _311 = -_299;
    float _313 = fma(_267, _287, _311);
    float _315 = -_275;
    float _317 = fma(_293, _291, _315);
    float _319 = -_305;
    float _321 = _267 * _319;
    float _323 = -_269;
    float _325 = -_301;
    float _327 = fma(_267, _323, _325);
    float _329 = _263 * 0.15915493667125701904296875;
    float _331 = -_301;
    float _333 = _279 + _331;
    float _335 = -_321;
    float _337 = fma(_293, _309, _335);
    float _339 = -_291;
    float _341 = _269 * _339;
    float _343 = -_283;
    float _345 = fma(_293, _289, _343);
    float _347 = -_267;
    float _349 = fma(_347, _289, _295);
    float _351 = -_269;
    float _353 = fma(_351, _313, _337);
    float _355 = -_289;
    float _357 = _267 * _355;
    float _359 = -_267;
    float _361 = -_341;
    float _363 = fma(_359, _287, _361);
    float _365 = _329 * 6.283185482025146484375;
    float _367 = cos(_365);
    float _369 = -_269;
    float _371 = -_357;
    float _373 = fma(_369, _287, _371);
    float _375 = abs(_191);
    float _377 = _375 * 2.0;
    float _379 = _377 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _381 = 1.0 / _353;
    float _383 = 1.0 / _367;
    float _385 = _309 * _381;
    float _387 = _373 * _381;
    float _389 = _363 * _381;
    float _391 = _349 * _381;
    float _393 = _345 * _381;
    float _395 = _191 * _385;
    float _397 = _191 * _387;
    float _399 = _313 * _381;
    float _401 = _191 * _389;
    float _403 = _327 * _381;
    float _405 = _333 * _381;
    float _407 = _377 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _409 = fma(_391, _379, _395);
    float _411 = fma(_393, _379, _397);
    float _413 = -_379;
    float _415 = fma(_391, _413, _395);
    float _417 = _317 * _381;
    float _419 = fma(_403, _379, _401);
    float _421 = fma(_399, _407, _409);
    float _423 = fma(_405, _407, _411);
    float _425 = -_379;
    float _427 = fma(_393, _425, _397);
    float _429 = -_379;
    float _431 = fma(_403, _429, _401);
    float _433 = fma(_417, _407, _419);
    float _435 = fma(_399, _407, _415);
    float _437 = abs(_421);
    float _439 = abs(_423);
    float _441 = precise::max(_437, _439);
    float _443 = fma(_405, _407, _427);
    float _445 = fma(_417, _407, _431);
    float _447 = _329 * 6.283185482025146484375;
    float _449 = sin(_447);
    float _451 = abs(_433);
    float _453 = precise::max(_451, _441);
    float _455 = -_407;
    float _457 = fma(_399, _455, _415);
    float _459 = abs(_435);
    float _461 = abs(_443);
    float _463 = precise::max(_459, _461);
    float _465 = -_407;
    float _467 = fma(_405, _465, _427);
    float _469 = -_407;
    float _471 = fma(_417, _469, _419);
    float _473 = 1.0 / _453;
    float _475 = abs(_445);
    float _477 = precise::max(_475, _463);
    float _479 = -_407;
    float _481 = fma(_399, _479, _409);
    float _483 = -_407;
    float _485 = fma(_417, _483, _431);
    float _487 = abs(_457);
    float _489 = abs(_467);
    float _491 = precise::max(_487, _489);
    float _493 = -_407;
    float _495 = fma(_405, _493, _411);
    float _497 = abs(_485);
    float _499 = precise::max(_497, _491);
    float _501 = _449 * _383;
    float _503 = abs(_481);
    float _505 = abs(_495);
    float _507 = precise::max(_503, _505);
    float _509 = 1.0 / _477;
    float _511 = _501 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _513 = abs(_471);
    float _515 = precise::max(_513, _507);
    float _517 = _421 * _473;
    float _519 = _423 * _473;
    float _521 = precise::max(_511, 0.001000000047497451305389404296875);
    float _523 = 1.0 / _499;
    float _525 = -_209;
    float _527 = fma(_525, _521, _209);
    float _529 = _433 * _473;
    float _531 = 1.0 / _515;
    float _533 = _443 * _509;
    float _535 = _435 * _509;
    float _537 = _445 * _509;
    float3 _1293 = float3(_517, _519, _529);
    float _539 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1293, float3(0.0), isnan(_1293)), _527);
    float _541 = _467 * _523;
    float _543 = _457 * _523;
    float3 _1310 = float3(_535, _533, _537);
    float _545 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1310, float3(0.0), isnan(_1310)), _527);
    float _547 = _485 * _523;
    float _549 = _495 * _531;
    float _551 = _481 * _531;
    float _553 = _471 * _531;
    float3 _1331 = float3(_551, _549, _553);
    float _555 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1331, float3(0.0), isnan(_1331)), _527);
    float3 _1340 = float3(_543, _541, _547);
    float _557 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1340, float3(0.0), isnan(_1340)), _527);
    float _559 = _539 + _545;
    float _561 = _559 + _555;
    float _563 = _561 + _557;
    float _565 = _207 * _563;
    float _567 = _565 * 0.25;
    float _569 = _177 * _567;
    float _571 = _569 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _573 = _569 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _575 = _569 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_41.x = _571;
    out.m_41.y = _573;
    out.m_41.z = _575;
    return out;
}

