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
void _47(thread const int& _1391, thread const int& _1392, thread const int& _1393, thread const int& _1394, thread int& _1395, thread int& _1396, thread int& _1397, thread int& _1398, thread int& _1399, thread int& _1400)
{
    float _1403 = as_type<float>(_1391) + 0.0;
    bool _1405 = _1403 != 0.0;
    bool _1407 = isnan(_1403);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan(0.0);
    bool _1413 = _1409 || _1411;
    int _1415 = as_type<int>(_1403);
    int _1417 = _1392;
    int _1419 = _1393;
    int _1421 = _1413 ? (-1) : 0;
    if (!_1413)
    {
        float _1423 = as_type<float>(_1391) * 1.0;
        _1415 = as_type<int>(_1423);
    }
    int _1425 = _1415;
    bool _1427 = !_1413;
    int _1429 = _1425;
    if (!_1427)
    {
        float _1431 = as_type<float>(_1391) + 0.0;
        bool _1433 = _1431 >= 0.0;
        bool _1435 = isnan(_1431);
        bool _1437 = _1433 || _1435;
        bool _1439 = isnan(0.0);
        bool _1441 = _1437 || _1439;
        int _1443 = as_type<int>(_1431);
        _1421 = _1441 ? (-1) : 0;
        if (!_1441)
        {
            _1443 = 2147483647;
        }
        int _1445 = _1443;
        bool _1447 = !_1441;
        _1429 = _1445;
        if (!_1447)
        {
            float _1449 = abs(as_type<float>(_1391));
            float _1451 = _1449 + 0.0;
            bool _1453 = _1451 > as_type<float>(0x7f800000u /* inf */);
            bool _1455 = isnan(_1451);
            bool _1457 = _1453 || _1455;
            bool _1459 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1461 = _1457 || _1459;
            int _1463 = as_type<int>(_1451);
            _1421 = _1461 ? (-1) : 0;
            if (_1461)
            {
                float _1465 = as_type<float>(_1391) + 1.0;
                _1463 = as_type<int>(_1465);
            }
            int _1467 = _1463;
            _1429 = _1467;
            if (!_1461)
            {
                float _1469 = abs(as_type<float>(_1391));
                float _1471 = _1469 + (-0.0);
                float _1473 = 0.0 + _1471;
                bool _1475 = _1473 != as_type<float>(0x7f800000u /* inf */);
                bool _1477 = isnan(_1473);
                bool _1479 = _1475 || _1477;
                bool _1481 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1483 = _1479 || _1481;
                int _1485 = as_type<int>(_1473);
                _1421 = _1483 ? (-1) : 0;
                if (!_1483)
                {
                    _1485 = _1391;
                }
                int _1487 = _1485;
                bool _1489 = !_1483;
                _1429 = _1487;
                if (!_1489)
                {
                    float _1491 = as_type<float>(_1391) * 18446744073709551616.0;
                    float _1493 = rsqrt(_1491);
                    float _1495 = _1491 * _1493;
                    float _1497 = _1493 * 0.5;
                    float _1499 = -_1495;
                    float _1501 = 0.0 + _1499;
                    float _1503 = fma(_1497, _1501, 0.5);
                    float _1505 = fma(_1495, _1503, _1495);
                    float _1507 = -_1505;
                    float _1509 = 0.0 + _1507;
                    float _1511 = fma(_1505, _1509, _1491);
                    float _1513 = fma(_1497, _1511, _1505);
                    float _1515 = _1513 * 2.3283064365386962890625e-10;
                    _1429 = as_type<int>(_1515);
                    _1417 = as_type<int>(_1505);
                    _1419 = as_type<int>(_1501);
                }
            }
        }
    }
    int _1517 = _1429;
    int _1519 = _1417;
    int _1521 = _1419;
    int _1523 = _1421;
    _1395 = _1517;
    _1396 = _1394;
    _1397 = 0;
    _1398 = _1519;
    _1399 = _1521;
    _1400 = _1523;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _235 = false;
    float _51 = in.m_36.x;
    float _53 = in.m_36.y;
    float2 _590 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_590, float2(0.0), isnan(_590))).x;
    float2 _601 = float2(_51, _53);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_601, float2(0.0), isnan(_601))).xyz;
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
    float _97 = _77 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _99 = _85 * _85;
    float _101 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _103 = _77 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _105 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, _97);
    float _107 = fma(_89, _89, _99);
    float _109 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[8].x, _101);
    float _111 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[9].x, _103);
    float _113 = -_73;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[7].z, _105);
    float _117 = fma(_95, _95, _107);
    float _119 = -_73;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _109);
    float _123 = -_73;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].z, _111);
    float _127 = fma(_63, 2.0, -1.0);
    float _129 = sqrt(_117);
    float _131 = fma(_61, 2.0, -1.0);
    float _133 = _127 * _85;
    float _135 = fma(_65, 2.0, -1.0);
    float _137 = _115 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _139 = _125 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _141 = fma(_131, _89, _133);
    float _143 = rsqrt(_117);
    float _145 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _147 = _137 + _145;
    float _149 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _151 = _139 + _149;
    float _153 = fma(_135, _95, _141);
    float _155 = -_129;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _121 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _163 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _165 = _161 + _163;
    float _167 = abs(_159);
    float _169 = log2(_167);
    float _171 = -_143;
    float _173 = fma(_171, _153, 0.0);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _165 * _165;
    float _179 = _175 + 0.001000000047497451305389404296875;
    float _181 = fma(_147, _147, _177);
    float _183 = abs(_179);
    float _185 = -_183;
    float _187 = _185 + 1.0;
    float _189 = fma(_151, _151, _181);
    float _191 = fma(_179, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _193 = sqrt(_189);
    float _195 = _169 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    int _197 = as_type<int>(_187) + (-218103808);
    float _199 = fma(_179, _191, -0.212114393711090087890625);
    bool _203 = uint(_197) >= 1920991232u;
    float _205 = fma(_179, _199, 1.570728778839111328125);
    float _207 = exp2(_195);
    float _209 = _193 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _211 = !_203;
    float _233;
    if (!_211)
    {
        int _213 = as_type<int>(_187);
        int _215 = as_type<int>(_117);
        int _217 = as_type<int>(_101);
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
        float _237 = rsqrt(_187);
        float _239 = _187 * _237;
        float _241 = _237 * 0.5;
        float _243 = -_239;
        float _245 = 0.0 + _243;
        float _247 = fma(_241, _245, 0.5);
        float _249 = fma(_239, _247, _239);
        float _251 = -_249;
        float _253 = 0.0 + _251;
        float _255 = fma(_249, _253, _187);
        float _257 = fma(_241, _255, _249);
        _233 = _257;
    }
    _235 = false;
    float _259 = _233;
    float _261 = rsqrt(_189);
    float _263 = _205 * _259;
    float _265 = fma(_147, _261, 1.0);
    float _267 = _165 * _261;
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
    float _301 = -_275;
    float _303 = fma(_293, _291, _301);
    float _305 = -_295;
    float _307 = fma(_267, _289, _305);
    float _309 = -_297;
    float _311 = fma(_291, _289, _309);
    float _313 = -_299;
    float _315 = fma(_267, _287, _313);
    float _317 = _287 * _293;
    float _319 = -_307;
    float _321 = _267 * _319;
    float _323 = -_269;
    float _325 = -_317;
    float _327 = fma(_267, _323, _325);
    float _329 = -_321;
    float _331 = fma(_293, _311, _329);
    float _333 = -_291;
    float _335 = _269 * _333;
    float _337 = -_283;
    float _339 = fma(_293, _289, _337);
    float _341 = -_267;
    float _343 = fma(_341, _289, _295);
    float _345 = -_269;
    float _347 = fma(_345, _315, _331);
    float _349 = -_289;
    float _351 = _267 * _349;
    float _353 = -_267;
    float _355 = -_335;
    float _357 = fma(_353, _287, _355);
    float _359 = _263 * 0.15915493667125701904296875;
    float _361 = -_317;
    float _363 = _279 + _361;
    float _365 = -_269;
    float _367 = -_351;
    float _369 = fma(_365, _287, _367);
    float _371 = 1.0 / _347;
    float _373 = abs(_193);
    float _375 = _373 * 2.0;
    float _377 = _375 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _379 = _359 * 6.283185482025146484375;
    float _381 = cos(_379);
    float _383 = _311 * _371;
    float _385 = _369 * _371;
    float _387 = _357 * _371;
    float _389 = _343 * _371;
    float _391 = _339 * _371;
    float _393 = _193 * _383;
    float _395 = _193 * _385;
    float _397 = _315 * _371;
    float _399 = _327 * _371;
    float _401 = _363 * _371;
    float _403 = _193 * _387;
    float _405 = _375 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _407 = fma(_389, _377, _393);
    float _409 = fma(_391, _377, _395);
    float _411 = _303 * _371;
    float _413 = -_377;
    float _415 = fma(_389, _413, _393);
    float _417 = fma(_399, _377, _403);
    float _419 = fma(_397, _405, _407);
    float _421 = fma(_401, _405, _409);
    float _423 = -_377;
    float _425 = fma(_391, _423, _395);
    float _427 = _359 * 6.283185482025146484375;
    float _429 = sin(_427);
    float _431 = fma(_411, _405, _417);
    float _433 = -_377;
    float _435 = fma(_399, _433, _403);
    float _437 = abs(_419);
    float _439 = abs(_421);
    float _441 = precise::max(_437, _439);
    float _443 = fma(_397, _405, _415);
    float _445 = fma(_401, _405, _425);
    float _447 = -_405;
    float _449 = fma(_397, _447, _407);
    float _451 = -_405;
    float _453 = fma(_397, _451, _415);
    float _455 = 1.0 / _381;
    float _457 = abs(_431);
    float _459 = precise::max(_457, _441);
    float _461 = fma(_411, _405, _435);
    float _463 = abs(_443);
    float _465 = abs(_445);
    float _467 = precise::max(_463, _465);
    float _469 = -_405;
    float _471 = fma(_401, _469, _425);
    float _473 = -_405;
    float _475 = fma(_411, _473, _435);
    float _477 = -_405;
    float _479 = fma(_401, _477, _409);
    float _481 = abs(_461);
    float _483 = precise::max(_481, _467);
    float _485 = -_405;
    float _487 = fma(_411, _485, _417);
    float _489 = abs(_453);
    float _491 = abs(_471);
    float _493 = precise::max(_489, _491);
    float _495 = 1.0 / _459;
    float _497 = abs(_449);
    float _499 = abs(_479);
    float _501 = precise::max(_497, _499);
    float _503 = abs(_487);
    float _505 = precise::max(_503, _501);
    float _507 = _429 * _455;
    float _509 = abs(_475);
    float _511 = precise::max(_509, _493);
    float _513 = 1.0 / _483;
    float _515 = _507 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _517 = precise::max(_515, 0.001000000047497451305389404296875);
    float _519 = 1.0 / _505;
    float _521 = _421 * _495;
    float _523 = _431 * _495;
    float _525 = _419 * _495;
    float _527 = -_209;
    float _529 = fma(_527, _517, _209);
    float _531 = 1.0 / _511;
    float _533 = _445 * _513;
    float _535 = _461 * _513;
    float _537 = _443 * _513;
    float3 _1296 = float3(_525, _521, _523);
    float _539 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1296, float3(0.0), isnan(_1296)), _529);
    float _541 = _479 * _519;
    float _543 = _449 * _519;
    float3 _1313 = float3(_537, _533, _535);
    float _545 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1313, float3(0.0), isnan(_1313)), _529);
    float _547 = _453 * _531;
    float _549 = _471 * _531;
    float _551 = _487 * _519;
    float _553 = _475 * _531;
    float3 _1334 = float3(_543, _541, _551);
    float _555 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1334, float3(0.0), isnan(_1334)), _529);
    float3 _1343 = float3(_547, _549, _553);
    float _557 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1343, float3(0.0), isnan(_1343)), _529);
    float _559 = _539 + _545;
    float _561 = _559 + _555;
    float _563 = _561 + _557;
    float _565 = _207 * _563;
    float _567 = _565 * 0.25;
    float _569 = _175 * _567;
    float _571 = _569 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _573 = _571 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _575 = _571 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _577 = _571 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_41.x = _573;
    out.m_41.y = _575;
    out.m_41.z = _577;
    out.m_41.w = 0.0;
    return out;
}

