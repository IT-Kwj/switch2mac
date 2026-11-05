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
    bool _995 = false;
    bool _925 = false;
    bool _923 = false;
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
    float _177 = _151;
    if (!_153)
    {
        return;
    }
    float _179 = fma(_95, 6.2500002968590706586837768554688e-05, 0.5);
    float _181 = fma(_107, 6.2500002968590706586837768554688e-05, 0.5);
    float _183 = fma(_125, 6.2500002968590706586837768554688e-05, 0.5);
    float _185 = fma(_137, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1847 = float2(_179, _181);
    float _187 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1847, float2(0.0), isnan(_1847)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1847, float2(0.0), isnan(_1847)), level(0.0)).x;
    float2 _1858 = float2(_183, _185);
    float _189 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1858, float2(0.0), isnan(_1858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1858, float2(0.0), isnan(_1858)), level(0.0)).x;
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[64]);
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[65]);
    int _195 = _86 + 44;
    float2 _1877 = float2(_179, _181);
    float _197 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1877, float2(0.0), isnan(_1877)), level(_187)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1877, float2(0.0), isnan(_1877)), level(_187)).y;
    float2 _1886 = float2(_183, _185);
    float _199 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1886, float2(0.0), isnan(_1886)), level(_189)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1886, float2(0.0), isnan(_1886)), level(_189)).y;
    uint _201 = uint(int(uint(_195) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_201)]);
    int _205 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 4;
    bool _215 = _213 != 0;
    int _217 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 8;
    bool _219 = _217 != 0;
    int _221 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z) << 4;
    float _223 = 0.0;
    float _225 = _179;
    float _227 = _181;
    float _229 = _183;
    int _231 = as_type<int>(_185);
    bool _233 = _207;
    int _235 = _215 ? (-1) : 0;
    if (_207)
    {
        float _237 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _239 = _95 + _237;
        _223 = _239;
    }
    float _241 = _223;
    float _243 = 0.0;
    float _245 = _241;
    if (_207)
    {
        float _247 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _249 = _107 + _247;
        _243 = _249;
    }
    float _251 = _243;
    float _253 = 0.0;
    float _255 = _251;
    if (_211)
    {
        float _257 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
        float _259 = _95 + _257;
        _253 = _259;
    }
    float _261 = _253;
    float _263 = 0.0;
    if (_211)
    {
        float _265 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
        float _267 = _107 + _265;
        _263 = _267;
    }
    float _269 = _263;
    float _271 = _269;
    if (_207)
    {
        float _273 = abs(_241);
        float _275 = abs(_251);
        float _277 = precise::max(_273, _275);
        _255 = _277;
    }
    float _279 = _255;
    int _281 = as_type<int>(_279);
    if (!_207)
    {
        _245 = 10000.0;
    }
    float _283 = _245;
    float _285 = _283;
    if (_211)
    {
        float _287 = abs(_261);
        float _289 = abs(_269);
        float _291 = precise::max(_287, _289);
        _271 = _291;
    }
    float _293 = _271;
    if (_207)
    {
        float _295 = precise::min(_279, 10000.0);
        _285 = _295;
    }
    float _297 = _285;
    float _299 = _297;
    if (_215)
    {
        float _301 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
        float _303 = _95 + _301;
        _225 = _303;
    }
    float _305 = _225;
    float _307 = _305;
    if (_215)
    {
        float _309 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
        float _311 = _107 + _309;
        _227 = _311;
    }
    float _313 = _227;
    bool _315 = false;
    float _317 = _313;
    if (_211)
    {
        bool _319 = _297 > _293;
        _315 = _319;
    }
    bool _321 = _315;
    int _323 = _321 ? (-1) : 0;
    if (_215)
    {
        float _325 = abs(_305);
        float _327 = abs(_313);
        float _329 = precise::max(_325, _327);
        _307 = _329;
    }
    float _331 = _307;
    if (_219)
    {
        float _333 = -_191;
        float _335 = _95 + _333;
        _317 = _335;
    }
    float _337 = _317;
    if (_211)
    {
        float _339 = _321 ? _293 : _297;
        _299 = _339;
    }
    float _341 = _299;
    float _343 = _341;
    if (_219)
    {
        float _345 = -_193;
        float _347 = _107 + _345;
        _229 = _347;
    }
    float _349 = _229;
    float _351 = _349;
    if (!_211)
    {
        _231 = 0;
    }
    int _353 = _231;
    bool _355 = false;
    int _357 = _353;
    if (_215)
    {
        bool _359 = _341 > _331;
        _355 = _359;
    }
    bool _361 = _355;
    if (_219)
    {
        float _363 = abs(_337);
        float _365 = abs(_349);
        float _367 = precise::max(_363, _365);
        _351 = _367;
    }
    float _369 = _351;
    float _371 = _369;
    if (_215)
    {
        float _373 = _361 ? _331 : _341;
        _343 = _373;
    }
    float _375 = _343;
    if (_211)
    {
        bool _377 = !_321;
        int _379 = _377 ? 0 : 1;
        _357 = _379;
    }
    int _381 = _357;
    int _383 = _381;
    if (_219)
    {
        bool _385 = _375 > _369;
        _323 = _385 ? (-1) : 0;
    }
    int _387 = _323;
    if (_215)
    {
        bool _389 = !_361;
        int _391 = _389 ? _381 : 2;
        _383 = _391;
    }
    int _393 = _383;
    int _395 = _393;
    if (_219)
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
                float3 _2350 = float3(_503, _501, float(int(_491)));
                float3 _2354 = select(_2350, float3(0.0), isnan(_2350));
                float _505 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _2354.xy, uint(rint(_2354.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _2354.xy, uint(rint(_2354.z)), level(0.0)).y;
                _431 = _471;
                _433 = _473;
                _371 = _479;
                _407 = _499;
                _281 = int(_491);
                _507 = _505;
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
                float3 _2475 = float3(_573, _571, float(int(_561)));
                float3 _2477 = select(_2475, float3(0.0), isnan(_2475));
                float _575 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _2477.xy, uint(rint(_2477.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _2477.xy, uint(rint(_2477.z)), level(0.0)).y;
                _431 = _541;
                _433 = _543;
                _371 = _549;
                _407 = _569;
                _281 = int(_561);
                _507 = _575;
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
                    float _583 = -_191;
                    float _585 = _95 + _583;
                    int _587 = as_type<int>(_581) << 4;
                    uint _589 = uint(int(uint(_587) >> uint(2)));
                    float _591 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_589)]);
                    float _593 = -_193;
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
                    float3 _2606 = float3(_645, _643, float(int(_641)));
                    float3 _2608 = select(_2606, float3(0.0), isnan(_2606));
                    float _647 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2608.xy, uint(rint(_2608.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2608.xy, uint(rint(_2608.z)), level(0.0)).y;
                    _431 = as_type<float>(_641);
                    _433 = _645;
                    _371 = _631;
                    _407 = as_type<float>(_627);
                    _409 = _623;
                    _281 = as_type<int>(_609);
                    _507 = _647;
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
        uint _657 = uint(int(uint(_221) >> uint(2)));
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
        float3 _2718 = float3(_709, _707, float(int(_697)));
        float3 _2720 = select(_2718, float3(0.0), isnan(_2718));
        float _711 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2720.xy, uint(rint(_2720.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2720.xy, uint(rint(_2720.z)), level(0.0)).y;
        _431 = _677;
        _433 = _679;
        _371 = _685;
        _407 = _705;
        _281 = int(_697);
        _507 = _711;
    }
    _509 = false;
    float _713 = _431;
    float _715 = _433;
    float _717 = _371;
    float _719 = _407;
    bool _721 = _409;
    int _723 = _281;
    float _725 = _507;
    float _727 = _713;
    float _729 = _715;
    float _731 = _717;
    float _733 = _719;
    int _735 = _723;
    bool _737 = _721;
    if (_207)
    {
        float _739 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _741 = _125 + _739;
        _727 = _741;
    }
    float _743 = _727;
    float _745 = _743;
    if (_207)
    {
        float _747 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _749 = _137 + _747;
        _729 = _749;
    }
    float _751 = _729;
    float _753 = _751;
    if (_211)
    {
        float _755 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
        float _757 = _125 + _755;
        _731 = _757;
    }
    float _759 = _731;
    float _761 = _759;
    if (_211)
    {
        float _763 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
        float _765 = _137 + _763;
        _733 = _765;
    }
    float _767 = _733;
    float _769 = _767;
    if (!_211)
    {
        _735 = 0;
    }
    int _771 = _735;
    int _773 = _771;
    if (_207)
    {
        float _775 = abs(_743);
        float _777 = abs(_751);
        float _779 = precise::max(_775, _777);
        _753 = _779;
    }
    float _781 = _753;
    float _783 = _781;
    if (!_207)
    {
        _745 = 10000.0;
    }
    float _785 = _745;
    float _787 = _785;
    if (_211)
    {
        float _789 = abs(_759);
        float _791 = abs(_767);
        float _793 = precise::max(_789, _791);
        _769 = _793;
    }
    float _795 = _769;
    float _797 = _795;
    if (_215)
    {
        float _799 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
        float _801 = _137 + _799;
        _761 = _801;
    }
    float _803 = _761;
    float _805 = _803;
    if (_207)
    {
        float _807 = precise::min(_781, 10000.0);
        _787 = _807;
    }
    float _809 = _787;
    float _811 = _809;
    if (_215)
    {
        float _813 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
        float _815 = _125 + _813;
        _783 = _815;
    }
    float _817 = _783;
    float _819 = _817;
    if (_211)
    {
        bool _821 = _809 > _795;
        _233 = _821;
    }
    bool _823 = _233;
    if (_215)
    {
        float _825 = abs(_817);
        float _827 = abs(_803);
        float _829 = precise::max(_825, _827);
        _819 = _829;
    }
    float _831 = _819;
    if (_219)
    {
        float _833 = -_191;
        float _835 = _125 + _833;
        _805 = _835;
    }
    float _837 = _805;
    if (_211)
    {
        float _839 = _823 ? _795 : _809;
        _811 = _839;
    }
    float _841 = _811;
    float _843 = _841;
    if (_219)
    {
        float _845 = -_193;
        float _847 = _137 + _845;
        _797 = _847;
    }
    float _849 = _797;
    float _851 = _849;
    if (_211)
    {
        bool _853 = !_823;
        int _855 = _853 ? 0 : 1;
        _773 = _855;
    }
    int _857 = _773;
    int _859 = _857;
    if (_215)
    {
        bool _861 = _841 > _831;
        _737 = _861;
    }
    bool _863 = _737;
    if (_219)
    {
        float _865 = abs(_837);
        float _867 = abs(_849);
        float _869 = precise::max(_865, _867);
        _851 = _869;
    }
    float _871 = _851;
    if (_215)
    {
        float _873 = _863 ? _831 : _841;
        _843 = _873;
    }
    float _875 = _843;
    if (_215)
    {
        bool _877 = !_863;
        int _879 = _877 ? _857 : 2;
        _859 = _879;
    }
    int _881 = _859;
    int _883 = _881;
    if (_219)
    {
        bool _885 = _875 > _871;
        _235 = _885 ? (-1) : 0;
    }
    int _887 = _235;
    if (_219)
    {
        int _889 = ~_887;
        int _891 = (_889 != 0) ? _881 : 3;
        _883 = _891;
    }
    int _893 = _883;
    bool _895 = _893 != 0;
    bool _897 = !_895;
    float _899 = as_type<float>(_893);
    float _993;
    if (!_897)
    {
        int _901 = _893 + (-1);
        uint _903 = min(uint(_901), 3u);
        int _905 = int(_903) << 2;
        int _907 = _905 + 16;
        uint _909 = uint(int(uint(_907) >> uint(2)));
        uint _911 = uint(int(uint(int(_909)) >> uint(2)));
        int _913 = int(_909) & 3;
        float _915 = (*spvDescriptorSet0.cp_c1)._m0[int(_911)][_913];
        bool _917 = as_type<int>(_915) == 3072;
        float _919 = _915;
        if (!_917)
        {
            bool _921 = as_type<int>(_915) == 3392;
            _923 = _921;
            if (!_923)
            {
                _925 = true;
            }
        }
        if (!_923)
        {
            if (!_925)
            {
                float _927 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _929 = _125 + _927;
                int _931 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                float _933 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _935 = _137 + _933;
                float _937 = abs(_929);
                float _939 = abs(_935);
                float _941 = precise::max(_937, _939);
                uint _943 = uint(int(uint(_931) >> uint(2)));
                uint _945 = uint(int(uint(int(_943)) >> uint(2)));
                int _947 = int(_943) & 3;
                float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
                float _951 = _941 * _949;
                float _953 = _951 * 4.0;
                float _955 = precise::max(_953, 1.0);
                float _957 = log2(_955);
                float _959 = precise::min(_957, 5.0);
                float _961 = floor(_959);
                int _963 = int(_961);
                float _965 = floor(_959);
                int _967 = _963 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                int _969 = _967 << 4;
                float _971 = rint(_965);
                float _973 = precise::max(_971, 0.0);
                uint _975 = uint(_973);
                uint _977 = clamp(_975, 0u, 65535u);
                uint _979 = uint(int(uint(_969) >> uint(2)));
                uint _981 = uint(int(uint(int(_979)) >> uint(2)));
                int _983 = int(_979) & 3;
                float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
                float _987 = fma(_985, _935, 0.5);
                float _989 = fma(_985, _929, 0.5);
                float3 _3138 = float3(_989, _987, float(int(_977)));
                float3 _3140 = select(_3138, float3(0.0), isnan(_3138));
                float _991 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _3140.xy, uint(rint(_3140.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _3140.xy, uint(rint(_3140.z)), level(0.0)).y;
                _993 = _991;
                _899 = as_type<float>(_977);
                _995 = true;
            }
        }
        if (((!_995) || _925) || _923)
        {
            if ((!_925) || _923)
            {
                _923 = false;
                float _997 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _999 = _125 + _997;
                int _1001 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                float _1003 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _1005 = _137 + _1003;
                float _1007 = abs(_999);
                float _1009 = abs(_1005);
                float _1011 = precise::max(_1007, _1009);
                uint _1013 = uint(int(uint(_1001) >> uint(2)));
                uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
                int _1017 = int(_1013) & 3;
                float _1019 = (*spvDescriptorSet0.cp_c7)._m0[int(_1015)][_1017];
                float _1021 = _1011 * _1019;
                float _1023 = _1021 * 4.0;
                float _1025 = precise::max(_1023, 1.0);
                float _1027 = log2(_1025);
                float _1029 = precise::min(_1027, 5.0);
                float _1031 = floor(_1029);
                int _1033 = int(_1031);
                float _1035 = floor(_1029);
                int _1037 = _1033 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                int _1039 = _1037 << 4;
                float _1041 = rint(_1035);
                float _1043 = precise::max(_1041, 0.0);
                uint _1045 = uint(_1043);
                uint _1047 = clamp(_1045, 0u, 65535u);
                uint _1049 = uint(int(uint(_1039) >> uint(2)));
                uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
                int _1053 = int(_1049) & 3;
                float _1055 = (*spvDescriptorSet0.cp_c7)._m0[int(_1051)][_1053];
                float _1057 = fma(_1055, _1005, 0.5);
                float _1059 = fma(_1055, _999, 0.5);
                float3 _3257 = float3(_1059, _1057, float(int(_1047)));
                float3 _3259 = select(_3257, float3(0.0), isnan(_3257));
                float _1061 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _3259.xy, uint(rint(_3259.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _3259.xy, uint(rint(_3259.z)), level(0.0)).y;
                _993 = _1061;
                _899 = as_type<float>(_1047);
                _995 = true;
            }
            if ((!_995) || _925)
            {
                _925 = false;
                bool _1063 = _893 != 3;
                if (_1063)
                {
                    _919 = 0.0;
                }
                float _1065 = _919;
                _993 = _1065;
                _995 = _1063;
                if (!_995)
                {
                    float _1067 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                    int _1069 = as_type<int>(_1067) << 4;
                    uint _1071 = uint(int(uint(_1069) >> uint(2)));
                    float _1073 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1071)]);
                    float _1075 = -_191;
                    float _1077 = _125 + _1075;
                    float _1079 = -_193;
                    float _1081 = _137 + _1079;
                    float _1083 = abs(_1077);
                    float _1085 = abs(_1081);
                    float _1087 = precise::max(_1083, _1085);
                    float _1089 = _1073 * _1087;
                    float _1091 = _1089 * 4.0;
                    float _1093 = precise::max(_1091, 1.0);
                    float _1095 = log2(_1093);
                    float _1097 = precise::min(_1095, 5.0);
                    float _1099 = floor(_1097);
                    int _1101 = int(_1099);
                    int _1103 = as_type<int>(_1067) + _1101;
                    int _1105 = _1103 << 4;
                    uint _1107 = uint(int(uint(_1105) >> uint(2)));
                    float _1109 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1107)]);
                    float _1111 = floor(_1097);
                    float _1113 = rint(_1111);
                    float _1115 = precise::max(_1113, 0.0);
                    uint _1117 = uint(_1115);
                    uint _1119 = clamp(_1117, 0u, 65535u);
                    float _1121 = fma(_1109, _1081, 0.5);
                    float _1123 = fma(_1109, _1077, 0.5);
                    float3 _3364 = float3(_1123, _1121, float(int(_1119)));
                    float3 _3366 = select(_3364, float3(0.0), isnan(_3364));
                    float _1125 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3366.xy, uint(rint(_3366.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3366.xy, uint(rint(_3366.z)), level(0.0)).y;
                    _993 = _1125;
                    _899 = as_type<float>(_1119);
                    _995 = true;
                }
            }
        }
    }
    else
    {
        float _1127 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _1129 = _125 + _1127;
        float _1131 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _1133 = _137 + _1131;
        uint _1135 = uint(int(uint(_221) >> uint(2)));
        uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
        int _1139 = int(_1135) & 3;
        float _1141 = (*spvDescriptorSet0.cp_c5)._m0[int(_1137)][_1139];
        float _1143 = abs(_1129);
        float _1145 = abs(_1133);
        float _1147 = precise::max(_1143, _1145);
        float _1149 = _1147 * _1141;
        float _1151 = _1149 * 4.0;
        float _1153 = precise::max(_1151, 1.0);
        float _1155 = log2(_1153);
        float _1157 = precise::min(_1155, 5.0);
        float _1159 = floor(_1157);
        int _1161 = int(_1159);
        float _1163 = floor(_1157);
        int _1165 = _1161 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
        int _1167 = _1165 << 4;
        float _1169 = rint(_1163);
        float _1171 = precise::max(_1169, 0.0);
        uint _1173 = uint(_1171);
        uint _1175 = clamp(_1173, 0u, 65535u);
        uint _1177 = uint(int(uint(_1167) >> uint(2)));
        uint _1179 = uint(int(uint(int(_1177)) >> uint(2)));
        int _1181 = int(_1177) & 3;
        float _1183 = (*spvDescriptorSet0.cp_c5)._m0[int(_1179)][_1181];
        float _1185 = fma(_1183, _1133, 0.5);
        float _1187 = fma(_1183, _1129, 0.5);
        float3 _3469 = float3(_1187, _1185, float(int(_1175)));
        float3 _3471 = select(_3469, float3(0.0), isnan(_3469));
        float _1189 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3471.xy, uint(rint(_3471.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3471.xy, uint(rint(_3471.z)), level(0.0)).y;
        _993 = _1189;
        _899 = as_type<float>(_1175);
    }
    _995 = false;
    float _1191 = _993;
    float _1193 = _899;
    float _1195 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _1197 = _197 * 2000.0;
    float _1199 = _199 * 2000.0;
    float _1201 = precise::max(_113, 0.100000001490116119384765625);
    float _1203 = precise::max(_1197, 220.0);
    float _1205 = precise::max(_1199, 220.0);
    float _1207 = -_101;
    float _1209 = _1207 + _1201;
    float _1211 = precise::max(_143, 0.100000001490116119384765625);
    float _1213 = _1203 + _725;
    float _1215 = _1205 + _1191;
    float _1217 = -_131;
    float _1219 = _1217 + _1211;
    float _1221 = -_1209;
    bool _1223 = _1213 > _1221;
    float _1225 = _1213 + _1209;
    float _1227 = -_1219;
    bool _1229 = _1215 > _1227;
    float _1231 = _1215 + _1219;
    float _1233 = _1213;
    float _1235 = _1193;
    if (!_1223)
    {
        _1233 = -20.0;
    }
    float _1237 = _1233;
    float _1239 = _1195 * (-0.014499555341899394989013671875);
    float _1241 = _1195 * 0.01666666753590106964111328125;
    float _1243 = exp2(_1239);
    bool _1245 = !_1223;
    float _1247 = _1237;
    float _1249 = _1241;
    if (!_1245)
    {
        float _1251 = _1201 * 2.0;
        float _1253 = _1201 * 0.4000000059604644775390625;
        float _1255 = _147 * 0.00999999977648258209228515625;
        float _1257 = _1201 * _1201;
        float _1259 = 1.0 / _1251;
        float _1261 = precise::min(_1225, _1251);
        bool _1263 = _1261 >= _1253;
        bool _1265 = isnan(_1261);
        bool _1267 = _1263 || _1265;
        bool _1269 = isnan(_1253);
        bool _1271 = _1267 || _1269;
        float _1273 = _1261 * _1259;
        float _1275 = _1253;
        float _1277 = _1257;
        _1235 = _1255;
        if (!_1271)
        {
            float _1279 = -_1261;
            float _1281 = _1279 + _1253;
            _1275 = _1281;
        }
        float _1283 = _1275;
        float _1285 = _1283;
        if (!_1271)
        {
            float _1287 = _1257 * 0.4000000059604644775390625;
            _1277 = _1287;
        }
        float _1289 = _1277;
        float _1291 = -_1255;
        float _1293 = fma(_1273, 40.0, _1291);
        if (!_1271)
        {
            float _1295 = _1289 * _1283;
            _1285 = _1295;
        }
        float _1297 = _1285;
        float _1299 = _1293 + (-20.0);
        _1247 = _1299;
        if (!_1271)
        {
            float _1301 = fma(_1297, -20.0, _1299);
            _1247 = _1301;
        }
    }
    float _1303 = _1247;
    float _1305 = _1235;
    float _1307 = _1241 * _1303;
    float _1309 = _1303;
    float _1311 = _1305;
    if (!_1229)
    {
        _1309 = -20.0;
    }
    float _1313 = _1309;
    bool _1315 = !_1229;
    float _1317 = _1313;
    if (!_1315)
    {
        float _1319 = _1211 * 2.0;
        float _1321 = _1211 * 0.4000000059604644775390625;
        float _1323 = _151 * 0.00999999977648258209228515625;
        float _1325 = _1211 * _1211;
        float _1327 = 1.0 / _1319;
        float _1329 = precise::min(_1231, _1319);
        bool _1331 = _1329 >= _1321;
        bool _1333 = isnan(_1329);
        bool _1335 = _1331 || _1333;
        bool _1337 = isnan(_1321);
        bool _1339 = _1335 || _1337;
        float _1341 = _1329 * _1327;
        float _1343 = _1321;
        float _1345 = _1325;
        _1311 = _1323;
        if (!_1339)
        {
            float _1347 = -_1329;
            float _1349 = _1347 + _1321;
            _1343 = _1349;
        }
        float _1351 = _1343;
        float _1353 = _1351;
        if (!_1339)
        {
            float _1355 = _1325 * 0.4000000059604644775390625;
            _1345 = _1355;
        }
        float _1357 = _1345;
        float _1359 = -_1323;
        float _1361 = fma(_1341, 40.0, _1359);
        if (!_1339)
        {
            float _1363 = _1357 * _1351;
            _1353 = _1363;
        }
        float _1365 = _1353;
        float _1367 = _1361 + (-20.0);
        _1317 = _1367;
        if (!_1339)
        {
            float _1369 = fma(_1365, -20.0, _1367);
            _1317 = _1369;
        }
    }
    float _1371 = _1317;
    float _1373 = _1311;
    float _1375 = _1241 * _1371;
    float _1377 = fma(_147, _1243, _1307);
    float _1379 = _95 + _125;
    float _1381 = fma(_151, _1243, _1375);
    float _1383 = fma(_1241, _1377, _101);
    float _1385 = -_107;
    float _1387 = _1385 + _137;
    int _1389 = _80 << 6;
    float _1391 = fma(_1241, _1381, _131);
    float _1393 = -_95;
    float _1395 = _1393 + _125;
    float _1397 = _107 + _137;
    float _1399 = _1379 * 0.5;
    float _1401 = -_1383;
    float _1403 = _1401 + _1391;
    float _1405 = _1397 * 0.5;
    float _1407 = _1403 * _1403;
    float _1409 = fma(_1395, _1395, _1407);
    float _1411 = fma(_1387, _1387, _1409);
    bool _1413 = _1411 >= 9.9999997473787516355514526367188e-06;
    bool _1415 = isnan(_1411);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(9.9999997473787516355514526367188e-06);
    bool _1421 = _1417 || _1419;
    float _1423 = _1409;
    float _1425 = _1373;
    if (_1421)
    {
        float _1427 = rsqrt(_1411);
        _1423 = _1427;
    }
    float _1429 = _1423;
    if (!_1421)
    {
        _177 = 0.0;
    }
    float _1431 = _177;
    float _1433 = _1431;
    if (!_1421)
    {
        _1249 = 0.0;
    }
    float _1435 = _1249;
    float _1437 = _1435;
    if (!_1421)
    {
        _1425 = 1.0;
    }
    float _1439 = _1425;
    float _1441 = _1439;
    if (_1421)
    {
        float _1443 = _1403 * _1429;
        _1433 = _1443;
    }
    float _1445 = _1433;
    if (_1421)
    {
        float _1447 = _1387 * _1429;
        _1437 = _1447;
    }
    float _1449 = _1437;
    if (_1421)
    {
        float _1451 = _1395 * _1429;
        _1441 = _1451;
    }
    float _1453 = _1441;
    float _1455 = abs(_1445);
    bool _1457 = _1455 <= 0.99989998340606689453125;
    bool _1459 = isnan(_1455);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.99989998340606689453125);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = abs(_1445);
    bool _1471 = _1469 > 0.99989998340606689453125;
    float _1473 = float(_1471);
    float _1475 = _1467 * _1449;
    float _1477 = _1467 * _1453;
    float _1479 = _1473 * _1453;
    float _1481 = -_1475;
    float _1483 = fma(_1473, _1445, _1481);
    float _1485 = _1383 + _1391;
    float _1487 = _1479 * _1479;
    uint _1489 = uint(int(uint(_86) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1489)] = as_type<uint>(_95);
    int _1491 = _86 + 4;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1493)] = as_type<uint>(_1383);
    int _1495 = _86 + 8;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1497)] = as_type<uint>(_107);
    int _1499 = _86 + 12;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1501)] = as_type<uint>(_113);
    float _1503 = _1485 * 0.5;
    float _1505 = fma(_1483, _1483, _1487);
    float _1507 = fma(_1477, _1477, _1505);
    float _1509 = rsqrt(_1507);
    uint _1511 = uint(int(uint(_90) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1511)] = as_type<uint>(_125);
    int _1513 = _90 + 4;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1515)] = as_type<uint>(_1391);
    int _1517 = _90 + 8;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1519)] = as_type<uint>(_137);
    int _1521 = _90 + 12;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1523)] = as_type<uint>(_143);
    uint _1525 = uint(int(uint(_119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1525)] = as_type<uint>(_1377);
    uint _1527 = uint(int(uint(_121) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1527)] = as_type<uint>(_1381);
    uint _1529 = uint(int(uint(_88) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1529)] = as_type<uint>(_117);
    float _1531 = _1477 * _1509;
    float _1533 = _1483 * _1509;
    float _1535 = _1479 * _1509;
    int _1537 = _1389 + 16;
    float _1539 = _1531 * _1445;
    float _1541 = _1533 * _1449;
    float _1543 = -_1453;
    float _1545 = _1535 * _1543;
    float _1547 = -_1535;
    float _1549 = (-0.0) + _1547;
    float _1551 = -_1535;
    float _1553 = -_1539;
    float _1555 = fma(_1551, _1449, _1553);
    float _1557 = -_1541;
    float _1559 = fma(_1531, _1453, _1557);
    int _1561 = _1389 + 32;
    float _1563 = -_1545;
    float _1565 = fma(_1533, _1445, _1563);
    int _1567 = _1389 + 48;
    uint _1569 = uint(int(uint(_195) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1569)] = as_type<uint>(_203);
    uint _1571 = uint(int(uint(_1389) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1571)] = as_type<uint>(_1453);
    int _1573 = _1389 + 4;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1575)] = as_type<uint>(_1555);
    int _1577 = _1389 + 8;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1579)] = as_type<uint>(_1533);
    int _1581 = _1389 + 12;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1583)] = as_type<uint>(_1399);
    uint _1585 = uint(int(uint(_1537) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1585)] = as_type<uint>(_1445);
    int _1587 = _1537 + 4;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1589)] = as_type<uint>(_1559);
    int _1591 = _1537 + 8;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1593)] = as_type<uint>(_1549);
    int _1595 = _1537 + 12;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1597)] = as_type<uint>(_1503);
    uint _1599 = uint(int(uint(_1561) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1599)] = as_type<uint>(_1449);
    int _1601 = _1561 + 4;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1603)] = as_type<uint>(_1565);
    int _1605 = _1561 + 8;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1607)] = as_type<uint>(_1531);
    int _1609 = _1561 + 12;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1611)] = as_type<uint>(_1405);
    uint _1613 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1613)] = 1u;
    int _1615 = _1567 + 4;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1617)] = 0u;
    int _1619 = _1567 + 8;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1621)] = 0u;
    int _1623 = _1567 + 12;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1625)] = 0u;
}

