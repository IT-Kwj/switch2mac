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
    constant _16* cp_c1 [[id(0)]];
    constant _16* cp_c6 [[id(1)]];
    constant _16* cp_c7 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    constant _16* cp_c4 [[id(5)]];
    device _33* cp_s0 [[id(6)]];
    device _33* cp_s1 [[id(7)]];
    device _33* cp_s2 [[id(8)]];
    device _33* cp_s3 [[id(9)]];
    texture2d<float> cp_t_tcb_8 [[id(10)]];
    sampler cp_t_tcb_8Smplr [[id(11)]];
    texture2d<float> cp_t_tcb_A [[id(12)]];
    sampler cp_t_tcb_ASmplr [[id(13)]];
    texture2d_array<float> cp_t_tcb_E [[id(14)]];
    sampler cp_t_tcb_ESmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_10 [[id(16)]];
    sampler cp_t_tcb_10Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_12 [[id(18)]];
    sampler cp_t_tcb_12Smplr [[id(19)]];
    texture2d_array<float> cp_t_tcb_C [[id(20)]];
    sampler cp_t_tcb_CSmplr [[id(21)]];
    sampler cp_t_tcb_8Smplr_w [[id(22)]];
    sampler cp_t_tcb_ASmplr_w [[id(23)]];
    sampler cp_t_tcb_ESmplr_w [[id(24)]];
    sampler cp_t_tcb_10Smplr_w [[id(25)]];
    sampler cp_t_tcb_12Smplr_w [[id(26)]];
    sampler cp_t_tcb_CSmplr_w [[id(27)]];
    constant dm_border_t* dm_border [[id(28)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _443 = false;
    bool _373 = false;
    bool _371 = false;
    float _73 = as_type<float>(gl_WorkGroupID.x);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    int _78 = as_type<int>(_73) * 64;
    int _80 = _78 + as_type<int>(_75);
    bool _84 = uint(_80) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_84)
    {
        return;
    }
    int _86 = _80 * 24;
    int _88 = _86 + 20;
    int _90 = _86 + 8;
    uint _93 = uint(int(uint(_86) >> uint(2)));
    float _95 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_93)]);
    uint _97 = uint(int(uint(_88) >> uint(2)));
    float _99 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_97)]);
    int _101 = _86 + 4;
    int _103 = _86 + 12;
    uint _105 = uint(int(uint(_90) >> uint(2)));
    float _107 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_105)]);
    int _109 = _86 + 16;
    uint _111 = uint(int(uint(_101) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_111)]);
    uint _115 = uint(int(uint(_103) >> uint(2)));
    float _117 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_115)]);
    uint _119 = uint(int(uint(_109) >> uint(2)));
    float _121 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_119)]);
    bool _123 = as_type<int>(_99) != 0;
    uint _125 = 0u;
    if (!_123)
    {
        int _127 = _80 << 6;
        int _129 = _127 + 48;
        _125 = uint(_129);
    }
    uint _131 = _125;
    if (!_123)
    {
        uint _133 = uint(int(uint(int(_131)) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_133)] = 0u;
        int _135 = int(_131) + 4;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_137)] = 0u;
        int _139 = int(_131) + 8;
        uint _141 = uint(int(uint(_139) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_141)] = 0u;
        int _143 = int(_131) + 12;
        uint _145 = uint(int(uint(_143) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_145)] = 0u;
    }
    if (!_123)
    {
        return;
    }
    float _147 = fma(_95, 6.2500002968590706586837768554688e-05, 0.5);
    float _149 = fma(_107, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _982 = float2(_147, _149);
    float _151 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_982, float2(0.0), isnan(_982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_982, float2(0.0), isnan(_982)), level(0.0)).x;
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[64]);
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[65]);
    float2 _1000 = float2(_147, _149);
    float _157 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1000, float2(0.0), isnan(_1000)), level(_151)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1000, float2(0.0), isnan(_1000)), level(_151)).y;
    int _159 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 4;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 8;
    bool _173 = _171 != 0;
    float _175 = 6.2500002968590706586837768554688e-05;
    float _177 = _147;
    int _179 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    bool _181 = _161;
    int _183 = _165 ? (-1) : 0;
    if (_161)
    {
        float _185 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _187 = _95 + _185;
        _175 = _187;
    }
    float _189 = _175;
    float _191 = 0.0;
    float _193 = _189;
    if (_161)
    {
        float _195 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _197 = _107 + _195;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = 0.0;
    float _203 = _199;
    if (_165)
    {
        float _205 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
        float _207 = _95 + _205;
        _201 = _207;
    }
    float _209 = _201;
    float _211 = 0.0;
    float _213 = _209;
    if (_165)
    {
        float _215 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
        float _217 = _107 + _215;
        _211 = _217;
    }
    float _219 = _211;
    if (_169)
    {
        float _221 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
        float _223 = _107 + _221;
        _177 = _223;
    }
    float _225 = _177;
    float _227 = _225;
    if (!_165)
    {
        _179 = 0;
    }
    int _229 = _179;
    int _231 = _229;
    if (_161)
    {
        float _233 = abs(_189);
        float _235 = abs(_199);
        float _237 = precise::max(_233, _235);
        _203 = _237;
    }
    float _239 = _203;
    float _241 = _239;
    if (!_161)
    {
        _193 = 10000.0;
    }
    float _243 = _193;
    float _245 = _243;
    if (_165)
    {
        float _247 = abs(_209);
        float _249 = abs(_219);
        float _251 = precise::max(_247, _249);
        _213 = _251;
    }
    float _253 = _213;
    float _255 = _253;
    if (_161)
    {
        float _257 = precise::min(_239, 10000.0);
        _245 = _257;
    }
    float _259 = _245;
    float _261 = _259;
    if (_169)
    {
        float _263 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
        float _265 = _95 + _263;
        _241 = _265;
    }
    float _267 = _241;
    float _269 = _267;
    if (_165)
    {
        bool _271 = _259 > _253;
        _181 = _271;
    }
    bool _273 = _181;
    if (_169)
    {
        float _275 = abs(_267);
        float _277 = abs(_225);
        float _279 = precise::max(_275, _277);
        _269 = _279;
    }
    float _281 = _269;
    if (_173)
    {
        float _283 = -_155;
        float _285 = _107 + _283;
        _227 = _285;
    }
    float _287 = _227;
    if (_165)
    {
        float _289 = _273 ? _253 : _259;
        _261 = _289;
    }
    float _291 = _261;
    float _293 = _291;
    if (_173)
    {
        float _295 = -_153;
        float _297 = _95 + _295;
        _255 = _297;
    }
    float _299 = _255;
    float _301 = _299;
    if (_165)
    {
        bool _303 = !_273;
        int _305 = _303 ? 0 : 1;
        _231 = _305;
    }
    int _307 = _231;
    bool _309 = false;
    int _311 = _307;
    if (_169)
    {
        bool _313 = _291 > _281;
        _309 = _313;
    }
    bool _315 = _309;
    if (_173)
    {
        float _317 = abs(_299);
        float _319 = abs(_287);
        float _321 = precise::max(_317, _319);
        _301 = _321;
    }
    float _323 = _301;
    if (_169)
    {
        float _325 = _315 ? _281 : _291;
        _293 = _325;
    }
    float _327 = _293;
    if (_169)
    {
        bool _329 = !_315;
        int _331 = _329 ? _307 : 2;
        _311 = _331;
    }
    int _333 = _311;
    int _335 = _333;
    if (_173)
    {
        bool _337 = _327 > _323;
        _183 = _337 ? (-1) : 0;
    }
    int _339 = _183;
    if (_173)
    {
        int _341 = ~_339;
        int _343 = (_341 != 0) ? _333 : 3;
        _335 = _343;
    }
    int _345 = _335;
    bool _347 = _345 != 0;
    bool _349 = !_347;
    float _441;
    if (!_349)
    {
        int _351 = _345 + (-1);
        uint _353 = min(uint(_351), 3u);
        int _355 = int(_353) * 4;
        uint _357 = uint(int(uint(_355) >> uint(2)));
        uint _359 = uint(int(uint(int(_357)) >> uint(2)));
        int _361 = int(_357) & 3;
        float _363 = (*spvDescriptorSet0.cp_c1)._m0[int(_359)][_361];
        bool _365 = as_type<int>(_363) == 1120;
        float _367 = as_type<float>(_355);
        if (!_365)
        {
            bool _369 = as_type<int>(_363) == 1440;
            _371 = _369;
            if (!_371)
            {
                _373 = true;
            }
        }
        if (!_371)
        {
            if (!_373)
            {
                float _375 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _377 = _95 + _375;
                int _379 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                float _381 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _383 = _107 + _381;
                float _385 = abs(_377);
                float _387 = abs(_383);
                float _389 = precise::max(_385, _387);
                uint _391 = uint(int(uint(_379) >> uint(2)));
                uint _393 = uint(int(uint(int(_391)) >> uint(2)));
                int _395 = int(_391) & 3;
                float _397 = (*spvDescriptorSet0.cp_c6)._m0[int(_393)][_395];
                float _399 = _389 * _397;
                float _401 = _399 * 4.0;
                float _403 = precise::max(_401, 1.0);
                float _405 = log2(_403);
                float _407 = precise::min(_405, 5.0);
                float _409 = floor(_407);
                int _411 = int(_409);
                float _413 = floor(_407);
                int _415 = _411 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                int _417 = _415 << 4;
                float _419 = rint(_413);
                float _421 = precise::max(_419, 0.0);
                uint _423 = uint(_421);
                uint _425 = clamp(_423, 0u, 65535u);
                uint _427 = uint(int(uint(_417) >> uint(2)));
                uint _429 = uint(int(uint(int(_427)) >> uint(2)));
                int _431 = int(_427) & 3;
                float _433 = (*spvDescriptorSet0.cp_c6)._m0[int(_429)][_431];
                float _435 = fma(_433, _383, 0.5);
                float _437 = fma(_433, _377, 0.5);
                float3 _1438 = float3(_437, _435, float(int(_425)));
                float3 _1442 = select(_1438, float3(0.0), isnan(_1438));
                float _439 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _1442.xy, uint(rint(_1442.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _1442.xy, uint(rint(_1442.z)), level(0.0)).y;
                _441 = _439;
                _443 = true;
            }
        }
        if (((!_443) || _373) || _371)
        {
            if ((!_373) || _371)
            {
                _371 = false;
                float _445 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _447 = _95 + _445;
                int _449 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                float _451 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _453 = _107 + _451;
                float _455 = abs(_447);
                float _457 = abs(_453);
                float _459 = precise::max(_455, _457);
                uint _461 = uint(int(uint(_449) >> uint(2)));
                uint _463 = uint(int(uint(int(_461)) >> uint(2)));
                int _465 = int(_461) & 3;
                float _467 = (*spvDescriptorSet0.cp_c7)._m0[int(_463)][_465];
                float _469 = _459 * _467;
                float _471 = _469 * 4.0;
                float _473 = precise::max(_471, 1.0);
                float _475 = log2(_473);
                float _477 = precise::min(_475, 5.0);
                float _479 = floor(_477);
                int _481 = int(_479);
                float _483 = floor(_477);
                int _485 = _481 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                int _487 = _485 * 16;
                float _489 = rint(_483);
                float _491 = precise::max(_489, 0.0);
                uint _493 = uint(_491);
                uint _495 = clamp(_493, 0u, 65535u);
                uint _497 = uint(int(uint(_487) >> uint(2)));
                uint _499 = uint(int(uint(int(_497)) >> uint(2)));
                int _501 = int(_497) & 3;
                float _503 = (*spvDescriptorSet0.cp_c7)._m0[int(_499)][_501];
                float _505 = fma(_503, _453, 0.5);
                float _507 = fma(_503, _447, 0.5);
                float3 _1557 = float3(_507, _505, float(int(_495)));
                float3 _1559 = select(_1557, float3(0.0), isnan(_1557));
                float _509 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _1559.xy, uint(rint(_1559.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _1559.xy, uint(rint(_1559.z)), level(0.0)).y;
                _441 = _509;
                _443 = true;
            }
            if ((!_443) || _373)
            {
                _373 = false;
                bool _511 = _345 != 3;
                if (_511)
                {
                    _367 = 0.0;
                }
                float _513 = _367;
                _441 = _513;
                _443 = _511;
                if (!_443)
                {
                    float _515 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                    int _517 = as_type<int>(_515) << 4;
                    uint _519 = uint(int(uint(_517) >> uint(2)));
                    float _521 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_519)]);
                    float _523 = -_153;
                    float _525 = _95 + _523;
                    float _527 = -_155;
                    float _529 = _107 + _527;
                    float _531 = abs(_525);
                    float _533 = abs(_529);
                    float _535 = precise::max(_531, _533);
                    float _537 = _521 * _535;
                    float _539 = _537 * 4.0;
                    float _541 = precise::max(_539, 1.0);
                    float _543 = log2(_541);
                    float _545 = precise::min(_543, 5.0);
                    float _547 = floor(_545);
                    int _549 = int(_547);
                    int _551 = as_type<int>(_515) + _549;
                    int _553 = _551 << 4;
                    uint _555 = uint(int(uint(_553) >> uint(2)));
                    float _557 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_555)]);
                    float _559 = floor(_545);
                    float _561 = rint(_559);
                    float _563 = precise::max(_561, 0.0);
                    uint _565 = uint(_563);
                    uint _567 = clamp(_565, 0u, 65535u);
                    float _569 = fma(_557, _529, 0.5);
                    float _571 = fma(_557, _525, 0.5);
                    float3 _1663 = float3(_571, _569, float(int(_567)));
                    float3 _1665 = select(_1663, float3(0.0), isnan(_1663));
                    float _573 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _1665.xy, uint(rint(_1665.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _1665.xy, uint(rint(_1665.z)), level(0.0)).y;
                    _441 = _573;
                    _443 = true;
                }
            }
        }
    }
    else
    {
        float _575 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
        float _577 = _95 + _575;
        int _579 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z) << 4;
        float _581 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
        float _583 = _107 + _581;
        float _585 = abs(_577);
        float _587 = abs(_583);
        float _589 = precise::max(_585, _587);
        uint _591 = uint(int(uint(_579) >> uint(2)));
        uint _593 = uint(int(uint(int(_591)) >> uint(2)));
        int _595 = int(_591) & 3;
        float _597 = (*spvDescriptorSet0.cp_c5)._m0[int(_593)][_595];
        float _599 = _589 * _597;
        float _601 = _599 * 4.0;
        float _603 = precise::max(_601, 1.0);
        float _605 = log2(_603);
        float _607 = precise::min(_605, 5.0);
        float _609 = floor(_607);
        int _611 = int(_609);
        float _613 = floor(_607);
        int _615 = _611 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
        int _617 = _615 << 4;
        float _619 = rint(_613);
        float _621 = precise::max(_619, 0.0);
        uint _623 = uint(_621);
        uint _625 = clamp(_623, 0u, 65535u);
        uint _627 = uint(int(uint(_617) >> uint(2)));
        uint _629 = uint(int(uint(int(_627)) >> uint(2)));
        int _631 = int(_627) & 3;
        float _633 = (*spvDescriptorSet0.cp_c5)._m0[int(_629)][_631];
        float _635 = fma(_633, _583, 0.5);
        float _637 = fma(_633, _577, 0.5);
        float3 _1770 = float3(_637, _635, float(int(_625)));
        float3 _1772 = select(_1770, float3(0.0), isnan(_1770));
        float _639 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _1772.xy, uint(rint(_1772.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _1772.xy, uint(rint(_1772.z)), level(0.0)).y;
        _441 = _639;
    }
    _443 = false;
    float _641 = _441;
    float _643 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _645 = _157 * 2000.0;
    float _647 = precise::max(_117, 0.100000001490116119384765625);
    float _649 = precise::max(_645, 220.0);
    float _651 = -_113;
    float _653 = _651 + _647;
    float _655 = _649 + _641;
    float _657 = _655 + _653;
    float _659 = -_653;
    bool _661 = _655 > _659;
    float _663 = _655;
    if (!_661)
    {
        _663 = -20.0;
    }
    float _665 = _663;
    float _667 = _643 * (-0.014499555341899394989013671875);
    float _669 = _643 * 0.01666666753590106964111328125;
    float _671 = exp2(_667);
    bool _673 = !_661;
    float _675 = _665;
    if (!_673)
    {
        float _677 = _647 * 2.0;
        float _679 = _647 * 0.4000000059604644775390625;
        float _681 = _121 * 0.00999999977648258209228515625;
        float _683 = _647 * _647;
        float _685 = 1.0 / _677;
        float _687 = precise::min(_657, _677);
        bool _689 = _687 >= _679;
        bool _691 = isnan(_687);
        bool _693 = _689 || _691;
        bool _695 = isnan(_679);
        bool _697 = _693 || _695;
        float _699 = _687 * _685;
        float _701 = _679;
        float _703 = _683;
        float _705 = _677;
        if (!_697)
        {
            float _707 = -_687;
            float _709 = _707 + _679;
            _701 = _709;
        }
        float _711 = _701;
        float _713 = _711;
        if (!_697)
        {
            float _715 = _683 * 0.4000000059604644775390625;
            _703 = _715;
        }
        float _717 = _703;
        float _719 = -_681;
        float _721 = fma(_699, 40.0, _719);
        if (!_697)
        {
            float _723 = _717 * _711;
            _713 = _723;
        }
        float _725 = _713;
        float _727 = _721 + (-20.0);
        if (_697)
        {
            _705 = _727;
        }
        float _729 = _705;
        _675 = _729;
        if (!_697)
        {
            float _731 = fma(_725, -20.0, _727);
            _675 = _731;
        }
    }
    float _733 = _675;
    float _735 = _669 * _733;
    int _737 = _80 * 64;
    uint _739 = uint(int(uint(_86) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_739)] = as_type<uint>(_95);
    float _741 = fma(_121, _671, _735);
    float _743 = fma(_669, _741, _113);
    uint _745 = uint(int(uint(_101) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_745)] = as_type<uint>(_743);
    uint _747 = uint(int(uint(_90) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_747)] = as_type<uint>(_107);
    uint _749 = uint(int(uint(_103) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_749)] = as_type<uint>(_117);
    uint _751 = uint(int(uint(_109) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_751)] = as_type<uint>(_741);
    int _753 = _737 + 16;
    uint _755 = uint(int(uint(_88) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_755)] = as_type<uint>(_99);
    int _757 = _737 + 32;
    uint _759 = uint(int(uint(_737) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_759)] = 1065353216u;
    int _761 = _737 + 4;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_763)] = 0u;
    int _765 = _737 + 8;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_767)] = 0u;
    int _769 = _737 + 12;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_771)] = as_type<uint>(_95);
    int _773 = _737 + 48;
    uint _775 = uint(int(uint(_753) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_775)] = 0u;
    int _777 = _753 + 4;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_779)] = 1065353216u;
    int _781 = _753 + 8;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_783)] = 0u;
    int _785 = _753 + 12;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_787)] = as_type<uint>(_743);
    uint _789 = uint(int(uint(_757) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_789)] = 0u;
    int _791 = _757 + 4;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_793)] = 0u;
    int _795 = _757 + 8;
    uint _797 = uint(int(uint(_795) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_797)] = 1065353216u;
    int _799 = _757 + 12;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_801)] = as_type<uint>(_107);
    uint _803 = uint(int(uint(_773) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_803)] = 1u;
    int _805 = _773 + 4;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_807)] = 0u;
    int _809 = _773 + 8;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_811)] = 0u;
    int _813 = _773 + 12;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_815)] = 0u;
}

