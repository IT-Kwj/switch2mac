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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c1 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c7 [[id(4)]];
    constant _16* cp_c3 [[id(5)]];
    constant _16* cp_c4 [[id(6)]];
    device _33* cp_s0 [[id(7)]];
    device _33* cp_s1 [[id(8)]];
    device _33* cp_s2 [[id(9)]];
    device _33* cp_s3 [[id(10)]];
    texture2d<float> cp_t_tcb_8 [[id(11)]];
    sampler cp_t_tcb_8Smplr [[id(12)]];
    texture2d<float> cp_t_tcb_A [[id(13)]];
    sampler cp_t_tcb_ASmplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_E [[id(15)]];
    sampler cp_t_tcb_ESmplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_10 [[id(17)]];
    sampler cp_t_tcb_10Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_12 [[id(19)]];
    sampler cp_t_tcb_12Smplr [[id(20)]];
    texture2d_array<float> cp_t_tcb_C [[id(21)]];
    sampler cp_t_tcb_CSmplr [[id(22)]];
    sampler cp_t_tcb_8Smplr_w [[id(23)]];
    sampler cp_t_tcb_ASmplr_w [[id(24)]];
    sampler cp_t_tcb_ESmplr_w [[id(25)]];
    sampler cp_t_tcb_10Smplr_w [[id(26)]];
    sampler cp_t_tcb_12Smplr_w [[id(27)]];
    sampler cp_t_tcb_CSmplr_w [[id(28)]];
    constant dm_border_t* dm_border [[id(29)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _997 = false;
    bool _927 = false;
    bool _925 = false;
    bool _509 = false;
    bool _439 = false;
    bool _437 = false;
    float _73 = as_type<float>(gl_WorkGroupID.x);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    int _78 = as_type<int>(_73) << 6;
    int _80 = _78 + as_type<int>(_75);
    bool _84 = uint(_80) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_84)
    {
        return;
    }
    int _86 = _80 * 48;
    int _88 = _86 + 40;
    int _90 = _86 + 16;
    uint _93 = uint(int(uint(_86) >> uint(2)));
    float _95 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_93)]);
    int _97 = _86 + 4;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_99)]);
    int _103 = _86 + 8;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_105)]);
    int _109 = _86 + 12;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_111)]);
    uint _115 = uint(int(uint(_88) >> uint(2)));
    float _117 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_115)]);
    int _119 = _86 + 32;
    int _121 = _86 + 36;
    uint _123 = uint(int(uint(_90) >> uint(2)));
    float _125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_123)]);
    int _127 = _90 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_129)]);
    int _133 = _90 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_135)]);
    int _139 = _90 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_141)]);
    uint _145 = uint(int(uint(_119) >> uint(2)));
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_145)]);
    uint _149 = uint(int(uint(_121) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_149)]);
    bool _153 = as_type<int>(_117) != 0;
    uint _155 = 0u;
    if (!_153)
    {
        int _157 = _80 << 6;
        int _159 = _157 + 48;
        _155 = uint(_159);
    }
    uint _161 = _155;
    if (!_153)
    {
        uint _163 = uint(int(uint(int(_161)) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_163)] = 0u;
        int _165 = int(_161) + 4;
        uint _167 = uint(int(uint(_165) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_167)] = 0u;
        int _169 = int(_161) + 8;
        uint _171 = uint(int(uint(_169) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_171)] = 0u;
        int _173 = int(_161) + 12;
        uint _175 = uint(int(uint(_173) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_175)] = 0u;
    }
    if (!_153)
    {
        return;
    }
    float _177 = fma(_95, 6.2500002968590706586837768554688e-05, 0.5);
    float _179 = fma(_107, 6.2500002968590706586837768554688e-05, 0.5);
    float _181 = fma(_125, 6.2500002968590706586837768554688e-05, 0.5);
    float _183 = fma(_137, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1854 = float2(_177, _179);
    float _185 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1854, float2(0.0), isnan(_1854)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1854, float2(0.0), isnan(_1854)), level(0.0)).x;
    float2 _1865 = float2(_181, _183);
    float _187 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1865, float2(0.0), isnan(_1865)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1865, float2(0.0), isnan(_1865)), level(0.0)).x;
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[64]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[65]);
    int _193 = _86 + 44;
    float2 _1884 = float2(_177, _179);
    float _195 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1884, float2(0.0), isnan(_1884)), level(_185)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1884, float2(0.0), isnan(_1884)), level(_185)).y;
    float2 _1893 = float2(_181, _183);
    float _197 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1893, float2(0.0), isnan(_1893)), level(_187)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1893, float2(0.0), isnan(_1893)), level(_187)).y;
    uint _199 = uint(int(uint(_193) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_199)]);
    int _203 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 4;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 8;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z) << 4;
    float _221 = 0.0;
    float _223 = _177;
    float _225 = _179;
    float _227 = _181;
    int _229 = as_type<int>(_183);
    bool _231 = _205;
    int _233 = _213 ? (-1) : 0;
    if (_205)
    {
        float _235 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _237 = _95 + _235;
        _221 = _237;
    }
    float _239 = _221;
    float _241 = 0.0;
    float _243 = _239;
    if (_205)
    {
        float _245 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _247 = _107 + _245;
        _241 = _247;
    }
    float _249 = _241;
    float _251 = 0.0;
    float _253 = _249;
    if (_209)
    {
        float _255 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
        float _257 = _95 + _255;
        _251 = _257;
    }
    float _259 = _251;
    float _261 = 0.0;
    if (_209)
    {
        float _263 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
        float _265 = _107 + _263;
        _261 = _265;
    }
    float _267 = _261;
    float _269 = _267;
    if (_205)
    {
        float _271 = abs(_239);
        float _273 = abs(_249);
        float _275 = precise::max(_271, _273);
        _253 = _275;
    }
    float _277 = _253;
    int _279 = as_type<int>(_277);
    if (!_205)
    {
        _243 = 10000.0;
    }
    float _281 = _243;
    float _283 = _281;
    if (_209)
    {
        float _285 = abs(_259);
        float _287 = abs(_267);
        float _289 = precise::max(_285, _287);
        _269 = _289;
    }
    float _291 = _269;
    float _293 = _291;
    if (_205)
    {
        float _295 = precise::min(_277, 10000.0);
        _283 = _295;
    }
    float _297 = _283;
    float _299 = _297;
    if (_213)
    {
        float _301 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
        float _303 = _95 + _301;
        _223 = _303;
    }
    float _305 = _223;
    float _307 = _305;
    if (_213)
    {
        float _309 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
        float _311 = _107 + _309;
        _225 = _311;
    }
    float _313 = _225;
    bool _315 = false;
    float _317 = _313;
    if (_209)
    {
        bool _319 = _297 > _291;
        _315 = _319;
    }
    bool _321 = _315;
    int _323 = _321 ? (-1) : 0;
    if (_213)
    {
        float _325 = abs(_305);
        float _327 = abs(_313);
        float _329 = precise::max(_325, _327);
        _307 = _329;
    }
    float _331 = _307;
    if (_217)
    {
        float _333 = -_189;
        float _335 = _95 + _333;
        _317 = _335;
    }
    float _337 = _317;
    if (_209)
    {
        float _339 = _321 ? _291 : _297;
        _299 = _339;
    }
    float _341 = _299;
    float _343 = _341;
    if (_217)
    {
        float _345 = -_191;
        float _347 = _107 + _345;
        _227 = _347;
    }
    float _349 = _227;
    float _351 = _349;
    if (!_209)
    {
        _229 = 0;
    }
    int _353 = _229;
    bool _355 = false;
    int _357 = _353;
    if (_213)
    {
        bool _359 = _341 > _331;
        _355 = _359;
    }
    bool _361 = _355;
    if (_217)
    {
        float _363 = abs(_337);
        float _365 = abs(_349);
        float _367 = precise::max(_363, _365);
        _351 = _367;
    }
    float _369 = _351;
    float _371 = _369;
    if (_213)
    {
        float _373 = _361 ? _331 : _341;
        _343 = _373;
    }
    float _375 = _343;
    if (_209)
    {
        bool _377 = !_321;
        int _379 = _377 ? 0 : 1;
        _357 = _379;
    }
    int _381 = _357;
    int _383 = _381;
    if (_217)
    {
        bool _385 = _375 > _369;
        _323 = _385 ? (-1) : 0;
    }
    int _387 = _323;
    if (_213)
    {
        bool _389 = !_361;
        int _391 = _389 ? _381 : 2;
        _383 = _391;
    }
    int _393 = _383;
    int _395 = _393;
    if (_217)
    {
        int _397 = ~_387;
        int _399 = (_397 != 0) ? _393 : 3;
        _395 = _399;
    }
    int _401 = _395;
    bool _403 = _401 != 0;
    bool _405 = !_403;
    float _407 = as_type<float>(_401);
    bool _409 = _403;
    float _431;
    float _433;
    float _507;
    if (!_405)
    {
        int _411 = _401 + (-1);
        uint _413 = min(uint(_411), 3u);
        int _415 = int(_413) << 2;
        uint _417 = uint(int(uint(_415) >> uint(2)));
        uint _419 = uint(int(uint(int(_417)) >> uint(2)));
        int _421 = int(_417) & 3;
        float _423 = (*spvDescriptorSet0.cp_c1)._m0[int(_419)][_421];
        int _425 = as_type<int>(_423) >> 31;
        bool _427 = as_type<int>(_423) == 1232;
        float _429 = as_type<float>(_415);
        _431 = _423;
        _433 = as_type<float>(_425);
        if (!_427)
        {
            bool _435 = as_type<int>(_423) == 1552;
            _437 = _435;
            if (!_437)
            {
                _439 = true;
            }
        }
        if (!_437)
        {
            if (!_439)
            {
                float _441 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _443 = _95 + _441;
                int _445 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                float _447 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _449 = _107 + _447;
                float _451 = abs(_443);
                float _453 = abs(_449);
                float _455 = precise::max(_451, _453);
                uint _457 = uint(int(uint(_445) >> uint(2)));
                uint _459 = uint(int(uint(int(_457)) >> uint(2)));
                int _461 = int(_457) & 3;
                float _463 = (*spvDescriptorSet0.cp_c6)._m0[int(_459)][_461];
                float _465 = _455 * _463;
                float _467 = _465 * 4.0;
                float _469 = precise::max(_467, 1.0);
                float _471 = log2(_469);
                float _473 = precise::min(_471, 5.0);
                float _475 = floor(_473);
                int _477 = int(_475);
                float _479 = floor(_473);
                int _481 = _477 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                int _483 = _481 << 4;
                float _485 = rint(_479);
                float _487 = precise::max(_485, 0.0);
                uint _489 = uint(_487);
                uint _491 = clamp(_489, 0u, 65535u);
                uint _493 = uint(int(uint(_483) >> uint(2)));
                uint _495 = uint(int(uint(int(_493)) >> uint(2)));
                int _497 = int(_493) & 3;
                float _499 = (*spvDescriptorSet0.cp_c6)._m0[int(_495)][_497];
                float _501 = fma(_499, _449, 0.5);
                float _503 = fma(_499, _443, 0.5);
                float3 _2358 = float3(_503, _501, float(int(_491)));
                float3 _2362 = select(_2358, float3(0.0), isnan(_2358));
                float _505 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _2362.xy, uint(rint(_2362.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _2362.xy, uint(rint(_2362.z)), level(0.0)).y;
                _431 = _471;
                _433 = _473;
                _371 = _479;
                _407 = _499;
                _279 = int(_491);
                _507 = _505;
                _293 = _443;
                _509 = true;
            }
        }
        if (((!_509) || _439) || _437)
        {
            if ((!_439) || _437)
            {
                _437 = false;
                float _511 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _513 = _95 + _511;
                int _515 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                float _517 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _519 = _107 + _517;
                float _521 = abs(_513);
                float _523 = abs(_519);
                float _525 = precise::max(_521, _523);
                uint _527 = uint(int(uint(_515) >> uint(2)));
                uint _529 = uint(int(uint(int(_527)) >> uint(2)));
                int _531 = int(_527) & 3;
                float _533 = (*spvDescriptorSet0.cp_c7)._m0[int(_529)][_531];
                float _535 = _525 * _533;
                float _537 = _535 * 4.0;
                float _539 = precise::max(_537, 1.0);
                float _541 = log2(_539);
                float _543 = precise::min(_541, 5.0);
                float _545 = floor(_543);
                int _547 = int(_545);
                float _549 = floor(_543);
                int _551 = _547 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                int _553 = _551 << 4;
                float _555 = rint(_549);
                float _557 = precise::max(_555, 0.0);
                uint _559 = uint(_557);
                uint _561 = clamp(_559, 0u, 65535u);
                uint _563 = uint(int(uint(_553) >> uint(2)));
                uint _565 = uint(int(uint(int(_563)) >> uint(2)));
                int _567 = int(_563) & 3;
                float _569 = (*spvDescriptorSet0.cp_c7)._m0[int(_565)][_567];
                float _571 = fma(_569, _519, 0.5);
                float _573 = fma(_569, _513, 0.5);
                float3 _2484 = float3(_573, _571, float(int(_561)));
                float3 _2486 = select(_2484, float3(0.0), isnan(_2484));
                float _575 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _2486.xy, uint(rint(_2486.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _2486.xy, uint(rint(_2486.z)), level(0.0)).y;
                _431 = _541;
                _433 = _543;
                _371 = _549;
                _407 = _569;
                _279 = int(_561);
                _507 = _575;
                _293 = _513;
                _509 = true;
            }
            if ((!_509) || _439)
            {
                _439 = false;
                bool _577 = _401 != 3;
                _409 = _577;
                if (_577)
                {
                    _429 = 0.0;
                }
                float _579 = _429;
                _507 = _579;
                _509 = _577;
                if (!_509)
                {
                    float _581 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                    float _583 = -_189;
                    float _585 = _95 + _583;
                    int _587 = as_type<int>(_581) << 4;
                    uint _589 = uint(int(uint(_587) >> uint(2)));
                    float _591 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_589)]);
                    float _593 = -_191;
                    float _595 = _107 + _593;
                    float _597 = abs(_585);
                    float _599 = abs(_595);
                    float _601 = precise::max(_597, _599);
                    float _603 = _591 * _601;
                    float _605 = _603 * 4.0;
                    float _607 = precise::max(_605, 1.0);
                    float _609 = log2(_607);
                    float _611 = precise::min(_609, 5.0);
                    float _613 = floor(_611);
                    int _615 = int(_613);
                    int _617 = as_type<int>(_581) + _615;
                    int _619 = _617 << 4;
                    int _621 = _619 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[38].x);
                    bool _623 = uint(_621) < uint(_619);
                    int _625 = int(_623);
                    int _627 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[38].y) + _625;
                    uint _629 = uint(int(uint(_619) >> uint(2)));
                    float _631 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_629)]);
                    float _633 = floor(_611);
                    float _635 = rint(_633);
                    float _637 = precise::max(_635, 0.0);
                    uint _639 = uint(_637);
                    uint _641 = clamp(_639, 0u, 65535u);
                    float _643 = fma(_631, _595, 0.5);
                    float _645 = fma(_631, _585, 0.5);
                    float3 _2616 = float3(_645, _643, float(int(_641)));
                    float3 _2618 = select(_2616, float3(0.0), isnan(_2616));
                    float _647 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2618.xy, uint(rint(_2618.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2618.xy, uint(rint(_2618.z)), level(0.0)).y;
                    _431 = as_type<float>(_641);
                    _433 = _645;
                    _371 = _631;
                    _407 = as_type<float>(_627);
                    _409 = _623;
                    _279 = as_type<int>(_609);
                    _507 = _647;
                    _293 = _595;
                    _509 = true;
                }
            }
        }
    }
    else
    {
        float _649 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _651 = _95 + _649;
        float _653 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _655 = _107 + _653;
        uint _657 = uint(int(uint(_219) >> uint(2)));
        uint _659 = uint(int(uint(int(_657)) >> uint(2)));
        int _661 = int(_657) & 3;
        float _663 = (*spvDescriptorSet0.cp_c5)._m0[int(_659)][_661];
        float _665 = abs(_651);
        float _667 = abs(_655);
        float _669 = precise::max(_665, _667);
        float _671 = _669 * _663;
        float _673 = _671 * 4.0;
        float _675 = precise::max(_673, 1.0);
        float _677 = log2(_675);
        float _679 = precise::min(_677, 5.0);
        float _681 = floor(_679);
        int _683 = int(_681);
        float _685 = floor(_679);
        int _687 = _683 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
        int _689 = _687 << 4;
        float _691 = rint(_685);
        float _693 = precise::max(_691, 0.0);
        uint _695 = uint(_693);
        uint _697 = clamp(_695, 0u, 65535u);
        uint _699 = uint(int(uint(_689) >> uint(2)));
        uint _701 = uint(int(uint(int(_699)) >> uint(2)));
        int _703 = int(_699) & 3;
        float _705 = (*spvDescriptorSet0.cp_c5)._m0[int(_701)][_703];
        float _707 = fma(_705, _655, 0.5);
        float _709 = fma(_705, _651, 0.5);
        float3 _2729 = float3(_709, _707, float(int(_697)));
        float3 _2731 = select(_2729, float3(0.0), isnan(_2729));
        float _711 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2731.xy, uint(rint(_2731.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2731.xy, uint(rint(_2731.z)), level(0.0)).y;
        _431 = _677;
        _433 = _679;
        _371 = _685;
        _407 = _705;
        _279 = int(_697);
        _507 = _711;
        _293 = _651;
    }
    _509 = false;
    float _713 = _431;
    float _715 = _433;
    float _717 = _371;
    float _719 = _407;
    bool _721 = _409;
    int _723 = _279;
    float _725 = _507;
    float _727 = _293;
    float _729 = _713;
    float _731 = _715;
    float _733 = _717;
    float _735 = _719;
    int _737 = _723;
    bool _739 = _721;
    float _741 = _727;
    if (_205)
    {
        float _743 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _745 = _125 + _743;
        _729 = _745;
    }
    float _747 = _729;
    float _749 = _747;
    if (_205)
    {
        float _751 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _753 = _137 + _751;
        _731 = _753;
    }
    float _755 = _731;
    float _757 = _755;
    if (_209)
    {
        float _759 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
        float _761 = _125 + _759;
        _733 = _761;
    }
    float _763 = _733;
    float _765 = _763;
    if (_209)
    {
        float _767 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
        float _769 = _137 + _767;
        _735 = _769;
    }
    float _771 = _735;
    float _773 = _771;
    if (!_209)
    {
        _737 = 0;
    }
    int _775 = _737;
    int _777 = _775;
    if (_205)
    {
        float _779 = abs(_747);
        float _781 = abs(_755);
        float _783 = precise::max(_779, _781);
        _757 = _783;
    }
    float _785 = _757;
    float _787 = _785;
    if (!_205)
    {
        _749 = 10000.0;
    }
    float _789 = _749;
    float _791 = _789;
    if (_209)
    {
        float _793 = abs(_763);
        float _795 = abs(_771);
        float _797 = precise::max(_793, _795);
        _773 = _797;
    }
    float _799 = _773;
    float _801 = _799;
    if (_213)
    {
        float _803 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
        float _805 = _137 + _803;
        _765 = _805;
    }
    float _807 = _765;
    float _809 = _807;
    if (_205)
    {
        float _811 = precise::min(_785, 10000.0);
        _791 = _811;
    }
    float _813 = _791;
    float _815 = _813;
    if (_213)
    {
        float _817 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
        float _819 = _125 + _817;
        _787 = _819;
    }
    float _821 = _787;
    float _823 = _821;
    if (_209)
    {
        bool _825 = _813 > _799;
        _231 = _825;
    }
    bool _827 = _231;
    if (_213)
    {
        float _829 = abs(_821);
        float _831 = abs(_807);
        float _833 = precise::max(_829, _831);
        _823 = _833;
    }
    float _835 = _823;
    if (_217)
    {
        float _837 = -_189;
        float _839 = _125 + _837;
        _809 = _839;
    }
    float _841 = _809;
    if (_209)
    {
        float _843 = _827 ? _799 : _813;
        _815 = _843;
    }
    float _845 = _815;
    float _847 = _845;
    if (_217)
    {
        float _849 = -_191;
        float _851 = _137 + _849;
        _801 = _851;
    }
    float _853 = _801;
    float _855 = _853;
    if (_209)
    {
        bool _857 = !_827;
        int _859 = _857 ? 0 : 1;
        _777 = _859;
    }
    int _861 = _777;
    int _863 = _861;
    if (_213)
    {
        bool _865 = _845 > _835;
        _739 = _865;
    }
    bool _867 = _739;
    if (_217)
    {
        float _869 = abs(_841);
        float _871 = abs(_853);
        float _873 = precise::max(_869, _871);
        _855 = _873;
    }
    float _875 = _855;
    if (_213)
    {
        float _877 = _867 ? _835 : _845;
        _847 = _877;
    }
    float _879 = _847;
    if (_213)
    {
        bool _881 = !_867;
        int _883 = _881 ? _861 : 2;
        _863 = _883;
    }
    int _885 = _863;
    int _887 = _885;
    if (_217)
    {
        bool _889 = _879 > _875;
        _233 = _889 ? (-1) : 0;
    }
    int _891 = _233;
    if (_217)
    {
        int _893 = ~_891;
        int _895 = (_893 != 0) ? _885 : 3;
        _887 = _895;
    }
    int _897 = _887;
    bool _899 = _897 != 0;
    bool _901 = !_899;
    float _995;
    if (!_901)
    {
        int _903 = _897 + (-1);
        uint _905 = min(uint(_903), 3u);
        int _907 = int(_905) << 2;
        int _909 = _907 + 16;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        uint _913 = uint(int(uint(int(_911)) >> uint(2)));
        int _915 = int(_911) & 3;
        float _917 = (*spvDescriptorSet0.cp_c1)._m0[int(_913)][_915];
        bool _919 = as_type<int>(_917) == 3072;
        float _921 = _917;
        if (!_919)
        {
            bool _923 = as_type<int>(_917) == 3392;
            _925 = _923;
            if (!_925)
            {
                _927 = true;
            }
        }
        if (!_925)
        {
            if (!_927)
            {
                float _929 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _931 = _125 + _929;
                int _933 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                float _935 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _937 = _137 + _935;
                float _939 = abs(_931);
                float _941 = abs(_937);
                float _943 = precise::max(_939, _941);
                uint _945 = uint(int(uint(_933) >> uint(2)));
                uint _947 = uint(int(uint(int(_945)) >> uint(2)));
                int _949 = int(_945) & 3;
                float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
                float _953 = _943 * _951;
                float _955 = _953 * 4.0;
                float _957 = precise::max(_955, 1.0);
                float _959 = log2(_957);
                float _961 = precise::min(_959, 5.0);
                float _963 = floor(_961);
                int _965 = int(_963);
                float _967 = floor(_961);
                int _969 = _965 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                int _971 = _969 << 4;
                float _973 = rint(_967);
                float _975 = precise::max(_973, 0.0);
                uint _977 = uint(_975);
                uint _979 = clamp(_977, 0u, 65535u);
                uint _981 = uint(int(uint(_971) >> uint(2)));
                uint _983 = uint(int(uint(int(_981)) >> uint(2)));
                int _985 = int(_981) & 3;
                float _987 = (*spvDescriptorSet0.cp_c6)._m0[int(_983)][_985];
                float _989 = fma(_987, _937, 0.5);
                float _991 = fma(_987, _931, 0.5);
                float3 _3150 = float3(_991, _989, float(int(_979)));
                float3 _3152 = select(_3150, float3(0.0), isnan(_3150));
                float _993 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _3152.xy, uint(rint(_3152.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _3152.xy, uint(rint(_3152.z)), level(0.0)).y;
                _995 = _993;
                _997 = true;
            }
        }
        if (((!_997) || _927) || _925)
        {
            if ((!_927) || _925)
            {
                _925 = false;
                float _999 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _1001 = _125 + _999;
                int _1003 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                float _1005 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _1007 = _137 + _1005;
                float _1009 = abs(_1001);
                float _1011 = abs(_1007);
                float _1013 = precise::max(_1009, _1011);
                uint _1015 = uint(int(uint(_1003) >> uint(2)));
                uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
                int _1019 = int(_1015) & 3;
                float _1021 = (*spvDescriptorSet0.cp_c7)._m0[int(_1017)][_1019];
                float _1023 = _1013 * _1021;
                float _1025 = _1023 * 4.0;
                float _1027 = precise::max(_1025, 1.0);
                float _1029 = log2(_1027);
                float _1031 = precise::min(_1029, 5.0);
                float _1033 = floor(_1031);
                int _1035 = int(_1033);
                float _1037 = floor(_1031);
                int _1039 = _1035 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                int _1041 = _1039 << 4;
                float _1043 = rint(_1037);
                float _1045 = precise::max(_1043, 0.0);
                uint _1047 = uint(_1045);
                uint _1049 = clamp(_1047, 0u, 65535u);
                uint _1051 = uint(int(uint(_1041) >> uint(2)));
                uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
                int _1055 = int(_1051) & 3;
                float _1057 = (*spvDescriptorSet0.cp_c7)._m0[int(_1053)][_1055];
                float _1059 = fma(_1057, _1007, 0.5);
                float _1061 = fma(_1057, _1001, 0.5);
                float3 _3267 = float3(_1061, _1059, float(int(_1049)));
                float3 _3269 = select(_3267, float3(0.0), isnan(_3267));
                float _1063 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _3269.xy, uint(rint(_3269.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _3269.xy, uint(rint(_3269.z)), level(0.0)).y;
                _995 = _1063;
                _997 = true;
            }
            if ((!_997) || _927)
            {
                _927 = false;
                bool _1065 = _897 != 3;
                if (_1065)
                {
                    _921 = 0.0;
                }
                float _1067 = _921;
                _995 = _1067;
                _997 = _1065;
                if (!_997)
                {
                    float _1069 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                    int _1071 = as_type<int>(_1069) << 4;
                    uint _1073 = uint(int(uint(_1071) >> uint(2)));
                    float _1075 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1073)]);
                    float _1077 = -_189;
                    float _1079 = _125 + _1077;
                    float _1081 = -_191;
                    float _1083 = _137 + _1081;
                    float _1085 = abs(_1079);
                    float _1087 = abs(_1083);
                    float _1089 = precise::max(_1085, _1087);
                    float _1091 = _1075 * _1089;
                    float _1093 = _1091 * 4.0;
                    float _1095 = precise::max(_1093, 1.0);
                    float _1097 = log2(_1095);
                    float _1099 = precise::min(_1097, 5.0);
                    float _1101 = floor(_1099);
                    int _1103 = int(_1101);
                    int _1105 = as_type<int>(_1069) + _1103;
                    int _1107 = _1105 << 4;
                    uint _1109 = uint(int(uint(_1107) >> uint(2)));
                    float _1111 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1109)]);
                    float _1113 = floor(_1099);
                    float _1115 = rint(_1113);
                    float _1117 = precise::max(_1115, 0.0);
                    uint _1119 = uint(_1117);
                    uint _1121 = clamp(_1119, 0u, 65535u);
                    float _1123 = fma(_1111, _1083, 0.5);
                    float _1125 = fma(_1111, _1079, 0.5);
                    float3 _3372 = float3(_1125, _1123, float(int(_1121)));
                    float3 _3374 = select(_3372, float3(0.0), isnan(_3372));
                    float _1127 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3374.xy, uint(rint(_3374.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3374.xy, uint(rint(_3374.z)), level(0.0)).y;
                    _995 = _1127;
                    _741 = _1083;
                    _997 = true;
                }
            }
        }
    }
    else
    {
        float _1129 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _1131 = _125 + _1129;
        float _1133 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _1135 = _137 + _1133;
        uint _1137 = uint(int(uint(_219) >> uint(2)));
        uint _1139 = uint(int(uint(int(_1137)) >> uint(2)));
        int _1141 = int(_1137) & 3;
        float _1143 = (*spvDescriptorSet0.cp_c5)._m0[int(_1139)][_1141];
        float _1145 = abs(_1131);
        float _1147 = abs(_1135);
        float _1149 = precise::max(_1145, _1147);
        float _1151 = _1149 * _1143;
        float _1153 = _1151 * 4.0;
        float _1155 = precise::max(_1153, 1.0);
        float _1157 = log2(_1155);
        float _1159 = precise::min(_1157, 5.0);
        float _1161 = floor(_1159);
        int _1163 = int(_1161);
        float _1165 = floor(_1159);
        int _1167 = _1163 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
        int _1169 = _1167 << 4;
        float _1171 = rint(_1165);
        float _1173 = precise::max(_1171, 0.0);
        uint _1175 = uint(_1173);
        uint _1177 = clamp(_1175, 0u, 65535u);
        uint _1179 = uint(int(uint(_1169) >> uint(2)));
        uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
        int _1183 = int(_1179) & 3;
        float _1185 = (*spvDescriptorSet0.cp_c5)._m0[int(_1181)][_1183];
        float _1187 = fma(_1185, _1135, 0.5);
        float _1189 = fma(_1185, _1131, 0.5);
        float3 _3476 = float3(_1189, _1187, float(int(_1177)));
        float3 _3478 = select(_3476, float3(0.0), isnan(_3476));
        float _1191 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3478.xy, uint(rint(_3478.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3478.xy, uint(rint(_3478.z)), level(0.0)).y;
        _995 = _1191;
    }
    _997 = false;
    float _1193 = _995;
    float _1195 = _741;
    float _1197 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _1199 = _195 * 2000.0;
    float _1201 = _197 * 2000.0;
    float _1203 = precise::max(_113, 0.100000001490116119384765625);
    float _1205 = precise::max(_1199, 220.0);
    float _1207 = precise::max(_1201, 220.0);
    float _1209 = -_101;
    float _1211 = _1209 + _1203;
    float _1213 = precise::max(_143, 0.100000001490116119384765625);
    float _1215 = _1205 + _725;
    float _1217 = _1207 + _1193;
    float _1219 = -_131;
    float _1221 = _1219 + _1213;
    float _1223 = -_1211;
    bool _1225 = _1215 > _1223;
    float _1227 = _1215 + _1211;
    float _1229 = -_1221;
    bool _1231 = _1217 > _1229;
    float _1233 = _1217 + _1221;
    float _1235 = _1215;
    float _1237 = _1195;
    float _1239 = _1213;
    if (!_1225)
    {
        _1235 = -20.0;
    }
    float _1241 = _1235;
    float _1243 = _1197 * (-0.014499555341899394989013671875);
    float _1245 = _1197 * 0.01666666753590106964111328125;
    float _1247 = exp2(_1243);
    bool _1249 = !_1225;
    float _1251 = _1241;
    if (!_1249)
    {
        float _1253 = _1203 * 2.0;
        float _1255 = _1203 * 0.4000000059604644775390625;
        float _1257 = _147 * 0.00999999977648258209228515625;
        float _1259 = _1203 * _1203;
        float _1261 = 1.0 / _1253;
        float _1263 = precise::min(_1227, _1253);
        bool _1265 = _1263 >= _1255;
        bool _1267 = isnan(_1263);
        bool _1269 = _1265 || _1267;
        bool _1271 = isnan(_1255);
        bool _1273 = _1269 || _1271;
        float _1275 = _1263 * _1261;
        float _1277 = _1255;
        float _1279 = _1259;
        _1237 = _1263;
        if (!_1273)
        {
            float _1281 = -_1263;
            float _1283 = _1281 + _1255;
            _1277 = _1283;
        }
        float _1285 = _1277;
        float _1287 = _1285;
        if (!_1273)
        {
            float _1289 = _1259 * 0.4000000059604644775390625;
            _1279 = _1289;
        }
        float _1291 = _1279;
        float _1293 = -_1257;
        float _1295 = fma(_1275, 40.0, _1293);
        if (!_1273)
        {
            float _1297 = _1291 * _1285;
            _1287 = _1297;
        }
        float _1299 = _1287;
        float _1301 = _1295 + (-20.0);
        _1251 = _1301;
        if (!_1273)
        {
            float _1303 = fma(_1299, -20.0, _1301);
            _1251 = _1303;
        }
    }
    float _1305 = _1251;
    float _1307 = _1237;
    float _1309 = _1245 * _1305;
    float _1311 = _1305;
    float _1313 = _1307;
    float _1315 = _1309;
    if (!_1231)
    {
        _1311 = -20.0;
    }
    float _1317 = _1311;
    bool _1319 = !_1231;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = _1213 * 2.0;
        float _1325 = _1213 * 0.4000000059604644775390625;
        float _1327 = _151 * 0.00999999977648258209228515625;
        float _1329 = _1213 * _1213;
        float _1331 = 1.0 / _1323;
        float _1333 = precise::min(_1233, _1323);
        bool _1335 = _1333 >= _1325;
        bool _1337 = isnan(_1333);
        bool _1339 = _1335 || _1337;
        bool _1341 = isnan(_1325);
        bool _1343 = _1339 || _1341;
        float _1345 = _1333 * _1331;
        float _1347 = _1325;
        float _1349 = _1329;
        _1313 = _1333;
        if (!_1343)
        {
            float _1351 = -_1333;
            float _1353 = _1351 + _1325;
            _1347 = _1353;
        }
        float _1355 = _1347;
        float _1357 = _1355;
        if (!_1343)
        {
            float _1359 = _1329 * 0.4000000059604644775390625;
            _1349 = _1359;
        }
        float _1361 = _1349;
        float _1363 = -_1327;
        float _1365 = fma(_1345, 40.0, _1363);
        _1239 = _1361;
        if (!_1343)
        {
            float _1367 = _1361 * _1355;
            _1357 = _1367;
        }
        float _1369 = _1357;
        float _1371 = _1365 + (-20.0);
        _1321 = _1371;
        if (!_1343)
        {
            float _1373 = fma(_1369, -20.0, _1371);
            _1321 = _1373;
        }
    }
    float _1375 = _1321;
    float _1377 = _1239;
    float _1379 = _1313;
    float _1381 = _1245 * _1375;
    float _1383 = fma(_147, _1247, _1309);
    float _1385 = _95 + _125;
    float _1387 = fma(_151, _1247, _1381);
    float _1389 = fma(_1245, _1383, _101);
    float _1391 = -_107;
    float _1393 = _1391 + _137;
    int _1395 = _80 << 6;
    float _1397 = fma(_1245, _1387, _131);
    float _1399 = -_95;
    float _1401 = _1399 + _125;
    float _1403 = _107 + _137;
    float _1405 = _1385 * 0.5;
    float _1407 = -_1389;
    float _1409 = _1407 + _1397;
    float _1411 = _1403 * 0.5;
    float _1413 = _1409 * _1409;
    float _1415 = fma(_1401, _1401, _1413);
    float _1417 = fma(_1393, _1393, _1415);
    bool _1419 = _1417 >= 9.9999997473787516355514526367188e-06;
    bool _1421 = isnan(_1417);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(9.9999997473787516355514526367188e-06);
    bool _1427 = _1423 || _1425;
    float _1429 = _1415;
    float _1431 = _1377;
    float _1433 = _1379;
    if (_1427)
    {
        float _1435 = rsqrt(_1417);
        _1429 = _1435;
    }
    float _1437 = _1429;
    if (!_1427)
    {
        _1431 = 0.0;
    }
    float _1439 = _1431;
    float _1441 = _1439;
    if (!_1427)
    {
        _1315 = 1.0;
    }
    float _1443 = _1315;
    float _1445 = _1443;
    if (!_1427)
    {
        _1433 = 0.0;
    }
    float _1447 = _1433;
    float _1449 = _1447;
    if (_1427)
    {
        float _1451 = _1409 * _1437;
        _1441 = _1451;
    }
    float _1453 = _1441;
    if (_1427)
    {
        float _1455 = _1393 * _1437;
        _1445 = _1455;
    }
    float _1457 = _1445;
    if (_1427)
    {
        float _1459 = _1401 * _1437;
        _1449 = _1459;
    }
    float _1461 = _1449;
    float _1463 = abs(_1453);
    bool _1465 = _1463 > 0.99989998340606689453125;
    float _1467 = float(_1465);
    float _1469 = abs(_1453);
    bool _1471 = _1469 <= 0.99989998340606689453125;
    bool _1473 = isnan(_1469);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.99989998340606689453125);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = _1467 * _1457;
    float _1485 = _1481 * _1461;
    float _1487 = _1481 * _1457;
    float _1489 = _1483 * _1483;
    float _1491 = -_1485;
    float _1493 = fma(_1467, _1453, _1491);
    float _1495 = _1389 + _1397;
    float _1497 = fma(_1487, _1487, _1489);
    uint _1499 = uint(int(uint(_86) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1499)] = as_type<uint>(_95);
    int _1501 = _86 + 4;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1503)] = as_type<uint>(_1389);
    int _1505 = _86 + 8;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1507)] = as_type<uint>(_107);
    int _1509 = _86 + 12;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1511)] = as_type<uint>(_113);
    float _1513 = _1495 * 0.5;
    float _1515 = fma(_1493, _1493, _1497);
    float _1517 = rsqrt(_1515);
    uint _1519 = uint(int(uint(_90) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1519)] = as_type<uint>(_125);
    int _1521 = _90 + 4;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1523)] = as_type<uint>(_1397);
    int _1525 = _90 + 8;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1527)] = as_type<uint>(_137);
    int _1529 = _90 + 12;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1531)] = as_type<uint>(_143);
    uint _1533 = uint(int(uint(_119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1533)] = as_type<uint>(_1383);
    uint _1535 = uint(int(uint(_121) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1535)] = as_type<uint>(_1387);
    uint _1537 = uint(int(uint(_88) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1537)] = as_type<uint>(_117);
    float _1539 = _1483 * _1517;
    float _1541 = _1493 * _1517;
    float _1543 = _1487 * _1517;
    int _1545 = _1395 + 16;
    float _1547 = -_1457;
    float _1549 = _1539 * _1547;
    float _1551 = _1541 * _1461;
    float _1553 = _1543 * _1453;
    float _1555 = -_1539;
    float _1557 = (-0.0) + _1555;
    float _1559 = -_1549;
    float _1561 = fma(_1541, _1453, _1559);
    float _1563 = -_1551;
    float _1565 = fma(_1543, _1457, _1563);
    int _1567 = _1395 + 32;
    float _1569 = -_1539;
    float _1571 = -_1553;
    float _1573 = fma(_1569, _1461, _1571);
    int _1575 = _1395 + 48;
    uint _1577 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1577)] = as_type<uint>(_201);
    uint _1579 = uint(int(uint(_1395) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1579)] = as_type<uint>(_1543);
    int _1581 = _1395 + 4;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1583)] = as_type<uint>(_1561);
    int _1585 = _1395 + 8;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1587)] = as_type<uint>(_1461);
    int _1589 = _1395 + 12;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1591)] = as_type<uint>(_1405);
    uint _1593 = uint(int(uint(_1545) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1593)] = as_type<uint>(_1557);
    int _1595 = _1545 + 4;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1597)] = as_type<uint>(_1565);
    int _1599 = _1545 + 8;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1601)] = as_type<uint>(_1453);
    int _1603 = _1545 + 12;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1605)] = as_type<uint>(_1513);
    uint _1607 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1607)] = as_type<uint>(_1541);
    int _1609 = _1567 + 4;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1611)] = as_type<uint>(_1573);
    int _1613 = _1567 + 8;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1615)] = as_type<uint>(_1457);
    int _1617 = _1567 + 12;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1619)] = as_type<uint>(_1411);
    uint _1621 = uint(int(uint(_1575) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1621)] = 1u;
    int _1623 = _1575 + 4;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1625)] = 0u;
    int _1627 = _1575 + 8;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1629)] = 0u;
    int _1631 = _1575 + 12;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1633)] = 0u;
}

