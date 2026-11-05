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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _863 = false;
    float _42 = as_type<float>(gl_WorkGroupID.x);
    float _44 = as_type<float>(gl_LocalInvocationID.x);
    float _46 = as_type<float>(gl_WorkGroupID.y);
    float _48 = as_type<float>(gl_LocalInvocationID.y);
    int _51 = as_type<int>(_42) << 4;
    int _53 = _51 + as_type<int>(_44);
    bool _57 = _53 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _59 = as_type<int>(_46) << 4;
    int _61 = _59 + as_type<int>(_48);
    if (_57)
    {
        return;
    }
    bool _63 = _61 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_63)
    {
        return;
    }
    bool _65 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    float _67 = float(uint(_53));
    float _69 = float(uint(_61));
    float _71 = fma(_67, (*spvDescriptorSet0.cp_c3)._m0[1].x, (*spvDescriptorSet0.cp_c3)._m0[1].z);
    float _73 = fma(_69, (*spvDescriptorSet0.cp_c3)._m0[1].y, (*spvDescriptorSet0.cp_c3)._m0[1].w);
    bool _75 = !_65;
    float _77 = -10000000.0;
    float _79 = 10000000.0;
    float _81 = 10000000.0;
    float _83 = -10000000.0;
    if (!_75)
    {
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        int _97 = 0;
        int _99 = 0;
        int _101 = 0;
        int _103 = 0;
        int _105 = 0;
        bool _211;
        do
        {
            int _107 = _85;
            int _109 = _87;
            int _111 = _89;
            int _113 = _91;
            int _115 = _93;
            int _117 = _95;
            int _119 = _97;
            int _121 = _99;
            float _123 = _77;
            float _125 = _79;
            int _127 = _101;
            int _129 = _103;
            int _131 = _105;
            bool _133 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _135 = _107 + 1;
            bool _137 = _135 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _139 = !_133;
            _85 = _135;
            float _141 = _123;
            float _143 = _125;
            int _145 = _109;
            int _147 = _111;
            int _149 = _113;
            int _151 = _115;
            int _153 = _117;
            int _155 = _119;
            int _157 = _121;
            float _159 = _123;
            float _161 = _125;
            int _163 = _127;
            int _165 = _129;
            int _167 = _131;
            int _169 = _109;
            int _171 = _111;
            int _173 = _113;
            int _175 = _115;
            int _177 = _117;
            int _179 = _119;
            int _181 = _121;
            float _183 = _123;
            float _185 = _125;
            int _187 = _127;
            int _189 = _129;
            int _191 = _131;
            if (!_139)
            {
                float _193 = float(_107);
                int _195 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _197 = _195 + 1;
                bool _199 = _197 > 3;
                bool _201 = !_199;
                int _203 = 0;
                int _205 = 0;
                int _207 = -1;
                if (!_201)
                {
                    int _209 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _207 = 0;
                    do
                    {
                        int _213 = _203;
                        float _215 = _141;
                        float _217 = _143;
                        int _219 = _213 + 1;
                        float _221 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                        int _223 = _213 + 3;
                        float _225 = float(_213);
                        float _227 = float(_219);
                        float _229 = float(_223);
                        float _231 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        int _233 = _213 + 2;
                        float _235 = fma(_227, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _237 = fma(_229, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _239 = float(_233);
                        float2 _1083 = float2(_231, _221);
                        float3 _243 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1083, float2(0.0), isnan(_1083)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1083, float2(0.0), isnan(_1083)), level(0.0)).xyz;
                        float _245 = _243.x;
                        float _247 = _243.y;
                        float _249 = _243.z;
                        float _251 = fma(_239, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1105 = float2(_235, _221);
                        float3 _253 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1105, float2(0.0), isnan(_1105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1105, float2(0.0), isnan(_1105)), level(0.0)).xyz;
                        float _255 = _253.x;
                        float _257 = _253.y;
                        float _259 = _253.z;
                        float2 _1119 = float2(_251, _221);
                        float3 _261 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1119, float2(0.0), isnan(_1119)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1119, float2(0.0), isnan(_1119)), level(0.0)).xyz;
                        float _263 = _261.x;
                        float _265 = _261.y;
                        float _267 = _261.z;
                        float2 _1133 = float2(_237, _221);
                        float3 _269 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1133, float2(0.0), isnan(_1133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1133, float2(0.0), isnan(_1133)), level(0.0)).xyz;
                        float _271 = _269.x;
                        float _273 = _269.y;
                        float _275 = _269.z;
                        int _277 = _213 + 4;
                        bool _279 = _277 >= _209;
                        float _281 = abs(_247);
                        float _283 = log2(_281);
                        float _285 = abs(_245);
                        float _287 = log2(_285);
                        float _289 = abs(_249);
                        float _291 = log2(_289);
                        float _293 = _283 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _295 = abs(_255);
                        float _297 = log2(_295);
                        float _299 = _287 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _301 = abs(_257);
                        float _303 = log2(_301);
                        float _305 = _291 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _307 = abs(_263);
                        float _309 = log2(_307);
                        float _311 = exp2(_293);
                        float _313 = _297 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _315 = _303 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _317 = abs(_259);
                        float _319 = log2(_317);
                        float _321 = exp2(_299);
                        float _323 = abs(_265);
                        float _325 = log2(_323);
                        float _327 = _319 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _329 = _311 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                        float _331 = exp2(_305);
                        float _333 = _309 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _335 = _311 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                        float _337 = _311 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                        float _339 = fma(_321, (*spvDescriptorSet0.cp_c3)._m0[6].x, _335);
                        float _341 = abs(_273);
                        float _343 = log2(_341);
                        float _345 = _325 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _347 = fma(_321, (*spvDescriptorSet0.cp_c3)._m0[5].x, _329);
                        float _349 = fma(_321, (*spvDescriptorSet0.cp_c3)._m0[7].x, _337);
                        float _351 = abs(_267);
                        float _353 = log2(_351);
                        float _355 = fma(_331, (*spvDescriptorSet0.cp_c3)._m0[6].z, _339);
                        float _357 = fma(_331, (*spvDescriptorSet0.cp_c3)._m0[5].z, _347);
                        float _359 = fma(_331, (*spvDescriptorSet0.cp_c3)._m0[7].z, _349);
                        float _361 = _355 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                        float _363 = exp2(_315);
                        float _365 = fma(_357, (*spvDescriptorSet0.cp_c3)._m0[8].x, _361);
                        float _367 = _343 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _369 = fma(_359, (*spvDescriptorSet0.cp_c3)._m0[8].z, _365);
                        float _371 = abs(_271);
                        float _373 = log2(_371);
                        float _375 = _353 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _377 = exp2(_313);
                        float _379 = _363 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                        float _381 = _363 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                        float _383 = _363 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                        float _385 = abs(_275);
                        float _387 = log2(_385);
                        float _389 = _373 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _391 = exp2(_327);
                        float _393 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[6].x, _379);
                        float _395 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[5].x, _381);
                        float _397 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[7].x, _383);
                        float _399 = exp2(_345);
                        float _401 = _387 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _403 = exp2(_333);
                        float _405 = fma(_391, (*spvDescriptorSet0.cp_c3)._m0[6].z, _393);
                        float _407 = fma(_391, (*spvDescriptorSet0.cp_c3)._m0[5].z, _395);
                        float _409 = fma(_391, (*spvDescriptorSet0.cp_c3)._m0[7].z, _397);
                        float _411 = _405 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                        float _413 = exp2(_367);
                        float _415 = _399 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                        float _417 = fma(_407, (*spvDescriptorSet0.cp_c3)._m0[8].x, _411);
                        float _419 = _399 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                        float _421 = _399 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                        float _423 = fma(_409, (*spvDescriptorSet0.cp_c3)._m0[8].z, _417);
                        float _425 = exp2(_375);
                        float _427 = fma(_403, (*spvDescriptorSet0.cp_c3)._m0[6].x, _415);
                        float _429 = fma(_403, (*spvDescriptorSet0.cp_c3)._m0[5].x, _419);
                        float _431 = fma(_403, (*spvDescriptorSet0.cp_c3)._m0[7].x, _421);
                        float _433 = exp2(_389);
                        float _435 = _413 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                        float _437 = _413 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                        float _439 = _413 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                        float _441 = exp2(_401);
                        float _443 = fma(_425, (*spvDescriptorSet0.cp_c3)._m0[6].z, _427);
                        float _445 = fma(_425, (*spvDescriptorSet0.cp_c3)._m0[5].z, _429);
                        float _447 = fma(_425, (*spvDescriptorSet0.cp_c3)._m0[7].z, _431);
                        float _449 = _443 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                        float _451 = fma(_433, (*spvDescriptorSet0.cp_c3)._m0[6].x, _435);
                        float _453 = fma(_433, (*spvDescriptorSet0.cp_c3)._m0[5].x, _437);
                        float _455 = fma(_445, (*spvDescriptorSet0.cp_c3)._m0[8].x, _449);
                        float _457 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[8].w;
                        float _459 = fma(_433, (*spvDescriptorSet0.cp_c3)._m0[7].x, _439);
                        float _461 = fma(_447, (*spvDescriptorSet0.cp_c3)._m0[8].z, _455);
                        float _463 = fma(_441, (*spvDescriptorSet0.cp_c3)._m0[6].z, _451);
                        float _465 = fma(_441, (*spvDescriptorSet0.cp_c3)._m0[5].z, _453);
                        float _467 = fma(_441, (*spvDescriptorSet0.cp_c3)._m0[7].z, _459);
                        float _469 = abs(_369);
                        float _471 = log2(_469);
                        float _473 = _463 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                        float _475 = fma(_465, (*spvDescriptorSet0.cp_c3)._m0[8].x, _473);
                        float _477 = abs(_423);
                        float _479 = log2(_477);
                        float _481 = fma(_467, (*spvDescriptorSet0.cp_c3)._m0[8].z, _475);
                        float _483 = abs(_461);
                        float _485 = log2(_483);
                        float _487 = _457 * _471;
                        float _489 = abs(_481);
                        float _491 = log2(_489);
                        float _493 = _457 * _479;
                        float _495 = exp2(_487);
                        float _497 = _457 * _485;
                        float _499 = exp2(_493);
                        float _501 = _457 * _491;
                        float _503 = exp2(_497);
                        float _505 = precise::max(_495, _215);
                        float _507 = precise::min(_495, _217);
                        float _509 = exp2(_501);
                        float _511 = precise::max(_505, _499);
                        float _513 = precise::min(_507, _499);
                        float _515 = precise::max(_511, _503);
                        float _517 = precise::min(_513, _503);
                        float _519 = precise::max(_515, _509);
                        float _521 = precise::min(_517, _509);
                        _211 = !_279;
                        _203 = _277;
                        _141 = _519;
                        _143 = _521;
                        _145 = as_type<int>(_369);
                        _147 = as_type<int>(_443);
                        _149 = as_type<int>(_383);
                        _151 = as_type<int>(_447);
                        _153 = as_type<int>(_275);
                        _155 = as_type<int>(_463);
                        _157 = as_type<int>(_449);
                        _159 = _519;
                        _161 = _521;
                        _205 = _277;
                        _163 = as_type<int>(_509);
                        _165 = as_type<int>(_457);
                        _167 = as_type<int>(_481);
                    } while (_211);
                }
                int _523 = _145;
                int _525 = _147;
                int _527 = _149;
                int _529 = _151;
                int _531 = _153;
                int _533 = _155;
                int _535 = _157;
                float _537 = _159;
                float _539 = _161;
                int _541 = _205;
                int _543 = _163;
                int _545 = _165;
                int _547 = _207;
                int _549 = _167;
                int _551 = ~_541;
                int _553 = _551 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _555 = _553 + 1;
                bool _557 = _555 > 1;
                bool _559 = !_557;
                int _561 = _523;
                int _563 = _525;
                int _565 = _529;
                int _567 = _535;
                float _569 = _537;
                float _571 = _539;
                int _573 = _543;
                int _575 = _545;
                int _577 = _541;
                int _579 = _547;
                int _581 = _549;
                _173 = _527;
                _177 = _531;
                _179 = _533;
                if (!_559)
                {
                    float _583 = float(_541);
                    float _585 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _587 = _541 + 1;
                    float _589 = fma(_583, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _591 = float(_587);
                    float _593 = fma(_591, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1661 = float2(_589, _585);
                    float3 _595 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1661, float2(0.0), isnan(_1661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1661, float2(0.0), isnan(_1661)), level(0.0)).xyz;
                    float _597 = _595.x;
                    float _599 = _595.y;
                    float _601 = _595.z;
                    float2 _1675 = float2(_593, _585);
                    float3 _603 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1675, float2(0.0), isnan(_1675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1675, float2(0.0), isnan(_1675)), level(0.0)).xyz;
                    float _605 = _603.x;
                    float _607 = _603.y;
                    float _609 = _603.z;
                    int _611 = _541 + 2;
                    float _613 = abs(_599);
                    float _615 = log2(_613);
                    float _617 = abs(_597);
                    float _619 = log2(_617);
                    float _621 = abs(_601);
                    float _623 = log2(_621);
                    float _625 = _615 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _627 = abs(_607);
                    float _629 = log2(_627);
                    float _631 = _619 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _633 = abs(_605);
                    float _635 = log2(_633);
                    float _637 = _623 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _639 = abs(_609);
                    float _641 = log2(_639);
                    float _643 = _629 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _645 = exp2(_625);
                    float _647 = _635 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _649 = exp2(_631);
                    float _651 = _641 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _653 = exp2(_637);
                    float _655 = _645 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                    float _657 = _645 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                    float _659 = _645 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                    float _661 = exp2(_643);
                    float _663 = fma(_649, (*spvDescriptorSet0.cp_c3)._m0[6].x, _655);
                    float _665 = fma(_649, (*spvDescriptorSet0.cp_c3)._m0[5].x, _657);
                    float _667 = fma(_649, (*spvDescriptorSet0.cp_c3)._m0[7].x, _659);
                    float _669 = exp2(_647);
                    float _671 = fma(_653, (*spvDescriptorSet0.cp_c3)._m0[6].z, _663);
                    float _673 = fma(_653, (*spvDescriptorSet0.cp_c3)._m0[5].z, _665);
                    float _675 = fma(_653, (*spvDescriptorSet0.cp_c3)._m0[7].z, _667);
                    float _677 = _671 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                    float _679 = exp2(_651);
                    float _681 = _661 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                    float _683 = _661 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                    float _685 = fma(_673, (*spvDescriptorSet0.cp_c3)._m0[8].x, _677);
                    float _687 = _661 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                    float _689 = fma(_675, (*spvDescriptorSet0.cp_c3)._m0[8].z, _685);
                    float _691 = fma(_669, (*spvDescriptorSet0.cp_c3)._m0[6].x, _681);
                    float _693 = fma(_669, (*spvDescriptorSet0.cp_c3)._m0[5].x, _683);
                    float _695 = fma(_669, (*spvDescriptorSet0.cp_c3)._m0[7].x, _687);
                    float _697 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _699 = fma(_679, (*spvDescriptorSet0.cp_c3)._m0[6].z, _691);
                    float _701 = fma(_679, (*spvDescriptorSet0.cp_c3)._m0[5].z, _693);
                    float _703 = fma(_679, (*spvDescriptorSet0.cp_c3)._m0[7].z, _695);
                    float _705 = abs(_689);
                    float _707 = log2(_705);
                    float _709 = _699 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                    float _711 = fma(_701, (*spvDescriptorSet0.cp_c3)._m0[8].x, _709);
                    float _713 = fma(_703, (*spvDescriptorSet0.cp_c3)._m0[8].z, _711);
                    float _715 = abs(_713);
                    float _717 = log2(_715);
                    float _719 = _697 * _707;
                    float _721 = exp2(_719);
                    float _723 = _697 * _717;
                    float _725 = exp2(_723);
                    float _727 = precise::max(_537, _721);
                    float _729 = precise::min(_539, _721);
                    float _731 = precise::max(_727, _725);
                    float _733 = precise::min(_729, _725);
                    _561 = as_type<int>(_679);
                    _563 = as_type<int>(_703);
                    _565 = as_type<int>(_655);
                    _567 = as_type<int>(_687);
                    _569 = _731;
                    _571 = _733;
                    _573 = as_type<int>(_629);
                    _575 = as_type<int>(_717);
                    _577 = _611;
                    _579 = 0;
                    _581 = as_type<int>(_707);
                }
                int _735 = _561;
                int _737 = _563;
                int _739 = _565;
                int _741 = _567;
                float _743 = _569;
                float _745 = _571;
                int _747 = _573;
                int _749 = _575;
                int _751 = _577;
                int _753 = _579;
                int _755 = _581;
                bool _757 = _751 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _759 = (_757 ? (-1) : 0) | _753;
                int _761 = ~_759;
                _169 = _735;
                _171 = _737;
                _175 = _739;
                _181 = _741;
                _183 = _743;
                _185 = _745;
                _187 = _747;
                _189 = _749;
                _191 = _755;
                if (!(_761 != 0))
                {
                    float _763 = float(_751);
                    float _765 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _767 = fma(_763, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1961 = float2(_767, _765);
                    float3 _769 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1961, float2(0.0), isnan(_1961)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1961, float2(0.0), isnan(_1961)), level(0.0)).xyz;
                    float _771 = _769.x;
                    float _773 = _769.y;
                    float _775 = _769.z;
                    float _777 = abs(_773);
                    float _779 = log2(_777);
                    float _781 = abs(_771);
                    float _783 = log2(_781);
                    float _785 = abs(_775);
                    float _787 = log2(_785);
                    float _789 = _779 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _791 = _783 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _793 = exp2(_789);
                    float _795 = _787 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _797 = exp2(_791);
                    float _799 = exp2(_795);
                    float _801 = _793 * (*spvDescriptorSet0.cp_c3)._m0[6].y;
                    float _803 = _793 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
                    float _805 = _793 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
                    float _807 = fma(_797, (*spvDescriptorSet0.cp_c3)._m0[6].x, _801);
                    float _809 = fma(_797, (*spvDescriptorSet0.cp_c3)._m0[5].x, _803);
                    float _811 = fma(_797, (*spvDescriptorSet0.cp_c3)._m0[7].x, _805);
                    float _813 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[8].w;
                    float _815 = fma(_799, (*spvDescriptorSet0.cp_c3)._m0[6].z, _807);
                    float _817 = fma(_799, (*spvDescriptorSet0.cp_c3)._m0[5].z, _809);
                    float _819 = fma(_799, (*spvDescriptorSet0.cp_c3)._m0[7].z, _811);
                    float _821 = _815 * (*spvDescriptorSet0.cp_c3)._m0[8].y;
                    float _823 = fma(_817, (*spvDescriptorSet0.cp_c3)._m0[8].x, _821);
                    float _825 = fma(_819, (*spvDescriptorSet0.cp_c3)._m0[8].z, _823);
                    float _827 = abs(_825);
                    float _829 = log2(_827);
                    float _831 = _829 * _813;
                    float _833 = exp2(_831);
                    float _835 = precise::max(_743, _833);
                    float _837 = precise::min(_745, _833);
                    _175 = as_type<int>(_801);
                    _183 = _835;
                    _185 = _837;
                    _189 = as_type<int>(_793);
                    _191 = as_type<int>(_799);
                }
            }
            int _839 = _169;
            int _841 = _171;
            int _843 = _173;
            int _845 = _175;
            int _847 = _177;
            int _849 = _179;
            int _851 = _181;
            float _853 = _183;
            float _855 = _185;
            int _857 = _187;
            int _859 = _189;
            int _861 = _191;
            _87 = _839;
            _89 = _841;
            _91 = _843;
            _93 = _845;
            _95 = _847;
            _97 = _849;
            _99 = _851;
            _77 = _853;
            _79 = _855;
            _101 = _857;
            _103 = _859;
            _105 = _861;
            _81 = _855;
            _83 = _853;
            if (_137)
            {
                _863 = true;
                if (_863)
                {
                    break;
                }
            }
        } while (true);
    }
    _863 = false;
    float _865 = _81;
    float _867 = _83;
    int _869 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _871 = _869 + _53;
    float _873 = -_865;
    float _875 = _873 + _867;
    int _877 = _871 << 2;
    uint _880 = uint(int(uint(_877) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_880)] = as_type<uint>(_875);
}

