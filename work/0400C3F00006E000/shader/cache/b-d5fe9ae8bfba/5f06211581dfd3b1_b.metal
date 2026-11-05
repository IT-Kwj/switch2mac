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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_22 [[id(6)]];
    sampler vp_t_tcb_22Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_22Smplr_w [[id(16)]];
    sampler vp_t_tcb_14Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_73 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_51.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_54.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_120);
        out.gl_Position.z = _2511;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_56.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_54.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_156);
        out.gl_Position.z = _2576;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = in.m_58.x;
    float _166 = in.m_58.y;
    float _168 = in.m_58.z;
    float _170 = in.m_58.w;
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_60.w;
    float _180 = in.m_62.x;
    float _182 = in.m_62.y;
    float _184 = in.m_62.z;
    float _186 = in.m_62.w;
    float _188 = _160 * _166;
    float _190 = fma(_158, _164, _188);
    float _192 = _160 * _174;
    float _194 = fma(_162, _168, _190);
    float _196 = _160 * _182;
    float _198 = fma(_158, _172, _192);
    float _200 = _194 + _170;
    float _202 = fma(_158, _180, _196);
    float _204 = fma(_162, _176, _198);
    float _206 = _200 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _208 = fma(_162, _184, _202);
    float _210 = _204 + _178;
    float _212 = _206 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _216 = _208 + _186;
    float _218 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _212);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _214);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].z, _218);
    float _224 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _230 = trunc(_226);
    int _232 = int(_230);
    float _234 = trunc(_228);
    int _236 = int(_234);
    int _238 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _240 = _232 + _238;
    int _242 = _240 + 1;
    bool _244 = _242 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _246 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _248 = _236 + _246;
    int _250 = _248 + 1;
    int _252 = _242 | _250;
    bool _254 = _252 < 0;
    bool _256 = _254 || _244;
    bool _258 = _250 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _260 = _258 || _256;
    int _262 = _250;
    int _264 = as_type<int>(_168);
    int _266 = _242;
    float _268 = _208;
    float _270 = _206;
    if (!_260)
    {
        int _272 = _250 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _274 = _272 + _242;
        _262 = _274;
    }
    int _276 = _262;
    float _278 = as_type<float>(_252);
    if (!_260)
    {
        float _280 = floor(_228);
        _278 = _280;
    }
    float _282 = _278;
    if (!_260)
    {
        int _284 = _276 << 2;
        _264 = _284;
    }
    int _286 = _264;
    int _288 = _286;
    if (!_260)
    {
        uint _291 = uint(int(uint(_276) >> uint(2)));
        _266 = int(_291);
    }
    int _293 = _266;
    if (!_260)
    {
        int _295 = 12 & _286;
        _288 = _295;
    }
    int _297 = _288;
    float _299 = 0.0;
    if (!_260)
    {
        int _301 = _293 << 4;
        int _303 = _301 + _297;
        _299 = as_type<float>(_303);
    }
    float _305 = _299;
    float _307 = as_type<float>(_293);
    if (!_260)
    {
        float _309 = floor(_226);
        _307 = _309;
    }
    float _311 = _307;
    if (!_260)
    {
        float _313 = -_282;
        float _315 = _228 + _313;
        _268 = _315;
    }
    float _317 = _268;
    float _319 = _305;
    if (!_260)
    {
        int _321 = as_type<int>(_305) + 400;
        uint _323 = uint(int(uint(_321) >> uint(2)));
        uint _325 = uint(int(uint(int(_323)) >> uint(2)));
        int _327 = int(_323) & 3;
        float _329 = (*spvDescriptorSet0.vp_c15)._m0[int(_325)][_327];
        _319 = _329;
    }
    float _331 = _319;
    float _333 = fma(_210, 6.2500002968590706586837768554688e-05, 0.5);
    float _335 = fma(_216, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2871 = float2(_333, _335);
    float _337 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_2871, float2(0.0), isnan(_2871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_2871, float2(0.0), isnan(_2871)), level(0.0)).x;
    float _339 = 0.0;
    if (!_260)
    {
        float _341 = -_311;
        float _343 = _226 + _341;
        _339 = _343;
    }
    float _345 = _339;
    float _347 = 0.0;
    if (!_260)
    {
        float _349 = rint(_331);
        float _351 = precise::max(_349, 0.0);
        uint _353 = uint(_351);
        uint _355 = clamp(_353, 0u, 65535u);
        _347 = as_type<float>(_355);
    }
    float _357 = _347;
    float _359 = _317;
    if (!_260)
    {
        float3 _2916 = float3(_345, _317, float(as_type<int>(_357)));
        float3 _2920 = select(_2916, float3(0.0), isnan(_2916));
        float _361 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _2920.xy, uint(rint(_2920.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _2920.xy, uint(rint(_2920.z)), level(0.0)).x;
        _359 = _361;
    }
    float _363 = _359;
    float _365 = in.m_64.z;
    float _367 = 1.0 / _126;
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = -_216;
    float _375 = _373 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _381 = int(_379);
    float _383 = _130 * 0.25;
    float _385 = _367 * _130;
    float _387 = _365 * 2.0;
    float _389 = _371 + _365;
    float _391 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = floor(_387);
    float _395 = _369 + _365;
    float _397 = _389 + (-1.0);
    float _399 = _371 * 2.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = -_377;
    float _405 = fma(_391, 2.0, _403);
    float _407 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = _395 + (-1.0);
    float _417 = _369 * 2.0;
    float _419 = fma(_409, -2.0, _401);
    float _421 = float(_381);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _425 = _369 + _371;
    float _427 = -_130;
    float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _405);
    bool _431 = _393 > 0.0;
    float _433 = floor(_399);
    bool _435 = _393 >= 0.0;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 + (-1.0);
    float _447 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _459 = _457 != 0;
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = _413 * _130;
    int _465 = _443 ? 0 : 1;
    float _467 = floor(_417);
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    bool _473 = !_451;
    int _475 = _473 ? 0 : 1;
    bool _477 = !_459;
    int _479 = _477 ? 0 : 1;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _491 = _489 != 0;
    float _493 = exp2(_463);
    int _495 = ~_465;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    int _501 = _499;
    float _503 = _375;
    if (!_431)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _501 = _507;
    }
    int _509 = _501;
    bool _511 = !_483;
    int _513 = _511 ? 0 : 1;
    float _515 = float(_509);
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _519 = int(_517);
    int _521 = abs(_513);
    bool _523 = _433 >= 0.0;
    bool _525 = isnan(_433);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = float(_521);
    float _535 = 1.0 / _421;
    int _537 = _531 ? 0 : 1;
    float _539 = _533 * _515;
    float _541 = -_493;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    bool _549 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    bool _559 = _467 > 0.0;
    float _561 = 1.0 / _547;
    bool _563 = _467 >= 0.0;
    bool _565 = isnan(_467);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    float _573 = _557 ? _543 : 0.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _589 = _433 > 0.0;
    float _591 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = float(_519);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _587);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _599 = _210 + _597;
    float _601 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _603 = _539 * (-2.0);
    float _605 = _593 * _130;
    float _607 = _535 * _130;
    float _609 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    float _611 = abs(_599);
    float _613 = abs(_375);
    float _615 = precise::max(_611, _613);
    if (_585)
    {
        float _617 = _573 * _561;
        _150 = _617;
    }
    float _619 = _150;
    int _621 = ~_537;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_461, _603, _461);
    int _629 = _625;
    int _631 = as_type<int>(_619);
    if (!_589)
    {
        int _633 = ~_537;
        int _635 = _633 + 1;
        _629 = _635;
    }
    int _637 = _629;
    float _639 = _369 + (-0.5);
    float _641 = as_type<float>(int(gl_VertexIndex));
    int _643 = _571 ? 0 : 1;
    float _645 = ceil(_383);
    bool _647 = _615 >= 16.0;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _651 = !_487;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_491;
    int _657 = _655 ? 0 : 1;
    float _659 = fma(_627, _619, _649);
    int _661 = ~_643;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    int _667 = _665;
    if (!_559)
    {
        int _669 = ~_643;
        int _671 = _669 + 1;
        _667 = _671;
    }
    int _673 = _667;
    float _675 = _599 * 0.0625;
    int _677 = abs(_653);
    float _679 = _659 * 0.15915493667125701904296875;
    int _681 = abs(_657);
    if (_647)
    {
        float _683 = _375 * 0.0625;
        _503 = _683;
    }
    float _685 = _503;
    float _687 = _647 ? _675 : _599;
    float _689 = _645 * 0.5;
    float _691 = float(_681);
    float _693 = _679 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = float(_637);
    float _699 = _371 + (-0.5);
    float _701 = float(_677);
    float _703 = float(_673);
    float _705 = _691 * _697;
    float _707 = abs(_687);
    bool _709 = _707 != 0.0;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = floor(_689);
    float _721 = _701 * _703;
    float _723 = abs(_685);
    bool _725 = _723 == 0.0;
    bool _727 = !_717;
    bool _729 = _725 && _727;
    float _731 = in.m_69.x;
    float _733 = in.m_69.y;
    float _735 = _705 * (-2.0);
    float _737 = _721 * (-2.0);
    int _739 = as_type<int>(_641) & 1;
    bool _741 = _739 != 0;
    int _743 = as_type<int>(_641) & 2;
    bool _745 = _743 != 0;
    float _747 = fma(_423, _735, _423);
    float _749 = abs(_685);
    bool _751 = _749 == 0.0;
    float _753 = fma(_407, _737, _407);
    float _755 = _365 + (-0.5);
    float _757 = _699 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _759 = _679 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _765 = _487;
    int _767 = as_type<int>(_641);
    int _769 = _729 ? (-1) : 0;
    if (_729)
    {
        bool _771 = as_type<int>(_685) >= 0;
        _765 = _771;
    }
    bool _773 = _765;
    float _775 = fma(_753, _619, _757);
    bool _777 = !_741;
    float _779 = _777 ? (-0.5) : 0.5;
    float _781 = fma(_747, _619, _763);
    if (_729)
    {
        int _783 = _773 ? 0 : 1078530011;
        _767 = _783;
    }
    int _785 = _767;
    bool _787 = !_745;
    float _789 = _787 ? (-0.5) : 0.5;
    if (_729)
    {
        int _791 = int(0x80000000) & as_type<int>(_687);
        int _793 = _785 | _791;
        _631 = _793;
    }
    int _795 = _631;
    bool _797 = !_717;
    bool _799 = _797 && _751;
    int _801 = _795;
    float _803 = as_type<float>(_795);
    if (!_799)
    {
        float _805 = abs(_687);
        bool _807 = _805 != as_type<float>(0x7f800000u /* inf */);
        bool _809 = isnan(_805);
        bool _811 = _807 || _809;
        bool _813 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _815 = _811 || _813;
        float _817 = abs(_685);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        float _821 = abs(_685);
        bool _823 = _821 == as_type<float>(0x7f800000u /* inf */);
        bool _825 = !_815;
        bool _827 = _823 && _825;
        if (_827)
        {
            bool _829 = as_type<int>(_685) >= 0;
            _769 = _829 ? (-1) : 0;
        }
        int _831 = _769;
        if (_827)
        {
            _801 = 1075235812;
        }
        int _833 = _801;
        int _835 = _833;
        if (_827)
        {
            int _837 = ~_831;
            int _839 = (_837 != 0) ? _833 : 1061752795;
            _835 = _839;
        }
        int _841 = _835;
        float _843 = as_type<float>(_841);
        if (_827)
        {
            int _845 = int(0x80000000) & as_type<int>(_687);
            int _847 = _841 | _845;
            _843 = as_type<float>(_847);
        }
        float _849 = _843;
        bool _851 = !_815;
        bool _853 = _851 && _819;
        _803 = _849;
        if (!_853)
        {
            float _855 = abs(_685);
            float _857 = abs(_687);
            float _859 = precise::max(_855, _857);
            float _861 = abs(_685);
            float _863 = abs(_687);
            float _865 = precise::min(_861, _863);
            float _867 = 1.0 / _859;
            float _869 = abs(_687);
            float _871 = abs(_685);
            bool _873 = _869 > _871;
            bool _875 = as_type<int>(_685) >= 0;
            float _877 = abs(_685);
            float _879 = abs(_687);
            float _881 = _877 + _879;
            int _883 = as_type<int>(_687) & int(0x80000000);
            bool _885 = _881 > as_type<float>(0x7f800000u /* inf */);
            bool _887 = isnan(_881);
            bool _889 = _885 || _887;
            bool _891 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _893 = _889 || _891;
            float _895 = _865 * _867;
            float _897 = _895 * _895;
            float _899 = _897 + 11.33538818359375;
            float _901 = fma(_897, _899, 28.84246826171875);
            float _903 = fma(_897, _901, 19.6966705322265625);
            float _905 = fma(_897, -0.82336294651031494140625, -5.674867153167724609375);
            float _907 = fma(_897, _905, -6.565555095672607421875);
            float _909 = 1.0 / _903;
            float _911 = _897 * _907;
            float _913 = _895 * _911;
            float _915 = fma(_913, _909, _895);
            float _917 = _915;
            _803 = _881;
            if (_873)
            {
                float _919 = -_915;
                float _921 = _919 + 1.57079637050628662109375;
                _917 = _921;
            }
            float _923 = _917;
            int _925 = as_type<int>(_923);
            if (!_875)
            {
                float _927 = -_923;
                float _929 = _927 + 3.1415927410125732421875;
                _925 = as_type<int>(_929);
            }
            int _931 = _925;
            if (!_893)
            {
                int _933 = _883 | _931;
                _803 = as_type<float>(_933);
            }
        }
    }
    float _935 = _803;
    float _937 = -_935;
    float _939 = _775 + _937;
    float _941 = fma(_719, -2.0, _645);
    bool _943 = _385 < 0.85000002384185791015625;
    float _945 = float(_943);
    float _947 = _781 * 0.15915493667125701904296875;
    float _949 = _939 * 0.15915493667125701904296875;
    float _951 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = precise::max(_941, _945);
    float _955 = _947 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _733 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = _789 * _953;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _967 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _975 = _971 || _973;
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _963);
    float _983 = _779 * _953;
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _981 * _965;
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _957 * _987;
    float _997 = _989 * _985;
    float _999 = _947 * 6.283185482025146484375;
    float _1001 = sin(_999);
    float _1003 = _761 * _979;
    float _1005 = _695 * _995;
    float _1007 = _695 * _979;
    float _1009 = _695 * _993;
    float _1011 = _761 * _993;
    float _1013 = _993 * _957;
    float _1015 = _979 * _957;
    float _1017 = _761 * _995;
    float _1019 = _200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = -_1003;
    float _1023 = fma(_1001, _1009, _1021);
    float _1025 = -_987;
    float _1027 = _1001 * _1025;
    float _1029 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1031 = fma(_1023, _997, _1005);
    float _1033 = fma(_1001, _1007, _1011);
    float _1035 = fma(_1013, _997, _1027);
    float _1037 = fma(_1001, _1011, _1007);
    float _1039 = -_1009;
    float _1041 = fma(_1001, _1003, _1039);
    float _1043 = fma(_1033, _961, _1031);
    float _1045 = fma(_1015, _961, _1035);
    float _1047 = fma(_1037, _997, _1017);
    float _1049 = _200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1051 = _216 + _1043;
    float _1053 = _210 + _1045;
    float _1055 = fma(_1041, _961, _1047);
    float _1057 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1049);
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1061 = _1051 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1053 + _1063;
    float _1067 = _200 + _1055;
    float _1069 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    float _1071 = _1061 * _1061;
    float _1073 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1029);
    float _1075 = fma(_1065, _1065, _1071);
    float _1077 = sqrt(_1075);
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1081 = _1079 != 0;
    bool _1083 = _1077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1087 = _1029;
    float _1089 = _1057;
    if (!_1083)
    {
        _1085 = _1053;
    }
    float _1091 = _1085;
    float _1093 = _1091;
    if (!_1083)
    {
        _1087 = _1051;
    }
    float _1095 = _1087;
    float _1097 = _1095;
    if (!_1083)
    {
        _1089 = _1067;
    }
    float _1099 = _1089;
    bool _1101 = !_1083;
    float _1103 = _1099;
    if (!_1101)
    {
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1109 = _1077 + _1107;
        float _1111 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = rsqrt(_1075);
        float _1115 = _1109 * _1105;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = _1117 * 6.283185482025146484375;
        float _1121 = cos(_1119);
        float _1123 = _1117 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1121 + (-1.0);
        float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = fma(_1125, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1133 = fma(_1067, _1121, _1129);
        float _1135 = _1113 * _1131;
        float _1137 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1139 = fma(_1061, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1139;
        _1103 = _1133;
        _1093 = _1137;
    }
    float _1141 = _1097;
    float _1143 = _1103;
    float _1145 = _1093;
    float _1147 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1149 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1151 = _1143;
    float _1153 = _1145;
    float _1155 = _1141;
    if (!_975)
    {
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1159 = _200 + _1157;
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = -_216;
        float _1165 = _1163 + _1141;
        float _1167 = _1159 * _1159;
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1171 = _216 + _1169;
        float _1173 = fma(_599, _599, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1171, _1171, _1173);
        float _1179 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = sqrt(_1177);
        float _1183 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_200;
        float _1189 = _1187 + _1143;
        float _1191 = _1179 * _1185;
        float _1193 = -_210;
        float _1195 = _1193 + _1145;
        float _1197 = fma(_1189, _1191, _200);
        float _1199 = fma(_1195, _1191, _210);
        float _1201 = fma(_1165, _1191, _216);
        _1151 = _1197;
        _1153 = _1199;
        _1155 = _1201;
    }
    float _1203 = _1151;
    float _1205 = _1153;
    float _1207 = _1155;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = 1.0 / _1149;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1211);
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1219);
    bool _1229 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1231 = isnan(0.5);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1237 = _1233 || _1235;
    float _1239 = _1147 + _1149;
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1245 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1247 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1243);
    float _1259 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1265 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1267 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1271);
    float _1281 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1285 = _1239 * _1215;
    float _1287 = _1285 * 0.5;
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1291 = _1273;
    float _1293 = _1269;
    float _1295 = _1277;
    float _1297 = _1287;
    float _1299 = _1279;
    float _1301 = _1283;
    if (_1237)
    {
        _1291 = 1.0;
    }
    float _1303 = _1291;
    float _1305 = _1303;
    if (!_1237)
    {
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1315 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1313);
        float _1317 = _1309 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1311 * 0.15915493667125701904296875;
        float _1323 = _1309 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = 1.0 / _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1329;
        float _1333 = _1321 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1325 * _1327;
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1335 * _1337;
        float _1345 = 1.0 / _1315;
        float _1347 = 1.0 / _1343;
        float _1349 = 1.0 / _1331;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1353 = _1345 * _1351;
        float _1355 = _1341 * _1347;
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = fma(_1355, _1353, _1357);
        float _1361 = _1359 * _1349;
        float _1363 = precise::clamp(_1361, 0.0, 1.0);
        _1293 = _1353;
        _1295 = _1359;
        _1297 = _1345;
        _1305 = _1363;
    }
    float _1365 = _1293;
    float _1367 = _1295;
    float _1369 = _1297;
    float _1371 = _1305;
    out.gl_Position.x = _1283;
    out.gl_Position.y = _1279;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1281;
    float _1373 = abs(_337);
    bool _1375 = _1373 != 0.0;
    bool _1377 = isnan(_1373);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = _1365;
    float _1387 = _1369;
    float _1389 = _1367;
    if (_1237)
    {
        _1385 = 1.0;
    }
    float _1391 = _1385;
    float _1393 = _1391;
    if (_1383)
    {
        _1387 = _1281;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1383)
    {
        _1397 = 0.0;
    }
    float _1399 = _1397;
    float _1401 = _1399;
    if (!_1237)
    {
        float _1403 = as_type<float>(in.m_73.w);
        int _1405 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1407 = _1405 == 4;
        bool _1409 = _1405 == 8;
        bool _1411 = _1405 == 12;
        int _1413 = as_type<int>(_1403) << 16;
        int _1415 = as_type<int>(_1403) << 8;
        int _1417 = as_type<int>(_1403) << 24;
        int _1419 = _1413 >> 24;
        int _1421 = _1415 >> 24;
        int _1423 = as_type<int>(_1403) >> 24;
        int _1425 = _1417 >> 24;
        float _1427 = float(_1419);
        float _1429 = float(_1421);
        float _1431 = float(_1423);
        float _1433 = _1427 * 0.0078740157186985015869140625;
        float _1435 = float(_1425);
        float _1437 = _1429 * 0.0078740157186985015869140625;
        float _1439 = _1431 * 0.0078740157186985015869140625;
        float _1441 = precise::min(_1433, 1.0);
        float _1443 = _1435 * 0.0078740157186985015869140625;
        float _1445 = precise::min(_1437, 1.0);
        float _1447 = precise::min(_1439, 1.0);
        float _1449 = precise::min(_1443, 1.0);
        float _1451 = precise::max(_1441, -1.0);
        float _1453 = precise::max(_1445, -1.0);
        float _1455 = precise::max(_1447, -1.0);
        float _1457 = precise::max(_1449, -1.0);
        float _1459 = _1457;
        _1389 = _1451;
        if (_1407)
        {
            _1459 = _1451;
        }
        float _1461 = _1459;
        float _1463 = _1461;
        if (_1409)
        {
            _1463 = _1453;
        }
        float _1465 = _1463;
        float _1467 = _1465;
        if (_1411)
        {
            _1467 = _1455;
        }
        float _1469 = _1467;
        float _1471 = abs(_1469);
        float _1473 = (-0.0) + _1471;
        _1393 = _1473;
    }
    float _1475 = _1389;
    float _1477 = _1393;
    float _1479 = _1475;
    if (!_1383)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_260)
    {
        int _1481 = _276 << 4;
        int _1483 = _1481 + 2048;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        uint _1487 = uint(int(uint(int(_1485)) >> uint(2)));
        int _1489 = int(_1485) & 3;
        float _1491 = (*spvDescriptorSet0.vp_c15)._m0[int(_1487)][_1489];
        int _1493 = int(_1485) + 1;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        int _1497 = _1493 & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        int _1501 = _1483 + 8;
        uint _1503 = uint(int(uint(_1501) >> uint(2)));
        uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
        int _1507 = int(_1503) & 3;
        float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
        int _1511 = int(_1503) + 1;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        int _1515 = _1511 & 3;
        float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
        float _1519 = _206 * _1499;
        float _1521 = fma(_210, _1491, _1519);
        float _1523 = fma(_216, _1509, _1521);
        float _1525 = _1523 + _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        float _1529 = -_1527;
        float _1531 = _1529 + _363;
        float _1533 = fma(_1531, 500.0, 1.5);
        float _1535 = exp2(_1533);
        float _1537 = 0.0 + _1535;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        bool _1541 = _1539 >= 1.0;
        bool _1543 = isnan(_1539);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan(1.0);
        bool _1549 = _1545 || _1547;
        _1479 = _1509;
        _270 = _1519;
        if (!_1549)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1549)
        {
            _1401 = 0.0;
        }
    }
    float _1551 = _1401;
    float _1553 = _1479;
    float _1555 = _270;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1203 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1205 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = _1207 + _1565;
    float _1569 = float(uint(_519));
    float _1571 = _1559 * _1559;
    float _1573 = trunc(_607);
    int _1575 = int(_1573);
    float _1577 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = fma(_1563, _1563, _1571);
    float _1581 = fma(_1567, _1567, _1579);
    float _1583 = 1.0 / _1569;
    float _1585 = rsqrt(_1581);
    float _1587 = sqrt(_1581);
    int _1589 = as_type<int>(_1583) + (-2);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1593 = 1.0 / _1551;
    float _1595 = _1563 * _1591;
    float _1597 = _1567 * _1591;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1553;
    float _1615 = _1603;
    float _1617 = _1611;
    float _1619 = _1555;
    float _1621 = _1559;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1625;
    float _1643 = _1639;
    if (_1607)
    {
        float _1645 = _1639 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1641 = _1647;
    }
    float _1649 = _1641;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _210;
    float _1657 = _1653;
    if (_1607)
    {
        float _1659 = _1639 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1591;
    float _1667 = -_1653;
    float _1669 = fma(_1559, _1665, _1667);
    if (_1607)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1649;
    float _1677 = _1673;
    if (_1607)
    {
        float _1679 = fma(_1649, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1675 = _1679;
    }
    float _1681 = _1675;
    float _1683 = _1681;
    float _1685 = _1663;
    if (_1607)
    {
        float _1687 = _1663 + (-1.0);
        _1677 = _1687;
    }
    float _1689 = _1677;
    float _1691 = _1689;
    if (_1607)
    {
        float _1693 = _1629 * _1681;
        _1621 = _1693;
    }
    float _1695 = _1621;
    if (!_1607)
    {
        _1631 = _1595;
    }
    float _1697 = _1631;
    float _1699 = _1697;
    if (_1607)
    {
        float _1701 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1701;
    }
    float _1703 = _1643;
    float _1705 = _1703;
    if (_1607)
    {
        float _1707 = _1595 * _1695;
        _1699 = _1707;
    }
    float _1709 = _1699;
    if (!_1607)
    {
        _1683 = _1669;
    }
    float _1711 = _1683;
    float _1713 = _1711;
    if (_1607)
    {
        float _1715 = fma(_1669, _1663, _1703);
        _1713 = _1715;
    }
    float _1717 = _1713;
    if (!_1607)
    {
        _1691 = _1597;
    }
    float _1719 = _1691;
    float _1721 = _1719;
    if (_1607)
    {
        float _1723 = _1597 * _1695;
        _1721 = _1723;
    }
    float _1725 = _1721;
    if (!_1607)
    {
        _1685 = _1599;
    }
    float _1727 = _1685;
    float _1729 = _1727;
    if (_1607)
    {
        float _1731 = _1709 * _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    if (!_1607)
    {
        _1705 = _1601;
    }
    float _1735 = _1705;
    float _1737 = _1735;
    if (_1607)
    {
        float _1739 = _1725 * _1725;
        _1737 = _1739;
    }
    float _1741 = _1737;
    float _1743 = float(uint(_1575));
    float _1745 = fma(_1717, _1717, _1733);
    bool _1747 = _1477 != 0.0;
    bool _1749 = isnan(_1477);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1745 + _1741;
    float _1759 = as_type<float>(_1589) * _1743;
    int _1761 = ~_519;
    int _1763 = _1761 + 1;
    float _1765 = rsqrt(_1757);
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1769 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1767);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    if (!_1755)
    {
        _1299 = 0.0;
        _1301 = 0.0;
    }
    float _1773 = _1299;
    float _1775 = _1301;
    float _1777 = -_1771;
    float _1779 = _1777 + 1.0;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1783 = trunc(_1759);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = _1593 * _1773;
    float _1791 = -_1577;
    float _1793 = fma(_1791, _1781, 1.0);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1765 * _1709;
    float _1801 = _1765 * _1717;
    float _1803 = _1765 * _1725;
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1807 = log2(_1793);
    float _1809 = -_1805;
    float _1811 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1811);
    int _1817 = _1763 * int(_1787);
    int _1819 = _1817 + _1575;
    float _1821 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1815, 0.5, 0.5);
    float _1827 = float(uint(_1819));
    float _1829 = _1801 + 1.0;
    float _1831 = _1593 * _1775;
    float _1833 = exp2(_1821);
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = _1807 * 0.693147182464599609375;
    float _1839 = as_type<float>(_1589) * _1827;
    float _1841 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1843 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1845 = sqrt(_1823);
    float _1847 = fma(_1825, _1841, 1.570728778839111328125);
    float _1849 = fma(_1831, 0.5, 0.5);
    float _1851 = -_1801;
    float _1853 = fma(_1833, _1829, _1851);
    float _1855 = trunc(_1839);
    float _1857 = precise::max(_1855, 0.0);
    uint _1859 = uint(_1857);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = _1845 * 0.636619746685028076171875;
    float _1865 = fma(_1789, -0.5, 0.5);
    float _1867 = -_1847;
    float _1869 = fma(_1863, _1867, 1.0);
    float3 _5166 = float3(_1849, _1865, _1843);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5166, float3(0.0), isnan(_5166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5166, float3(0.0), isnan(_5166)), level(0.0)).x;
    float3 _5175 = float3(_1849, _1865, _1843);
    float4 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5175, float3(0.0), isnan(_5175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5175, float3(0.0), isnan(_5175)), level(0.0)).xyzw;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float _1882 = _1874.w;
    bool _1884 = !_1081;
    float _1886 = _1884 ? 7.345489978790283203125 : 1.0;
    float2 _5196 = float2(_1869, _1861);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    int _1898 = ~_519;
    int _1900 = _1898 + 1;
    float _1902 = _1886 * _369;
    int _1904 = int(_1787) + int(_1859);
    float _1906 = _605 * _367;
    float _1908 = float(_1575);
    float _1910 = floor(_1902);
    int _1912 = _519 + (-1);
    int _1914 = _1900 * _1904;
    int _1916 = _1914 + _1575;
    bool _1918 = _1908 >= _593;
    bool _1920 = isnan(_1908);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan(_593);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1932 = abs(_471);
    float _1934 = -_609;
    float _1936 = _1934 + 1.0;
    bool _1938 = uint(_1916) >= uint(_519);
    float _1940 = trunc(_1906);
    int _1942 = int(_1940);
    int _1944 = abs(_479);
    out.m_54.x = 1.0;
    bool _1946 = !_1938;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = _519 == 0;
    int _1952 = ~_1904;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    float _1958 = trunc(_1928);
    int _1960 = int(_1958);
    float _1962 = -_1910;
    float _1964 = _1902 + _1962;
    bool _1966 = _371 > 0.5;
    bool _1968 = _369 > 0.5;
    float _1970 = _1964 * _593;
    int _1972 = _519 * _1956;
    int _1974 = _1972 + _1575;
    float _1976 = trunc(_1970);
    int _1978 = int(_1976);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1982 = _1980 != 0;
    bool _1984 = !_1950;
    int _1986 = _1984 ? _1974 : (-1);
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1990 = !_1982;
    int _1992 = _1990 ? 0 : 1;
    int _1994 = ~_1960;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1930);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1986 * _1998;
    int _2014 = abs(_1992);
    int _2016 = abs(_475);
    int _2018 = _1960 * _1912;
    int _2020 = _2018 + _2012;
    int _2022 = _1978 * _2014;
    int _2024 = _2022 + _1575;
    bool _2026 = !_2004;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = _2020 * _1932;
    int _2032 = abs(_2028);
    int _2034 = _1942 * _2016;
    int _2036 = _2034 + _2030;
    int _2038 = ~_519;
    int _2040 = _2038 + 1;
    int _2042 = _2024 * _1944;
    int _2044 = _2042 + _2036;
    float _2046 = float(uint(_2024));
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2050 = _2048 != 0;
    int _2052 = _1978 * _2032;
    int _2054 = _2052 + _2044;
    float _2056 = as_type<float>(_1589) * _2046;
    float _2058 = float(uint(_2054));
    float _2060 = trunc(_2056);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    float _2066 = as_type<float>(_1589) * _2058;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2040 * int(_2072);
    int _2076 = _2074 + _2054;
    float _2078 = float(uint(_2076));
    int _2080 = ~_519;
    int _2082 = _2080 + 1;
    float _2084 = as_type<float>(_1589) * _2078;
    float _2086 = trunc(_2084);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    int _2092 = int(_2072) + int(_2090);
    int _2094 = _2082 * _2092;
    int _2096 = _2094 + _2054;
    bool _2098 = uint(_2096) >= uint(_519);
    bool _2100 = !_2098;
    int _2102 = _2100 ? 0 : (-1);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2092;
    int _2110 = _2108 + _2102;
    int _2112 = _2110 + 1;
    int _2114 = ~_519;
    int _2116 = _2114 + 1;
    float _2118 = -_789;
    int _2120 = _1966 ? as_type<int>(_2118) : as_type<int>(_789);
    int _2122 = _519 * _2112;
    int _2124 = _2122 + _2054;
    int _2126 = _2116 * int(_2064);
    int _2128 = _2126 + _2024;
    bool _2130 = !_2050;
    float _2132 = _2130 ? _789 : as_type<float>(_2120);
    bool _2134 = !_1950;
    int _2136 = _2134 ? _2124 : (-1);
    float _2138 = float(uint(_2128));
    int _2140 = _2136 >> 31;
    float _2142 = as_type<float>(_1589) * _2138;
    int _2144 = _2140 & 3;
    float _2146 = trunc(_2142);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = _2136 + _2144;
    int _2154 = _2152 >> 2;
    int _2156 = _2136 & 3;
    bool _2158 = _2156 != 0;
    int _2160 = _2154 << 4;
    int _2162 = _2160 + 368;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2170 = uint(int(uint(_2162) >> uint(2)));
    uint _2172 = uint(int(uint(int(_2170)) >> uint(2)));
    int _2174 = int(_2170) & 3;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[int(_2172)][_2174];
    int _2178 = int(_2170) + 1;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    int _2182 = _2178 & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    float _2186 = -_779;
    int _2188 = _1968 ? as_type<int>(_2186) : as_type<int>(_779);
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2192 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2194 = int(_2064) + int(_2150);
    bool _2196 = !_2010;
    float _2198 = _2196 ? _779 : as_type<float>(_2188);
    int _2200 = _2162 + 8;
    uint _2202 = uint(int(uint(_2200) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2136 & 3;
    bool _2220 = _2218 != 0;
    out.m_75.x = _2000;
    out.m_75.y = _2190;
    out.m_75.z = _2192;
    out.m_75.w = _2168;
    float _2222 = _2198 + 0.5;
    float _2224 = _2132 + (-0.5);
    bool _2226 = uint(_2218) > 1u;
    bool _2228 = uint(_2218) >= 2u;
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[80].x, _429);
    int _2232 = ~_519;
    int _2234 = _2232 + 1;
    float _2236 = -_2224;
    float _2238 = -_447;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2238);
    int _2242 = _2234 * _2194;
    int _2244 = _2242 + _2024;
    int _2246 = _2158 ? 0 : 1;
    bool _2248 = _2218 != 3;
    int _2250 = ~_2246;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2254;
    if (!_2226)
    {
        int _2258 = ~_2246;
        int _2260 = _2258 + 1;
        _2256 = _2260;
    }
    int _2262 = _2256;
    bool _2264 = !_2220;
    int _2266 = _2264 ? 0 : 1;
    int _2268 = abs(_2262);
    int _2270 = _2228 ? 0 : 1;
    bool _2272 = _2218 != 3;
    int _2274 = abs(_2266);
    int _2276 = ~_2270;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    bool _2282 = !_2272;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2280;
    if (_2248)
    {
        int _2288 = ~_2270;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    int _2294 = ~_2268;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = uint(_2244) >= uint(_519);
    int _2302 = abs(_2284);
    int _2304 = _2298 * as_type<int>(_2184);
    int _2306 = abs(_2292);
    int _2308 = ~_2274;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    bool _2314 = !_2106;
    int _2316 = _2314 ? 0 : 1;
    bool _2318 = !_2300;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = _2312 * as_type<int>(_2176);
    int _2324 = _2322 + _2304;
    int _2326 = ~_2306;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = abs(_2316);
    int _2334 = ~_2194;
    int _2336 = _2334 + _2320;
    int _2338 = _2336 + 1;
    int _2340 = _2330 * as_type<int>(_2208);
    int _2342 = _2340 + _2324;
    int _2344 = ~_2302;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = _1289 + _1281;
    int _2352 = _519 * _2338;
    int _2354 = _2352 + _2024;
    float _2356 = -_601;
    float _2358 = _2356 + 1.0;
    int _2360 = _2348 * as_type<int>(_2216);
    int _2362 = _2360 + _2342;
    int _2364 = ~_2332;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2132, _1936, _2240);
    bool _2372 = !_1950;
    int _2374 = _2372 ? _2354 : (-1);
    float _2376 = -_2358;
    float _2378 = fma(_2198, _2376, _2230);
    float _2380 = as_type<float>(_2354);
    if (!_1755)
    {
        _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2380;
    int _2384 = _2362 * _2368;
    int _2386 = _2374 * _2332;
    int _2388 = _2386 + _2384;
    float _2390 = _2350 * 0.5;
    float _2392 = -_2006;
    float _2394 = _2392 + 1.0;
    int _2396 = as_type<int>(_2382);
    if (!_1755)
    {
        float _2398 = _2382 * 5.0;
        _2396 = as_type<int>(_2398);
    }
    int _2400 = _2396;
    float _2402 = float(_2388);
    float _2404 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2406 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1755)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_2400);
        out.gl_Position.z = _5931;
    }
    float _2408 = _2404 * _1477;
    float _2410 = _2408;
    if (!_1755)
    {
        _2410 = 0.0;
    }
    float _2412 = _2410;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_77.x = _2402;
    bool _2416 = _1371 > 0.0;
    bool _2418 = isnan(_1371);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(0.0);
    bool _2424 = _2420 || _2422;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2378;
    out.m_79.y = _2370;
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2438 = -_2406;
    float _2440 = _2438 + 1.0;
    out.m_81.z = _2390;
    out.m_81.w = _1281;
    float _2442 = _2406 * _1871;
    out.m_83.x = _2430;
    out.m_83.y = _2432;
    out.m_83.z = _2434;
    float _2444 = _1882 * _2442;
    float _2446 = _1896 * _2442;
    out.m_85.w = _2436;
    float _2448 = fma(_1892, _2444, _1876);
    float _2450 = fma(_1894, _2444, _1878);
    float _2452 = _1882 * _2440;
    float _2454 = fma(_1882, _2446, _1880);
    out.m_87.x = _2448;
    out.m_87.y = _2450;
    out.m_87.z = _2454;
    out.m_87.w = _2452;
    if (_2424)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_54.x = 0.0;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2456;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_51.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_54.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_120);
        out.gl_Position.z = _2511;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_56.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_54.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_156);
        out.gl_Position.z = _2576;
    }
    if (_146)
    {
        return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = in.m_58.x;
    float _166 = in.m_58.y;
    float _168 = in.m_58.z;
    float _170 = in.m_58.w;
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_60.w;
    float _180 = in.m_62.x;
    float _182 = in.m_62.y;
    float _184 = in.m_62.z;
    float _186 = in.m_62.w;
    float _188 = _160 * _166;
    float _190 = fma(_158, _164, _188);
    float _192 = _160 * _174;
    float _194 = fma(_162, _168, _190);
    float _196 = _160 * _182;
    float _198 = fma(_158, _172, _192);
    float _200 = _194 + _170;
    float _202 = fma(_158, _180, _196);
    float _204 = fma(_162, _176, _198);
    float _206 = _200 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _208 = fma(_162, _184, _202);
    float _210 = _204 + _178;
    float _212 = _206 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _216 = _208 + _186;
    float _218 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _212);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _214);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].z, _218);
    float _224 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _230 = trunc(_226);
    int _232 = int(_230);
    float _234 = trunc(_228);
    int _236 = int(_234);
    int _238 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _240 = _232 + _238;
    int _242 = _240 + 1;
    bool _244 = _242 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _246 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _248 = _236 + _246;
    int _250 = _248 + 1;
    int _252 = _242 | _250;
    bool _254 = _252 < 0;
    bool _256 = _254 || _244;
    bool _258 = _250 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _260 = _258 || _256;
    int _262 = _250;
    int _264 = as_type<int>(_168);
    int _266 = _242;
    float _268 = _208;
    float _270 = _206;
    if (!_260)
    {
        int _272 = _250 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _274 = _272 + _242;
        _262 = _274;
    }
    int _276 = _262;
    float _278 = as_type<float>(_252);
    if (!_260)
    {
        float _280 = floor(_228);
        _278 = _280;
    }
    float _282 = _278;
    if (!_260)
    {
        int _284 = _276 << 2;
        _264 = _284;
    }
    int _286 = _264;
    int _288 = _286;
    if (!_260)
    {
        uint _291 = uint(int(uint(_276) >> uint(2)));
        _266 = int(_291);
    }
    int _293 = _266;
    if (!_260)
    {
        int _295 = 12 & _286;
        _288 = _295;
    }
    int _297 = _288;
    float _299 = 0.0;
    if (!_260)
    {
        int _301 = _293 << 4;
        int _303 = _301 + _297;
        _299 = as_type<float>(_303);
    }
    float _305 = _299;
    float _307 = as_type<float>(_293);
    if (!_260)
    {
        float _309 = floor(_226);
        _307 = _309;
    }
    float _311 = _307;
    if (!_260)
    {
        float _313 = -_282;
        float _315 = _228 + _313;
        _268 = _315;
    }
    float _317 = _268;
    float _319 = _305;
    if (!_260)
    {
        int _321 = as_type<int>(_305) + 400;
        uint _323 = uint(int(uint(_321) >> uint(2)));
        uint _325 = uint(int(uint(int(_323)) >> uint(2)));
        int _327 = int(_323) & 3;
        float _329 = (*spvDescriptorSet0.vp_c15)._m0[int(_325)][_327];
        _319 = _329;
    }
    float _331 = _319;
    float _333 = fma(_210, 6.2500002968590706586837768554688e-05, 0.5);
    float _335 = fma(_216, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2871 = float2(_333, _335);
    float _337 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_2871, float2(0.0), isnan(_2871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_2871, float2(0.0), isnan(_2871)), level(0.0)).x;
    float _339 = 0.0;
    if (!_260)
    {
        float _341 = -_311;
        float _343 = _226 + _341;
        _339 = _343;
    }
    float _345 = _339;
    float _347 = 0.0;
    if (!_260)
    {
        float _349 = rint(_331);
        float _351 = precise::max(_349, 0.0);
        uint _353 = uint(_351);
        uint _355 = clamp(_353, 0u, 65535u);
        _347 = as_type<float>(_355);
    }
    float _357 = _347;
    float _359 = _317;
    if (!_260)
    {
        float3 _2916 = float3(_345, _317, float(as_type<int>(_357)));
        float3 _2920 = select(_2916, float3(0.0), isnan(_2916));
        float _361 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _2920.xy, uint(rint(_2920.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _2920.xy, uint(rint(_2920.z)), level(0.0)).x;
        _359 = _361;
    }
    float _363 = _359;
    float _365 = in.m_64.z;
    float _367 = 1.0 / _126;
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = -_216;
    float _375 = _373 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _381 = int(_379);
    float _383 = _130 * 0.25;
    float _385 = _367 * _130;
    float _387 = _365 * 2.0;
    float _389 = _371 + _365;
    float _391 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = floor(_387);
    float _395 = _369 + _365;
    float _397 = _389 + (-1.0);
    float _399 = _371 * 2.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = -_377;
    float _405 = fma(_391, 2.0, _403);
    float _407 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = _395 + (-1.0);
    float _417 = _369 * 2.0;
    float _419 = fma(_409, -2.0, _401);
    float _421 = float(_381);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _425 = _369 + _371;
    float _427 = -_130;
    float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _405);
    bool _431 = _393 > 0.0;
    float _433 = floor(_399);
    bool _435 = _393 >= 0.0;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 + (-1.0);
    float _447 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _459 = _457 != 0;
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = _413 * _130;
    int _465 = _443 ? 0 : 1;
    float _467 = floor(_417);
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    bool _473 = !_451;
    int _475 = _473 ? 0 : 1;
    bool _477 = !_459;
    int _479 = _477 ? 0 : 1;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _491 = _489 != 0;
    float _493 = exp2(_463);
    int _495 = ~_465;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    int _501 = _499;
    float _503 = _375;
    if (!_431)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _501 = _507;
    }
    int _509 = _501;
    bool _511 = !_483;
    int _513 = _511 ? 0 : 1;
    float _515 = float(_509);
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _519 = int(_517);
    int _521 = abs(_513);
    bool _523 = _433 >= 0.0;
    bool _525 = isnan(_433);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = float(_521);
    float _535 = 1.0 / _421;
    int _537 = _531 ? 0 : 1;
    float _539 = _533 * _515;
    float _541 = -_493;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    bool _549 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    bool _559 = _467 > 0.0;
    float _561 = 1.0 / _547;
    bool _563 = _467 >= 0.0;
    bool _565 = isnan(_467);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    float _573 = _557 ? _543 : 0.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _589 = _433 > 0.0;
    float _591 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = float(_519);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _587);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _599 = _210 + _597;
    float _601 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _603 = _539 * (-2.0);
    float _605 = _593 * _130;
    float _607 = _535 * _130;
    float _609 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    float _611 = abs(_599);
    float _613 = abs(_375);
    float _615 = precise::max(_611, _613);
    if (_585)
    {
        float _617 = _573 * _561;
        _150 = _617;
    }
    float _619 = _150;
    int _621 = ~_537;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_461, _603, _461);
    int _629 = _625;
    int _631 = as_type<int>(_619);
    if (!_589)
    {
        int _633 = ~_537;
        int _635 = _633 + 1;
        _629 = _635;
    }
    int _637 = _629;
    float _639 = _369 + (-0.5);
    float _641 = as_type<float>(int(gl_VertexIndex));
    int _643 = _571 ? 0 : 1;
    float _645 = ceil(_383);
    bool _647 = _615 >= 16.0;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _651 = !_487;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_491;
    int _657 = _655 ? 0 : 1;
    float _659 = fma(_627, _619, _649);
    int _661 = ~_643;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    int _667 = _665;
    if (!_559)
    {
        int _669 = ~_643;
        int _671 = _669 + 1;
        _667 = _671;
    }
    int _673 = _667;
    float _675 = _599 * 0.0625;
    int _677 = abs(_653);
    float _679 = _659 * 0.15915493667125701904296875;
    int _681 = abs(_657);
    if (_647)
    {
        float _683 = _375 * 0.0625;
        _503 = _683;
    }
    float _685 = _503;
    float _687 = _647 ? _675 : _599;
    float _689 = _645 * 0.5;
    float _691 = float(_681);
    float _693 = _679 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = float(_637);
    float _699 = _371 + (-0.5);
    float _701 = float(_677);
    float _703 = float(_673);
    float _705 = _691 * _697;
    float _707 = abs(_687);
    bool _709 = _707 != 0.0;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = floor(_689);
    float _721 = _701 * _703;
    float _723 = abs(_685);
    bool _725 = _723 == 0.0;
    bool _727 = !_717;
    bool _729 = _725 && _727;
    float _731 = in.m_69.x;
    float _733 = in.m_69.y;
    float _735 = _705 * (-2.0);
    float _737 = _721 * (-2.0);
    int _739 = as_type<int>(_641) & 1;
    bool _741 = _739 != 0;
    int _743 = as_type<int>(_641) & 2;
    bool _745 = _743 != 0;
    float _747 = fma(_423, _735, _423);
    float _749 = abs(_685);
    bool _751 = _749 == 0.0;
    float _753 = fma(_407, _737, _407);
    float _755 = _365 + (-0.5);
    float _757 = _699 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _759 = _679 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _765 = _487;
    int _767 = as_type<int>(_641);
    int _769 = _729 ? (-1) : 0;
    if (_729)
    {
        bool _771 = as_type<int>(_685) >= 0;
        _765 = _771;
    }
    bool _773 = _765;
    float _775 = fma(_753, _619, _757);
    bool _777 = !_741;
    float _779 = _777 ? (-0.5) : 0.5;
    float _781 = fma(_747, _619, _763);
    if (_729)
    {
        int _783 = _773 ? 0 : 1078530011;
        _767 = _783;
    }
    int _785 = _767;
    bool _787 = !_745;
    float _789 = _787 ? (-0.5) : 0.5;
    if (_729)
    {
        int _791 = int(0x80000000) & as_type<int>(_687);
        int _793 = _785 | _791;
        _631 = _793;
    }
    int _795 = _631;
    bool _797 = !_717;
    bool _799 = _797 && _751;
    int _801 = _795;
    float _803 = as_type<float>(_795);
    if (!_799)
    {
        float _805 = abs(_687);
        bool _807 = _805 != as_type<float>(0x7f800000u /* inf */);
        bool _809 = isnan(_805);
        bool _811 = _807 || _809;
        bool _813 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _815 = _811 || _813;
        float _817 = abs(_685);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        float _821 = abs(_685);
        bool _823 = _821 == as_type<float>(0x7f800000u /* inf */);
        bool _825 = !_815;
        bool _827 = _823 && _825;
        if (_827)
        {
            bool _829 = as_type<int>(_685) >= 0;
            _769 = _829 ? (-1) : 0;
        }
        int _831 = _769;
        if (_827)
        {
            _801 = 1075235812;
        }
        int _833 = _801;
        int _835 = _833;
        if (_827)
        {
            int _837 = ~_831;
            int _839 = (_837 != 0) ? _833 : 1061752795;
            _835 = _839;
        }
        int _841 = _835;
        float _843 = as_type<float>(_841);
        if (_827)
        {
            int _845 = int(0x80000000) & as_type<int>(_687);
            int _847 = _841 | _845;
            _843 = as_type<float>(_847);
        }
        float _849 = _843;
        bool _851 = !_815;
        bool _853 = _851 && _819;
        _803 = _849;
        if (!_853)
        {
            float _855 = abs(_685);
            float _857 = abs(_687);
            float _859 = precise::max(_855, _857);
            float _861 = abs(_685);
            float _863 = abs(_687);
            float _865 = precise::min(_861, _863);
            float _867 = 1.0 / _859;
            float _869 = abs(_687);
            float _871 = abs(_685);
            bool _873 = _869 > _871;
            bool _875 = as_type<int>(_685) >= 0;
            float _877 = abs(_685);
            float _879 = abs(_687);
            float _881 = _877 + _879;
            int _883 = as_type<int>(_687) & int(0x80000000);
            bool _885 = _881 > as_type<float>(0x7f800000u /* inf */);
            bool _887 = isnan(_881);
            bool _889 = _885 || _887;
            bool _891 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _893 = _889 || _891;
            float _895 = _865 * _867;
            float _897 = _895 * _895;
            float _899 = _897 + 11.33538818359375;
            float _901 = fma(_897, _899, 28.84246826171875);
            float _903 = fma(_897, _901, 19.6966705322265625);
            float _905 = fma(_897, -0.82336294651031494140625, -5.674867153167724609375);
            float _907 = fma(_897, _905, -6.565555095672607421875);
            float _909 = 1.0 / _903;
            float _911 = _897 * _907;
            float _913 = _895 * _911;
            float _915 = fma(_913, _909, _895);
            float _917 = _915;
            _803 = _881;
            if (_873)
            {
                float _919 = -_915;
                float _921 = _919 + 1.57079637050628662109375;
                _917 = _921;
            }
            float _923 = _917;
            int _925 = as_type<int>(_923);
            if (!_875)
            {
                float _927 = -_923;
                float _929 = _927 + 3.1415927410125732421875;
                _925 = as_type<int>(_929);
            }
            int _931 = _925;
            if (!_893)
            {
                int _933 = _883 | _931;
                _803 = as_type<float>(_933);
            }
        }
    }
    float _935 = _803;
    float _937 = -_935;
    float _939 = _775 + _937;
    float _941 = fma(_719, -2.0, _645);
    bool _943 = _385 < 0.85000002384185791015625;
    float _945 = float(_943);
    float _947 = _781 * 0.15915493667125701904296875;
    float _949 = _939 * 0.15915493667125701904296875;
    float _951 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = precise::max(_941, _945);
    float _955 = _947 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _733 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = _789 * _953;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _967 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _975 = _971 || _973;
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _963);
    float _983 = _779 * _953;
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _981 * _965;
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _957 * _987;
    float _997 = _989 * _985;
    float _999 = _947 * 6.283185482025146484375;
    float _1001 = sin(_999);
    float _1003 = _761 * _979;
    float _1005 = _695 * _995;
    float _1007 = _695 * _979;
    float _1009 = _695 * _993;
    float _1011 = _761 * _993;
    float _1013 = _993 * _957;
    float _1015 = _979 * _957;
    float _1017 = _761 * _995;
    float _1019 = _200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = -_1003;
    float _1023 = fma(_1001, _1009, _1021);
    float _1025 = -_987;
    float _1027 = _1001 * _1025;
    float _1029 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1031 = fma(_1023, _997, _1005);
    float _1033 = fma(_1001, _1007, _1011);
    float _1035 = fma(_1013, _997, _1027);
    float _1037 = fma(_1001, _1011, _1007);
    float _1039 = -_1009;
    float _1041 = fma(_1001, _1003, _1039);
    float _1043 = fma(_1033, _961, _1031);
    float _1045 = fma(_1015, _961, _1035);
    float _1047 = fma(_1037, _997, _1017);
    float _1049 = _200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1051 = _216 + _1043;
    float _1053 = _210 + _1045;
    float _1055 = fma(_1041, _961, _1047);
    float _1057 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1049);
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1061 = _1051 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1053 + _1063;
    float _1067 = _200 + _1055;
    float _1069 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    float _1071 = _1061 * _1061;
    float _1073 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1029);
    float _1075 = fma(_1065, _1065, _1071);
    float _1077 = sqrt(_1075);
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1081 = _1079 != 0;
    bool _1083 = _1077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1087 = _1029;
    float _1089 = _1057;
    if (!_1083)
    {
        _1085 = _1053;
    }
    float _1091 = _1085;
    float _1093 = _1091;
    if (!_1083)
    {
        _1087 = _1051;
    }
    float _1095 = _1087;
    float _1097 = _1095;
    if (!_1083)
    {
        _1089 = _1067;
    }
    float _1099 = _1089;
    bool _1101 = !_1083;
    float _1103 = _1099;
    if (!_1101)
    {
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1109 = _1077 + _1107;
        float _1111 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = rsqrt(_1075);
        float _1115 = _1109 * _1105;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = _1117 * 6.283185482025146484375;
        float _1121 = cos(_1119);
        float _1123 = _1117 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1121 + (-1.0);
        float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = fma(_1125, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1133 = fma(_1067, _1121, _1129);
        float _1135 = _1113 * _1131;
        float _1137 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1139 = fma(_1061, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1139;
        _1103 = _1133;
        _1093 = _1137;
    }
    float _1141 = _1097;
    float _1143 = _1103;
    float _1145 = _1093;
    float _1147 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1149 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1151 = _1143;
    float _1153 = _1145;
    float _1155 = _1141;
    if (!_975)
    {
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1159 = _200 + _1157;
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = -_216;
        float _1165 = _1163 + _1141;
        float _1167 = _1159 * _1159;
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1171 = _216 + _1169;
        float _1173 = fma(_599, _599, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1171, _1171, _1173);
        float _1179 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = sqrt(_1177);
        float _1183 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_200;
        float _1189 = _1187 + _1143;
        float _1191 = _1179 * _1185;
        float _1193 = -_210;
        float _1195 = _1193 + _1145;
        float _1197 = fma(_1189, _1191, _200);
        float _1199 = fma(_1195, _1191, _210);
        float _1201 = fma(_1165, _1191, _216);
        _1151 = _1197;
        _1153 = _1199;
        _1155 = _1201;
    }
    float _1203 = _1151;
    float _1205 = _1153;
    float _1207 = _1155;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = 1.0 / _1149;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1211);
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1219);
    bool _1229 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1231 = isnan(0.5);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1237 = _1233 || _1235;
    float _1239 = _1147 + _1149;
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1245 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1247 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1243);
    float _1259 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1265 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1267 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1271);
    float _1281 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1285 = _1239 * _1215;
    float _1287 = _1285 * 0.5;
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1291 = _1273;
    float _1293 = _1269;
    float _1295 = _1277;
    float _1297 = _1287;
    float _1299 = _1279;
    float _1301 = _1283;
    if (_1237)
    {
        _1291 = 1.0;
    }
    float _1303 = _1291;
    float _1305 = _1303;
    if (!_1237)
    {
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1315 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1313);
        float _1317 = _1309 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1311 * 0.15915493667125701904296875;
        float _1323 = _1309 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = 1.0 / _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1329;
        float _1333 = _1321 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1325 * _1327;
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1335 * _1337;
        float _1345 = 1.0 / _1315;
        float _1347 = 1.0 / _1343;
        float _1349 = 1.0 / _1331;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1353 = _1345 * _1351;
        float _1355 = _1341 * _1347;
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = fma(_1355, _1353, _1357);
        float _1361 = _1359 * _1349;
        float _1363 = precise::clamp(_1361, 0.0, 1.0);
        _1293 = _1353;
        _1295 = _1359;
        _1297 = _1345;
        _1305 = _1363;
    }
    float _1365 = _1293;
    float _1367 = _1295;
    float _1369 = _1297;
    float _1371 = _1305;
    out.gl_Position.x = _1283;
    out.gl_Position.y = _1279;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1281;
    float _1373 = abs(_337);
    bool _1375 = _1373 != 0.0;
    bool _1377 = isnan(_1373);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = _1365;
    float _1387 = _1369;
    float _1389 = _1367;
    if (_1237)
    {
        _1385 = 1.0;
    }
    float _1391 = _1385;
    float _1393 = _1391;
    if (_1383)
    {
        _1387 = _1281;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1383)
    {
        _1397 = 0.0;
    }
    float _1399 = _1397;
    float _1401 = _1399;
    if (!_1237)
    {
        float _1403 = as_type<float>(in.m_73.w);
        int _1405 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1407 = _1405 == 4;
        bool _1409 = _1405 == 8;
        bool _1411 = _1405 == 12;
        int _1413 = as_type<int>(_1403) << 16;
        int _1415 = as_type<int>(_1403) << 8;
        int _1417 = as_type<int>(_1403) << 24;
        int _1419 = _1413 >> 24;
        int _1421 = _1415 >> 24;
        int _1423 = as_type<int>(_1403) >> 24;
        int _1425 = _1417 >> 24;
        float _1427 = float(_1419);
        float _1429 = float(_1421);
        float _1431 = float(_1423);
        float _1433 = _1427 * 0.0078740157186985015869140625;
        float _1435 = float(_1425);
        float _1437 = _1429 * 0.0078740157186985015869140625;
        float _1439 = _1431 * 0.0078740157186985015869140625;
        float _1441 = precise::min(_1433, 1.0);
        float _1443 = _1435 * 0.0078740157186985015869140625;
        float _1445 = precise::min(_1437, 1.0);
        float _1447 = precise::min(_1439, 1.0);
        float _1449 = precise::min(_1443, 1.0);
        float _1451 = precise::max(_1441, -1.0);
        float _1453 = precise::max(_1445, -1.0);
        float _1455 = precise::max(_1447, -1.0);
        float _1457 = precise::max(_1449, -1.0);
        float _1459 = _1457;
        _1389 = _1451;
        if (_1407)
        {
            _1459 = _1451;
        }
        float _1461 = _1459;
        float _1463 = _1461;
        if (_1409)
        {
            _1463 = _1453;
        }
        float _1465 = _1463;
        float _1467 = _1465;
        if (_1411)
        {
            _1467 = _1455;
        }
        float _1469 = _1467;
        float _1471 = abs(_1469);
        float _1473 = (-0.0) + _1471;
        _1393 = _1473;
    }
    float _1475 = _1389;
    float _1477 = _1393;
    float _1479 = _1475;
    if (!_1383)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_260)
    {
        int _1481 = _276 << 4;
        int _1483 = _1481 + 2048;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        uint _1487 = uint(int(uint(int(_1485)) >> uint(2)));
        int _1489 = int(_1485) & 3;
        float _1491 = (*spvDescriptorSet0.vp_c15)._m0[int(_1487)][_1489];
        int _1493 = int(_1485) + 1;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        int _1497 = _1493 & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        int _1501 = _1483 + 8;
        uint _1503 = uint(int(uint(_1501) >> uint(2)));
        uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
        int _1507 = int(_1503) & 3;
        float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
        int _1511 = int(_1503) + 1;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        int _1515 = _1511 & 3;
        float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
        float _1519 = _206 * _1499;
        float _1521 = fma(_210, _1491, _1519);
        float _1523 = fma(_216, _1509, _1521);
        float _1525 = _1523 + _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        float _1529 = -_1527;
        float _1531 = _1529 + _363;
        float _1533 = fma(_1531, 500.0, 1.5);
        float _1535 = exp2(_1533);
        float _1537 = 0.0 + _1535;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        bool _1541 = _1539 >= 1.0;
        bool _1543 = isnan(_1539);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan(1.0);
        bool _1549 = _1545 || _1547;
        _1479 = _1509;
        _270 = _1519;
        if (!_1549)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1549)
        {
            _1401 = 0.0;
        }
    }
    float _1551 = _1401;
    float _1553 = _1479;
    float _1555 = _270;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1203 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1205 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = _1207 + _1565;
    float _1569 = float(uint(_519));
    float _1571 = _1559 * _1559;
    float _1573 = trunc(_607);
    int _1575 = int(_1573);
    float _1577 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = fma(_1563, _1563, _1571);
    float _1581 = fma(_1567, _1567, _1579);
    float _1583 = 1.0 / _1569;
    float _1585 = rsqrt(_1581);
    float _1587 = sqrt(_1581);
    int _1589 = as_type<int>(_1583) + (-2);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1593 = 1.0 / _1551;
    float _1595 = _1563 * _1591;
    float _1597 = _1567 * _1591;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1553;
    float _1615 = _1603;
    float _1617 = _1611;
    float _1619 = _1555;
    float _1621 = _1559;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1625;
    float _1643 = _1639;
    if (_1607)
    {
        float _1645 = _1639 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1641 = _1647;
    }
    float _1649 = _1641;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _210;
    float _1657 = _1653;
    if (_1607)
    {
        float _1659 = _1639 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1591;
    float _1667 = -_1653;
    float _1669 = fma(_1559, _1665, _1667);
    if (_1607)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1649;
    float _1677 = _1673;
    if (_1607)
    {
        float _1679 = fma(_1649, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1675 = _1679;
    }
    float _1681 = _1675;
    float _1683 = _1681;
    float _1685 = _1663;
    if (_1607)
    {
        float _1687 = _1663 + (-1.0);
        _1677 = _1687;
    }
    float _1689 = _1677;
    float _1691 = _1689;
    if (_1607)
    {
        float _1693 = _1629 * _1681;
        _1621 = _1693;
    }
    float _1695 = _1621;
    if (!_1607)
    {
        _1631 = _1595;
    }
    float _1697 = _1631;
    float _1699 = _1697;
    if (_1607)
    {
        float _1701 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1701;
    }
    float _1703 = _1643;
    float _1705 = _1703;
    if (_1607)
    {
        float _1707 = _1595 * _1695;
        _1699 = _1707;
    }
    float _1709 = _1699;
    if (!_1607)
    {
        _1683 = _1669;
    }
    float _1711 = _1683;
    float _1713 = _1711;
    if (_1607)
    {
        float _1715 = fma(_1669, _1663, _1703);
        _1713 = _1715;
    }
    float _1717 = _1713;
    if (!_1607)
    {
        _1691 = _1597;
    }
    float _1719 = _1691;
    float _1721 = _1719;
    if (_1607)
    {
        float _1723 = _1597 * _1695;
        _1721 = _1723;
    }
    float _1725 = _1721;
    if (!_1607)
    {
        _1685 = _1599;
    }
    float _1727 = _1685;
    float _1729 = _1727;
    if (_1607)
    {
        float _1731 = _1709 * _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    if (!_1607)
    {
        _1705 = _1601;
    }
    float _1735 = _1705;
    float _1737 = _1735;
    if (_1607)
    {
        float _1739 = _1725 * _1725;
        _1737 = _1739;
    }
    float _1741 = _1737;
    float _1743 = float(uint(_1575));
    float _1745 = fma(_1717, _1717, _1733);
    bool _1747 = _1477 != 0.0;
    bool _1749 = isnan(_1477);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1745 + _1741;
    float _1759 = as_type<float>(_1589) * _1743;
    int _1761 = ~_519;
    int _1763 = _1761 + 1;
    float _1765 = rsqrt(_1757);
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1769 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1767);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    if (!_1755)
    {
        _1299 = 0.0;
        _1301 = 0.0;
    }
    float _1773 = _1299;
    float _1775 = _1301;
    float _1777 = -_1771;
    float _1779 = _1777 + 1.0;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1783 = trunc(_1759);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = _1593 * _1773;
    float _1791 = -_1577;
    float _1793 = fma(_1791, _1781, 1.0);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1765 * _1709;
    float _1801 = _1765 * _1717;
    float _1803 = _1765 * _1725;
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1807 = log2(_1793);
    float _1809 = -_1805;
    float _1811 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1811);
    int _1817 = _1763 * int(_1787);
    int _1819 = _1817 + _1575;
    float _1821 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1815, 0.5, 0.5);
    float _1827 = float(uint(_1819));
    float _1829 = _1801 + 1.0;
    float _1831 = _1593 * _1775;
    float _1833 = exp2(_1821);
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = _1807 * 0.693147182464599609375;
    float _1839 = as_type<float>(_1589) * _1827;
    float _1841 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1843 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1845 = sqrt(_1823);
    float _1847 = fma(_1825, _1841, 1.570728778839111328125);
    float _1849 = fma(_1831, 0.5, 0.5);
    float _1851 = -_1801;
    float _1853 = fma(_1833, _1829, _1851);
    float _1855 = trunc(_1839);
    float _1857 = precise::max(_1855, 0.0);
    uint _1859 = uint(_1857);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = _1845 * 0.636619746685028076171875;
    float _1865 = fma(_1789, -0.5, 0.5);
    float _1867 = -_1847;
    float _1869 = fma(_1863, _1867, 1.0);
    float3 _5166 = float3(_1849, _1865, _1843);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5166, float3(0.0), isnan(_5166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5166, float3(0.0), isnan(_5166)), level(0.0)).x;
    float3 _5175 = float3(_1849, _1865, _1843);
    float4 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5175, float3(0.0), isnan(_5175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5175, float3(0.0), isnan(_5175)), level(0.0)).xyzw;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float _1882 = _1874.w;
    bool _1884 = !_1081;
    float _1886 = _1884 ? 7.345489978790283203125 : 1.0;
    float2 _5196 = float2(_1869, _1861);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    int _1898 = ~_519;
    int _1900 = _1898 + 1;
    float _1902 = _1886 * _369;
    int _1904 = int(_1787) + int(_1859);
    float _1906 = _605 * _367;
    float _1908 = float(_1575);
    float _1910 = floor(_1902);
    int _1912 = _519 + (-1);
    int _1914 = _1900 * _1904;
    int _1916 = _1914 + _1575;
    bool _1918 = _1908 >= _593;
    bool _1920 = isnan(_1908);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan(_593);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1932 = abs(_471);
    float _1934 = -_609;
    float _1936 = _1934 + 1.0;
    bool _1938 = uint(_1916) >= uint(_519);
    float _1940 = trunc(_1906);
    int _1942 = int(_1940);
    int _1944 = abs(_479);
    out.m_54.x = 1.0;
    bool _1946 = !_1938;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = _519 == 0;
    int _1952 = ~_1904;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    float _1958 = trunc(_1928);
    int _1960 = int(_1958);
    float _1962 = -_1910;
    float _1964 = _1902 + _1962;
    bool _1966 = _371 > 0.5;
    bool _1968 = _369 > 0.5;
    float _1970 = _1964 * _593;
    int _1972 = _519 * _1956;
    int _1974 = _1972 + _1575;
    float _1976 = trunc(_1970);
    int _1978 = int(_1976);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1982 = _1980 != 0;
    bool _1984 = !_1950;
    int _1986 = _1984 ? _1974 : (-1);
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1990 = !_1982;
    int _1992 = _1990 ? 0 : 1;
    int _1994 = ~_1960;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1930);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1986 * _1998;
    int _2014 = abs(_1992);
    int _2016 = abs(_475);
    int _2018 = _1960 * _1912;
    int _2020 = _2018 + _2012;
    int _2022 = _1978 * _2014;
    int _2024 = _2022 + _1575;
    bool _2026 = !_2004;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = _2020 * _1932;
    int _2032 = abs(_2028);
    int _2034 = _1942 * _2016;
    int _2036 = _2034 + _2030;
    int _2038 = ~_519;
    int _2040 = _2038 + 1;
    int _2042 = _2024 * _1944;
    int _2044 = _2042 + _2036;
    float _2046 = float(uint(_2024));
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2050 = _2048 != 0;
    int _2052 = _1978 * _2032;
    int _2054 = _2052 + _2044;
    float _2056 = as_type<float>(_1589) * _2046;
    float _2058 = float(uint(_2054));
    float _2060 = trunc(_2056);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    float _2066 = as_type<float>(_1589) * _2058;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2040 * int(_2072);
    int _2076 = _2074 + _2054;
    float _2078 = float(uint(_2076));
    int _2080 = ~_519;
    int _2082 = _2080 + 1;
    float _2084 = as_type<float>(_1589) * _2078;
    float _2086 = trunc(_2084);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    int _2092 = int(_2072) + int(_2090);
    int _2094 = _2082 * _2092;
    int _2096 = _2094 + _2054;
    bool _2098 = uint(_2096) >= uint(_519);
    bool _2100 = !_2098;
    int _2102 = _2100 ? 0 : (-1);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2092;
    int _2110 = _2108 + _2102;
    int _2112 = _2110 + 1;
    int _2114 = ~_519;
    int _2116 = _2114 + 1;
    float _2118 = -_789;
    int _2120 = _1966 ? as_type<int>(_2118) : as_type<int>(_789);
    int _2122 = _519 * _2112;
    int _2124 = _2122 + _2054;
    int _2126 = _2116 * int(_2064);
    int _2128 = _2126 + _2024;
    bool _2130 = !_2050;
    float _2132 = _2130 ? _789 : as_type<float>(_2120);
    bool _2134 = !_1950;
    int _2136 = _2134 ? _2124 : (-1);
    float _2138 = float(uint(_2128));
    int _2140 = _2136 >> 31;
    float _2142 = as_type<float>(_1589) * _2138;
    int _2144 = _2140 & 3;
    float _2146 = trunc(_2142);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = _2136 + _2144;
    int _2154 = _2152 >> 2;
    int _2156 = _2136 & 3;
    bool _2158 = _2156 != 0;
    int _2160 = _2154 << 4;
    int _2162 = _2160 + 368;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2170 = uint(int(uint(_2162) >> uint(2)));
    uint _2172 = uint(int(uint(int(_2170)) >> uint(2)));
    int _2174 = int(_2170) & 3;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[int(_2172)][_2174];
    int _2178 = int(_2170) + 1;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    int _2182 = _2178 & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    float _2186 = -_779;
    int _2188 = _1968 ? as_type<int>(_2186) : as_type<int>(_779);
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2192 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2194 = int(_2064) + int(_2150);
    bool _2196 = !_2010;
    float _2198 = _2196 ? _779 : as_type<float>(_2188);
    int _2200 = _2162 + 8;
    uint _2202 = uint(int(uint(_2200) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2136 & 3;
    bool _2220 = _2218 != 0;
    out.m_75.x = _2000;
    out.m_75.y = _2190;
    out.m_75.z = _2192;
    out.m_75.w = _2168;
    float _2222 = _2198 + 0.5;
    float _2224 = _2132 + (-0.5);
    bool _2226 = uint(_2218) > 1u;
    bool _2228 = uint(_2218) >= 2u;
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[80].x, _429);
    int _2232 = ~_519;
    int _2234 = _2232 + 1;
    float _2236 = -_2224;
    float _2238 = -_447;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2238);
    int _2242 = _2234 * _2194;
    int _2244 = _2242 + _2024;
    int _2246 = _2158 ? 0 : 1;
    bool _2248 = _2218 != 3;
    int _2250 = ~_2246;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2254;
    if (!_2226)
    {
        int _2258 = ~_2246;
        int _2260 = _2258 + 1;
        _2256 = _2260;
    }
    int _2262 = _2256;
    bool _2264 = !_2220;
    int _2266 = _2264 ? 0 : 1;
    int _2268 = abs(_2262);
    int _2270 = _2228 ? 0 : 1;
    bool _2272 = _2218 != 3;
    int _2274 = abs(_2266);
    int _2276 = ~_2270;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    bool _2282 = !_2272;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2280;
    if (_2248)
    {
        int _2288 = ~_2270;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    int _2294 = ~_2268;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = uint(_2244) >= uint(_519);
    int _2302 = abs(_2284);
    int _2304 = _2298 * as_type<int>(_2184);
    int _2306 = abs(_2292);
    int _2308 = ~_2274;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    bool _2314 = !_2106;
    int _2316 = _2314 ? 0 : 1;
    bool _2318 = !_2300;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = _2312 * as_type<int>(_2176);
    int _2324 = _2322 + _2304;
    int _2326 = ~_2306;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = abs(_2316);
    int _2334 = ~_2194;
    int _2336 = _2334 + _2320;
    int _2338 = _2336 + 1;
    int _2340 = _2330 * as_type<int>(_2208);
    int _2342 = _2340 + _2324;
    int _2344 = ~_2302;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = _1289 + _1281;
    int _2352 = _519 * _2338;
    int _2354 = _2352 + _2024;
    float _2356 = -_601;
    float _2358 = _2356 + 1.0;
    int _2360 = _2348 * as_type<int>(_2216);
    int _2362 = _2360 + _2342;
    int _2364 = ~_2332;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2132, _1936, _2240);
    bool _2372 = !_1950;
    int _2374 = _2372 ? _2354 : (-1);
    float _2376 = -_2358;
    float _2378 = fma(_2198, _2376, _2230);
    float _2380 = as_type<float>(_2354);
    if (!_1755)
    {
        _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2380;
    int _2384 = _2362 * _2368;
    int _2386 = _2374 * _2332;
    int _2388 = _2386 + _2384;
    float _2390 = _2350 * 0.5;
    float _2392 = -_2006;
    float _2394 = _2392 + 1.0;
    int _2396 = as_type<int>(_2382);
    if (!_1755)
    {
        float _2398 = _2382 * 5.0;
        _2396 = as_type<int>(_2398);
    }
    int _2400 = _2396;
    float _2402 = float(_2388);
    float _2404 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2406 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1755)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_2400);
        out.gl_Position.z = _5931;
    }
    float _2408 = _2404 * _1477;
    float _2410 = _2408;
    if (!_1755)
    {
        _2410 = 0.0;
    }
    float _2412 = _2410;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_77.x = _2402;
    bool _2416 = _1371 > 0.0;
    bool _2418 = isnan(_1371);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(0.0);
    bool _2424 = _2420 || _2422;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2378;
    out.m_79.y = _2370;
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2438 = -_2406;
    float _2440 = _2438 + 1.0;
    out.m_81.z = _2390;
    out.m_81.w = _1281;
    float _2442 = _2406 * _1871;
    out.m_83.x = _2430;
    out.m_83.y = _2432;
    out.m_83.z = _2434;
    float _2444 = _1882 * _2442;
    float _2446 = _1896 * _2442;
    out.m_85.w = _2436;
    float _2448 = fma(_1892, _2444, _1876);
    float _2450 = fma(_1894, _2444, _1878);
    float _2452 = _1882 * _2440;
    float _2454 = fma(_1882, _2446, _1880);
    out.m_87.x = _2448;
    out.m_87.y = _2450;
    out.m_87.z = _2454;
    out.m_87.w = _2452;
    if (_2424)
    {
        return out;
    }
    out.m_54.x = 0.0;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2456;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_51.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_54.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2511 = as_type<float>(_120);
        out.gl_Position.z = _2511;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_56.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_54.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_156);
        out.gl_Position.z = _2576;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = in.m_58.x;
    float _166 = in.m_58.y;
    float _168 = in.m_58.z;
    float _170 = in.m_58.w;
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_60.w;
    float _180 = in.m_62.x;
    float _182 = in.m_62.y;
    float _184 = in.m_62.z;
    float _186 = in.m_62.w;
    float _188 = _160 * _166;
    float _190 = fma(_158, _164, _188);
    float _192 = _160 * _174;
    float _194 = fma(_162, _168, _190);
    float _196 = _160 * _182;
    float _198 = fma(_158, _172, _192);
    float _200 = _194 + _170;
    float _202 = fma(_158, _180, _196);
    float _204 = fma(_162, _176, _198);
    float _206 = _200 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _208 = fma(_162, _184, _202);
    float _210 = _204 + _178;
    float _212 = _206 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _216 = _208 + _186;
    float _218 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[126].x, _212);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c15)._m0[127].x, _214);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[126].z, _218);
    float _224 = fma(_216, (*spvDescriptorSet0.vp_c15)._m0[127].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _230 = trunc(_226);
    int _232 = int(_230);
    float _234 = trunc(_228);
    int _236 = int(_234);
    int _238 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _240 = _232 + _238;
    int _242 = _240 + 1;
    bool _244 = _242 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _246 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _248 = _236 + _246;
    int _250 = _248 + 1;
    int _252 = _242 | _250;
    bool _254 = _252 < 0;
    bool _256 = _254 || _244;
    bool _258 = _250 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _260 = _258 || _256;
    int _262 = _250;
    int _264 = as_type<int>(_168);
    int _266 = _242;
    float _268 = _208;
    float _270 = _206;
    if (!_260)
    {
        int _272 = _250 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _274 = _272 + _242;
        _262 = _274;
    }
    int _276 = _262;
    float _278 = as_type<float>(_252);
    if (!_260)
    {
        float _280 = floor(_228);
        _278 = _280;
    }
    float _282 = _278;
    if (!_260)
    {
        int _284 = _276 << 2;
        _264 = _284;
    }
    int _286 = _264;
    int _288 = _286;
    if (!_260)
    {
        uint _291 = uint(int(uint(_276) >> uint(2)));
        _266 = int(_291);
    }
    int _293 = _266;
    if (!_260)
    {
        int _295 = 12 & _286;
        _288 = _295;
    }
    int _297 = _288;
    float _299 = 0.0;
    if (!_260)
    {
        int _301 = _293 << 4;
        int _303 = _301 + _297;
        _299 = as_type<float>(_303);
    }
    float _305 = _299;
    float _307 = as_type<float>(_293);
    if (!_260)
    {
        float _309 = floor(_226);
        _307 = _309;
    }
    float _311 = _307;
    if (!_260)
    {
        float _313 = -_282;
        float _315 = _228 + _313;
        _268 = _315;
    }
    float _317 = _268;
    float _319 = _305;
    if (!_260)
    {
        int _321 = as_type<int>(_305) + 400;
        uint _323 = uint(int(uint(_321) >> uint(2)));
        uint _325 = uint(int(uint(int(_323)) >> uint(2)));
        int _327 = int(_323) & 3;
        float _329 = (*spvDescriptorSet0.vp_c15)._m0[int(_325)][_327];
        _319 = _329;
    }
    float _331 = _319;
    float _333 = fma(_210, 6.2500002968590706586837768554688e-05, 0.5);
    float _335 = fma(_216, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2871 = float2(_333, _335);
    float _337 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_2871, float2(0.0), isnan(_2871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_2871, float2(0.0), isnan(_2871)), level(0.0)).x;
    float _339 = 0.0;
    if (!_260)
    {
        float _341 = -_311;
        float _343 = _226 + _341;
        _339 = _343;
    }
    float _345 = _339;
    float _347 = 0.0;
    if (!_260)
    {
        float _349 = rint(_331);
        float _351 = precise::max(_349, 0.0);
        uint _353 = uint(_351);
        uint _355 = clamp(_353, 0u, 65535u);
        _347 = as_type<float>(_355);
    }
    float _357 = _347;
    float _359 = _317;
    if (!_260)
    {
        float3 _2916 = float3(_345, _317, float(as_type<int>(_357)));
        float3 _2920 = select(_2916, float3(0.0), isnan(_2916));
        float _361 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _2920.xy, uint(rint(_2920.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _2920.xy, uint(rint(_2920.z)), level(0.0)).x;
        _359 = _361;
    }
    float _363 = _359;
    float _365 = in.m_64.z;
    float _367 = 1.0 / _126;
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = -_216;
    float _375 = _373 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _381 = int(_379);
    float _383 = _130 * 0.25;
    float _385 = _367 * _130;
    float _387 = _365 * 2.0;
    float _389 = _371 + _365;
    float _391 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = floor(_387);
    float _395 = _369 + _365;
    float _397 = _389 + (-1.0);
    float _399 = _371 * 2.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = -_377;
    float _405 = fma(_391, 2.0, _403);
    float _407 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _409 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = _395 + (-1.0);
    float _417 = _369 * 2.0;
    float _419 = fma(_409, -2.0, _401);
    float _421 = float(_381);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _425 = _369 + _371;
    float _427 = -_130;
    float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _405);
    bool _431 = _393 > 0.0;
    float _433 = floor(_399);
    bool _435 = _393 >= 0.0;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 + (-1.0);
    float _447 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _459 = _457 != 0;
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = _413 * _130;
    int _465 = _443 ? 0 : 1;
    float _467 = floor(_417);
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    bool _473 = !_451;
    int _475 = _473 ? 0 : 1;
    bool _477 = !_459;
    int _479 = _477 ? 0 : 1;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _491 = _489 != 0;
    float _493 = exp2(_463);
    int _495 = ~_465;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    int _501 = _499;
    float _503 = _375;
    if (!_431)
    {
        int _505 = ~_465;
        int _507 = _505 + 1;
        _501 = _507;
    }
    int _509 = _501;
    bool _511 = !_483;
    int _513 = _511 ? 0 : 1;
    float _515 = float(_509);
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _519 = int(_517);
    int _521 = abs(_513);
    bool _523 = _433 >= 0.0;
    bool _525 = isnan(_433);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = float(_521);
    float _535 = 1.0 / _421;
    int _537 = _531 ? 0 : 1;
    float _539 = _533 * _515;
    float _541 = -_493;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    bool _549 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    bool _559 = _467 > 0.0;
    float _561 = 1.0 / _547;
    bool _563 = _467 >= 0.0;
    bool _565 = isnan(_467);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    float _573 = _557 ? _543 : 0.0;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _589 = _433 > 0.0;
    float _591 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = float(_519);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _587);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _599 = _210 + _597;
    float _601 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _603 = _539 * (-2.0);
    float _605 = _593 * _130;
    float _607 = _535 * _130;
    float _609 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    float _611 = abs(_599);
    float _613 = abs(_375);
    float _615 = precise::max(_611, _613);
    if (_585)
    {
        float _617 = _573 * _561;
        _150 = _617;
    }
    float _619 = _150;
    int _621 = ~_537;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_461, _603, _461);
    int _629 = _625;
    int _631 = as_type<int>(_619);
    if (!_589)
    {
        int _633 = ~_537;
        int _635 = _633 + 1;
        _629 = _635;
    }
    int _637 = _629;
    float _639 = _369 + (-0.5);
    float _641 = as_type<float>(int(gl_VertexIndex));
    int _643 = _571 ? 0 : 1;
    float _645 = ceil(_383);
    bool _647 = _615 >= 16.0;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _651 = !_487;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_491;
    int _657 = _655 ? 0 : 1;
    float _659 = fma(_627, _619, _649);
    int _661 = ~_643;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    int _667 = _665;
    if (!_559)
    {
        int _669 = ~_643;
        int _671 = _669 + 1;
        _667 = _671;
    }
    int _673 = _667;
    float _675 = _599 * 0.0625;
    int _677 = abs(_653);
    float _679 = _659 * 0.15915493667125701904296875;
    int _681 = abs(_657);
    if (_647)
    {
        float _683 = _375 * 0.0625;
        _503 = _683;
    }
    float _685 = _503;
    float _687 = _647 ? _675 : _599;
    float _689 = _645 * 0.5;
    float _691 = float(_681);
    float _693 = _679 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = float(_637);
    float _699 = _371 + (-0.5);
    float _701 = float(_677);
    float _703 = float(_673);
    float _705 = _691 * _697;
    float _707 = abs(_687);
    bool _709 = _707 != 0.0;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = floor(_689);
    float _721 = _701 * _703;
    float _723 = abs(_685);
    bool _725 = _723 == 0.0;
    bool _727 = !_717;
    bool _729 = _725 && _727;
    float _731 = in.m_69.x;
    float _733 = in.m_69.y;
    float _735 = _705 * (-2.0);
    float _737 = _721 * (-2.0);
    int _739 = as_type<int>(_641) & 1;
    bool _741 = _739 != 0;
    int _743 = as_type<int>(_641) & 2;
    bool _745 = _743 != 0;
    float _747 = fma(_423, _735, _423);
    float _749 = abs(_685);
    bool _751 = _749 == 0.0;
    float _753 = fma(_407, _737, _407);
    float _755 = _365 + (-0.5);
    float _757 = _699 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _759 = _679 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _765 = _487;
    int _767 = as_type<int>(_641);
    int _769 = _729 ? (-1) : 0;
    if (_729)
    {
        bool _771 = as_type<int>(_685) >= 0;
        _765 = _771;
    }
    bool _773 = _765;
    float _775 = fma(_753, _619, _757);
    bool _777 = !_741;
    float _779 = _777 ? (-0.5) : 0.5;
    float _781 = fma(_747, _619, _763);
    if (_729)
    {
        int _783 = _773 ? 0 : 1078530011;
        _767 = _783;
    }
    int _785 = _767;
    bool _787 = !_745;
    float _789 = _787 ? (-0.5) : 0.5;
    if (_729)
    {
        int _791 = int(0x80000000) & as_type<int>(_687);
        int _793 = _785 | _791;
        _631 = _793;
    }
    int _795 = _631;
    bool _797 = !_717;
    bool _799 = _797 && _751;
    int _801 = _795;
    float _803 = as_type<float>(_795);
    if (!_799)
    {
        float _805 = abs(_687);
        bool _807 = _805 != as_type<float>(0x7f800000u /* inf */);
        bool _809 = isnan(_805);
        bool _811 = _807 || _809;
        bool _813 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _815 = _811 || _813;
        float _817 = abs(_685);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        float _821 = abs(_685);
        bool _823 = _821 == as_type<float>(0x7f800000u /* inf */);
        bool _825 = !_815;
        bool _827 = _823 && _825;
        if (_827)
        {
            bool _829 = as_type<int>(_685) >= 0;
            _769 = _829 ? (-1) : 0;
        }
        int _831 = _769;
        if (_827)
        {
            _801 = 1075235812;
        }
        int _833 = _801;
        int _835 = _833;
        if (_827)
        {
            int _837 = ~_831;
            int _839 = (_837 != 0) ? _833 : 1061752795;
            _835 = _839;
        }
        int _841 = _835;
        float _843 = as_type<float>(_841);
        if (_827)
        {
            int _845 = int(0x80000000) & as_type<int>(_687);
            int _847 = _841 | _845;
            _843 = as_type<float>(_847);
        }
        float _849 = _843;
        bool _851 = !_815;
        bool _853 = _851 && _819;
        _803 = _849;
        if (!_853)
        {
            float _855 = abs(_685);
            float _857 = abs(_687);
            float _859 = precise::max(_855, _857);
            float _861 = abs(_685);
            float _863 = abs(_687);
            float _865 = precise::min(_861, _863);
            float _867 = 1.0 / _859;
            float _869 = abs(_687);
            float _871 = abs(_685);
            bool _873 = _869 > _871;
            bool _875 = as_type<int>(_685) >= 0;
            float _877 = abs(_685);
            float _879 = abs(_687);
            float _881 = _877 + _879;
            int _883 = as_type<int>(_687) & int(0x80000000);
            bool _885 = _881 > as_type<float>(0x7f800000u /* inf */);
            bool _887 = isnan(_881);
            bool _889 = _885 || _887;
            bool _891 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _893 = _889 || _891;
            float _895 = _865 * _867;
            float _897 = _895 * _895;
            float _899 = _897 + 11.33538818359375;
            float _901 = fma(_897, _899, 28.84246826171875);
            float _903 = fma(_897, _901, 19.6966705322265625);
            float _905 = fma(_897, -0.82336294651031494140625, -5.674867153167724609375);
            float _907 = fma(_897, _905, -6.565555095672607421875);
            float _909 = 1.0 / _903;
            float _911 = _897 * _907;
            float _913 = _895 * _911;
            float _915 = fma(_913, _909, _895);
            float _917 = _915;
            _803 = _881;
            if (_873)
            {
                float _919 = -_915;
                float _921 = _919 + 1.57079637050628662109375;
                _917 = _921;
            }
            float _923 = _917;
            int _925 = as_type<int>(_923);
            if (!_875)
            {
                float _927 = -_923;
                float _929 = _927 + 3.1415927410125732421875;
                _925 = as_type<int>(_929);
            }
            int _931 = _925;
            if (!_893)
            {
                int _933 = _883 | _931;
                _803 = as_type<float>(_933);
            }
        }
    }
    float _935 = _803;
    float _937 = -_935;
    float _939 = _775 + _937;
    float _941 = fma(_719, -2.0, _645);
    bool _943 = _385 < 0.85000002384185791015625;
    float _945 = float(_943);
    float _947 = _781 * 0.15915493667125701904296875;
    float _949 = _939 * 0.15915493667125701904296875;
    float _951 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = precise::max(_941, _945);
    float _955 = _947 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _733 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _961 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _963 = _789 * _953;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _967 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _975 = _971 || _973;
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _963);
    float _983 = _779 * _953;
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _981 * _965;
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = _957 * _987;
    float _997 = _989 * _985;
    float _999 = _947 * 6.283185482025146484375;
    float _1001 = sin(_999);
    float _1003 = _761 * _979;
    float _1005 = _695 * _995;
    float _1007 = _695 * _979;
    float _1009 = _695 * _993;
    float _1011 = _761 * _993;
    float _1013 = _993 * _957;
    float _1015 = _979 * _957;
    float _1017 = _761 * _995;
    float _1019 = _200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = -_1003;
    float _1023 = fma(_1001, _1009, _1021);
    float _1025 = -_987;
    float _1027 = _1001 * _1025;
    float _1029 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1031 = fma(_1023, _997, _1005);
    float _1033 = fma(_1001, _1007, _1011);
    float _1035 = fma(_1013, _997, _1027);
    float _1037 = fma(_1001, _1011, _1007);
    float _1039 = -_1009;
    float _1041 = fma(_1001, _1003, _1039);
    float _1043 = fma(_1033, _961, _1031);
    float _1045 = fma(_1015, _961, _1035);
    float _1047 = fma(_1037, _997, _1017);
    float _1049 = _200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1051 = _216 + _1043;
    float _1053 = _210 + _1045;
    float _1055 = fma(_1041, _961, _1047);
    float _1057 = fma(_210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1049);
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1061 = _1051 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1065 = _1053 + _1063;
    float _1067 = _200 + _1055;
    float _1069 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    float _1071 = _1061 * _1061;
    float _1073 = fma(_216, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1029);
    float _1075 = fma(_1065, _1065, _1071);
    float _1077 = sqrt(_1075);
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1081 = _1079 != 0;
    bool _1083 = _1077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1087 = _1029;
    float _1089 = _1057;
    if (!_1083)
    {
        _1085 = _1053;
    }
    float _1091 = _1085;
    float _1093 = _1091;
    if (!_1083)
    {
        _1087 = _1051;
    }
    float _1095 = _1087;
    float _1097 = _1095;
    if (!_1083)
    {
        _1089 = _1067;
    }
    float _1099 = _1089;
    bool _1101 = !_1083;
    float _1103 = _1099;
    if (!_1101)
    {
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1109 = _1077 + _1107;
        float _1111 = _1067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1113 = rsqrt(_1075);
        float _1115 = _1109 * _1105;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = _1117 * 6.283185482025146484375;
        float _1121 = cos(_1119);
        float _1123 = _1117 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1121 + (-1.0);
        float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = fma(_1125, _1111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1133 = fma(_1067, _1121, _1129);
        float _1135 = _1113 * _1131;
        float _1137 = fma(_1065, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1139 = fma(_1061, _1135, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1139;
        _1103 = _1133;
        _1093 = _1137;
    }
    float _1141 = _1097;
    float _1143 = _1103;
    float _1145 = _1093;
    float _1147 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1149 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1151 = _1143;
    float _1153 = _1145;
    float _1155 = _1141;
    if (!_975)
    {
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1159 = _200 + _1157;
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = -_216;
        float _1165 = _1163 + _1141;
        float _1167 = _1159 * _1159;
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1171 = _216 + _1169;
        float _1173 = fma(_599, _599, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1171, _1171, _1173);
        float _1179 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = sqrt(_1177);
        float _1183 = precise::min(_1181, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_200;
        float _1189 = _1187 + _1143;
        float _1191 = _1179 * _1185;
        float _1193 = -_210;
        float _1195 = _1193 + _1145;
        float _1197 = fma(_1189, _1191, _200);
        float _1199 = fma(_1195, _1191, _210);
        float _1201 = fma(_1165, _1191, _216);
        _1151 = _1197;
        _1153 = _1199;
        _1155 = _1201;
    }
    float _1203 = _1151;
    float _1205 = _1153;
    float _1207 = _1155;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = 1.0 / _1149;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1211);
    float _1221 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1219);
    bool _1229 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1231 = isnan(0.5);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1237 = _1233 || _1235;
    float _1239 = _1147 + _1149;
    float _1241 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1245 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1247 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1251 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1243);
    float _1259 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1249);
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1265 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1267 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1271);
    float _1281 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1275);
    float _1285 = _1239 * _1215;
    float _1287 = _1285 * 0.5;
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1277);
    float _1291 = _1273;
    float _1293 = _1269;
    float _1295 = _1277;
    float _1297 = _1287;
    float _1299 = _1279;
    float _1301 = _1283;
    if (_1237)
    {
        _1291 = 1.0;
    }
    float _1303 = _1291;
    float _1305 = _1303;
    if (!_1237)
    {
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1315 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1313);
        float _1317 = _1309 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1311 * 0.15915493667125701904296875;
        float _1323 = _1309 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        float _1327 = 1.0 / _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1329;
        float _1333 = _1321 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1325 * _1327;
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1335 * _1337;
        float _1345 = 1.0 / _1315;
        float _1347 = 1.0 / _1343;
        float _1349 = 1.0 / _1331;
        float _1351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1353 = _1345 * _1351;
        float _1355 = _1341 * _1347;
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = fma(_1355, _1353, _1357);
        float _1361 = _1359 * _1349;
        float _1363 = precise::clamp(_1361, 0.0, 1.0);
        _1293 = _1353;
        _1295 = _1359;
        _1297 = _1345;
        _1305 = _1363;
    }
    float _1365 = _1293;
    float _1367 = _1295;
    float _1369 = _1297;
    float _1371 = _1305;
    out.gl_Position.x = _1283;
    out.gl_Position.y = _1279;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1281;
    float _1373 = abs(_337);
    bool _1375 = _1373 != 0.0;
    bool _1377 = isnan(_1373);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = _1365;
    float _1387 = _1369;
    float _1389 = _1367;
    if (_1237)
    {
        _1385 = 1.0;
    }
    float _1391 = _1385;
    float _1393 = _1391;
    if (_1383)
    {
        _1387 = _1281;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1383)
    {
        _1397 = 0.0;
    }
    float _1399 = _1397;
    float _1401 = _1399;
    if (!_1237)
    {
        float _1403 = as_type<float>(in.m_73.w);
        int _1405 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1407 = _1405 == 4;
        bool _1409 = _1405 == 8;
        bool _1411 = _1405 == 12;
        int _1413 = as_type<int>(_1403) << 16;
        int _1415 = as_type<int>(_1403) << 8;
        int _1417 = as_type<int>(_1403) << 24;
        int _1419 = _1413 >> 24;
        int _1421 = _1415 >> 24;
        int _1423 = as_type<int>(_1403) >> 24;
        int _1425 = _1417 >> 24;
        float _1427 = float(_1419);
        float _1429 = float(_1421);
        float _1431 = float(_1423);
        float _1433 = _1427 * 0.0078740157186985015869140625;
        float _1435 = float(_1425);
        float _1437 = _1429 * 0.0078740157186985015869140625;
        float _1439 = _1431 * 0.0078740157186985015869140625;
        float _1441 = precise::min(_1433, 1.0);
        float _1443 = _1435 * 0.0078740157186985015869140625;
        float _1445 = precise::min(_1437, 1.0);
        float _1447 = precise::min(_1439, 1.0);
        float _1449 = precise::min(_1443, 1.0);
        float _1451 = precise::max(_1441, -1.0);
        float _1453 = precise::max(_1445, -1.0);
        float _1455 = precise::max(_1447, -1.0);
        float _1457 = precise::max(_1449, -1.0);
        float _1459 = _1457;
        _1389 = _1451;
        if (_1407)
        {
            _1459 = _1451;
        }
        float _1461 = _1459;
        float _1463 = _1461;
        if (_1409)
        {
            _1463 = _1453;
        }
        float _1465 = _1463;
        float _1467 = _1465;
        if (_1411)
        {
            _1467 = _1455;
        }
        float _1469 = _1467;
        float _1471 = abs(_1469);
        float _1473 = (-0.0) + _1471;
        _1393 = _1473;
    }
    float _1475 = _1389;
    float _1477 = _1393;
    float _1479 = _1475;
    if (!_1383)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_260)
    {
        int _1481 = _276 << 4;
        int _1483 = _1481 + 2048;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        uint _1487 = uint(int(uint(int(_1485)) >> uint(2)));
        int _1489 = int(_1485) & 3;
        float _1491 = (*spvDescriptorSet0.vp_c15)._m0[int(_1487)][_1489];
        int _1493 = int(_1485) + 1;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        int _1497 = _1493 & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        int _1501 = _1483 + 8;
        uint _1503 = uint(int(uint(_1501) >> uint(2)));
        uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
        int _1507 = int(_1503) & 3;
        float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
        int _1511 = int(_1503) + 1;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        int _1515 = _1511 & 3;
        float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
        float _1519 = _206 * _1499;
        float _1521 = fma(_210, _1491, _1519);
        float _1523 = fma(_216, _1509, _1521);
        float _1525 = _1523 + _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        float _1529 = -_1527;
        float _1531 = _1529 + _363;
        float _1533 = fma(_1531, 500.0, 1.5);
        float _1535 = exp2(_1533);
        float _1537 = 0.0 + _1535;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        bool _1541 = _1539 >= 1.0;
        bool _1543 = isnan(_1539);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan(1.0);
        bool _1549 = _1545 || _1547;
        _1479 = _1509;
        _270 = _1519;
        if (!_1549)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1549)
        {
            _1401 = 0.0;
        }
    }
    float _1551 = _1401;
    float _1553 = _1479;
    float _1555 = _270;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1203 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1205 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = _1207 + _1565;
    float _1569 = float(uint(_519));
    float _1571 = _1559 * _1559;
    float _1573 = trunc(_607);
    int _1575 = int(_1573);
    float _1577 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = fma(_1563, _1563, _1571);
    float _1581 = fma(_1567, _1567, _1579);
    float _1583 = 1.0 / _1569;
    float _1585 = rsqrt(_1581);
    float _1587 = sqrt(_1581);
    int _1589 = as_type<int>(_1583) + (-2);
    float _1591 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1593 = 1.0 / _1551;
    float _1595 = _1563 * _1591;
    float _1597 = _1567 * _1591;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1553;
    float _1615 = _1603;
    float _1617 = _1611;
    float _1619 = _1555;
    float _1621 = _1559;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1619 = _1637;
    }
    float _1639 = _1619;
    float _1641 = _1625;
    float _1643 = _1639;
    if (_1607)
    {
        float _1645 = _1639 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1641 = _1647;
    }
    float _1649 = _1641;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _210;
    float _1657 = _1653;
    if (_1607)
    {
        float _1659 = _1639 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1591;
    float _1667 = -_1653;
    float _1669 = fma(_1559, _1665, _1667);
    if (_1607)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1649;
    float _1677 = _1673;
    if (_1607)
    {
        float _1679 = fma(_1649, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1675 = _1679;
    }
    float _1681 = _1675;
    float _1683 = _1681;
    float _1685 = _1663;
    if (_1607)
    {
        float _1687 = _1663 + (-1.0);
        _1677 = _1687;
    }
    float _1689 = _1677;
    float _1691 = _1689;
    if (_1607)
    {
        float _1693 = _1629 * _1681;
        _1621 = _1693;
    }
    float _1695 = _1621;
    if (!_1607)
    {
        _1631 = _1595;
    }
    float _1697 = _1631;
    float _1699 = _1697;
    if (_1607)
    {
        float _1701 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1701;
    }
    float _1703 = _1643;
    float _1705 = _1703;
    if (_1607)
    {
        float _1707 = _1595 * _1695;
        _1699 = _1707;
    }
    float _1709 = _1699;
    if (!_1607)
    {
        _1683 = _1669;
    }
    float _1711 = _1683;
    float _1713 = _1711;
    if (_1607)
    {
        float _1715 = fma(_1669, _1663, _1703);
        _1713 = _1715;
    }
    float _1717 = _1713;
    if (!_1607)
    {
        _1691 = _1597;
    }
    float _1719 = _1691;
    float _1721 = _1719;
    if (_1607)
    {
        float _1723 = _1597 * _1695;
        _1721 = _1723;
    }
    float _1725 = _1721;
    if (!_1607)
    {
        _1685 = _1599;
    }
    float _1727 = _1685;
    float _1729 = _1727;
    if (_1607)
    {
        float _1731 = _1709 * _1709;
        _1729 = _1731;
    }
    float _1733 = _1729;
    if (!_1607)
    {
        _1705 = _1601;
    }
    float _1735 = _1705;
    float _1737 = _1735;
    if (_1607)
    {
        float _1739 = _1725 * _1725;
        _1737 = _1739;
    }
    float _1741 = _1737;
    float _1743 = float(uint(_1575));
    float _1745 = fma(_1717, _1717, _1733);
    bool _1747 = _1477 != 0.0;
    bool _1749 = isnan(_1477);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1745 + _1741;
    float _1759 = as_type<float>(_1589) * _1743;
    int _1761 = ~_519;
    int _1763 = _1761 + 1;
    float _1765 = rsqrt(_1757);
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1769 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1767);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    if (!_1755)
    {
        _1299 = 0.0;
        _1301 = 0.0;
    }
    float _1773 = _1299;
    float _1775 = _1301;
    float _1777 = -_1771;
    float _1779 = _1777 + 1.0;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1783 = trunc(_1759);
    float _1785 = precise::max(_1783, 0.0);
    uint _1787 = uint(_1785);
    float _1789 = _1593 * _1773;
    float _1791 = -_1577;
    float _1793 = fma(_1791, _1781, 1.0);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1765 * _1709;
    float _1801 = _1765 * _1717;
    float _1803 = _1765 * _1725;
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1807 = log2(_1793);
    float _1809 = -_1805;
    float _1811 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1811);
    int _1817 = _1763 * int(_1787);
    int _1819 = _1817 + _1575;
    float _1821 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1815, 0.5, 0.5);
    float _1827 = float(uint(_1819));
    float _1829 = _1801 + 1.0;
    float _1831 = _1593 * _1775;
    float _1833 = exp2(_1821);
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = _1807 * 0.693147182464599609375;
    float _1839 = as_type<float>(_1589) * _1827;
    float _1841 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1843 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1845 = sqrt(_1823);
    float _1847 = fma(_1825, _1841, 1.570728778839111328125);
    float _1849 = fma(_1831, 0.5, 0.5);
    float _1851 = -_1801;
    float _1853 = fma(_1833, _1829, _1851);
    float _1855 = trunc(_1839);
    float _1857 = precise::max(_1855, 0.0);
    uint _1859 = uint(_1857);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = _1845 * 0.636619746685028076171875;
    float _1865 = fma(_1789, -0.5, 0.5);
    float _1867 = -_1847;
    float _1869 = fma(_1863, _1867, 1.0);
    float3 _5166 = float3(_1849, _1865, _1843);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5166, float3(0.0), isnan(_5166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5166, float3(0.0), isnan(_5166)), level(0.0)).x;
    float3 _5175 = float3(_1849, _1865, _1843);
    float4 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5175, float3(0.0), isnan(_5175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5175, float3(0.0), isnan(_5175)), level(0.0)).xyzw;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float _1882 = _1874.w;
    bool _1884 = !_1081;
    float _1886 = _1884 ? 7.345489978790283203125 : 1.0;
    float2 _5196 = float2(_1869, _1861);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    int _1898 = ~_519;
    int _1900 = _1898 + 1;
    float _1902 = _1886 * _369;
    int _1904 = int(_1787) + int(_1859);
    float _1906 = _605 * _367;
    float _1908 = float(_1575);
    float _1910 = floor(_1902);
    int _1912 = _519 + (-1);
    int _1914 = _1900 * _1904;
    int _1916 = _1914 + _1575;
    bool _1918 = _1908 >= _593;
    bool _1920 = isnan(_1908);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan(_593);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1932 = abs(_471);
    float _1934 = -_609;
    float _1936 = _1934 + 1.0;
    bool _1938 = uint(_1916) >= uint(_519);
    float _1940 = trunc(_1906);
    int _1942 = int(_1940);
    int _1944 = abs(_479);
    out.m_54.x = 1.0;
    bool _1946 = !_1938;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = _519 == 0;
    int _1952 = ~_1904;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    float _1958 = trunc(_1928);
    int _1960 = int(_1958);
    float _1962 = -_1910;
    float _1964 = _1902 + _1962;
    bool _1966 = _371 > 0.5;
    bool _1968 = _369 > 0.5;
    float _1970 = _1964 * _593;
    int _1972 = _519 * _1956;
    int _1974 = _1972 + _1575;
    float _1976 = trunc(_1970);
    int _1978 = int(_1976);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1982 = _1980 != 0;
    bool _1984 = !_1950;
    int _1986 = _1984 ? _1974 : (-1);
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1990 = !_1982;
    int _1992 = _1990 ? 0 : 1;
    int _1994 = ~_1960;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1930);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1986 * _1998;
    int _2014 = abs(_1992);
    int _2016 = abs(_475);
    int _2018 = _1960 * _1912;
    int _2020 = _2018 + _2012;
    int _2022 = _1978 * _2014;
    int _2024 = _2022 + _1575;
    bool _2026 = !_2004;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = _2020 * _1932;
    int _2032 = abs(_2028);
    int _2034 = _1942 * _2016;
    int _2036 = _2034 + _2030;
    int _2038 = ~_519;
    int _2040 = _2038 + 1;
    int _2042 = _2024 * _1944;
    int _2044 = _2042 + _2036;
    float _2046 = float(uint(_2024));
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2050 = _2048 != 0;
    int _2052 = _1978 * _2032;
    int _2054 = _2052 + _2044;
    float _2056 = as_type<float>(_1589) * _2046;
    float _2058 = float(uint(_2054));
    float _2060 = trunc(_2056);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    float _2066 = as_type<float>(_1589) * _2058;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2040 * int(_2072);
    int _2076 = _2074 + _2054;
    float _2078 = float(uint(_2076));
    int _2080 = ~_519;
    int _2082 = _2080 + 1;
    float _2084 = as_type<float>(_1589) * _2078;
    float _2086 = trunc(_2084);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    int _2092 = int(_2072) + int(_2090);
    int _2094 = _2082 * _2092;
    int _2096 = _2094 + _2054;
    bool _2098 = uint(_2096) >= uint(_519);
    bool _2100 = !_2098;
    int _2102 = _2100 ? 0 : (-1);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2092;
    int _2110 = _2108 + _2102;
    int _2112 = _2110 + 1;
    int _2114 = ~_519;
    int _2116 = _2114 + 1;
    float _2118 = -_789;
    int _2120 = _1966 ? as_type<int>(_2118) : as_type<int>(_789);
    int _2122 = _519 * _2112;
    int _2124 = _2122 + _2054;
    int _2126 = _2116 * int(_2064);
    int _2128 = _2126 + _2024;
    bool _2130 = !_2050;
    float _2132 = _2130 ? _789 : as_type<float>(_2120);
    bool _2134 = !_1950;
    int _2136 = _2134 ? _2124 : (-1);
    float _2138 = float(uint(_2128));
    int _2140 = _2136 >> 31;
    float _2142 = as_type<float>(_1589) * _2138;
    int _2144 = _2140 & 3;
    float _2146 = trunc(_2142);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = _2136 + _2144;
    int _2154 = _2152 >> 2;
    int _2156 = _2136 & 3;
    bool _2158 = _2156 != 0;
    int _2160 = _2154 << 4;
    int _2162 = _2160 + 368;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2170 = uint(int(uint(_2162) >> uint(2)));
    uint _2172 = uint(int(uint(int(_2170)) >> uint(2)));
    int _2174 = int(_2170) & 3;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[int(_2172)][_2174];
    int _2178 = int(_2170) + 1;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    int _2182 = _2178 & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    float _2186 = -_779;
    int _2188 = _1968 ? as_type<int>(_2186) : as_type<int>(_779);
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2192 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2194 = int(_2064) + int(_2150);
    bool _2196 = !_2010;
    float _2198 = _2196 ? _779 : as_type<float>(_2188);
    int _2200 = _2162 + 8;
    uint _2202 = uint(int(uint(_2200) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2136 & 3;
    bool _2220 = _2218 != 0;
    out.m_75.x = _2000;
    out.m_75.y = _2190;
    out.m_75.z = _2192;
    out.m_75.w = _2168;
    float _2222 = _2198 + 0.5;
    float _2224 = _2132 + (-0.5);
    bool _2226 = uint(_2218) > 1u;
    bool _2228 = uint(_2218) >= 2u;
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[80].x, _429);
    int _2232 = ~_519;
    int _2234 = _2232 + 1;
    float _2236 = -_2224;
    float _2238 = -_447;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2238);
    int _2242 = _2234 * _2194;
    int _2244 = _2242 + _2024;
    int _2246 = _2158 ? 0 : 1;
    bool _2248 = _2218 != 3;
    int _2250 = ~_2246;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2254;
    if (!_2226)
    {
        int _2258 = ~_2246;
        int _2260 = _2258 + 1;
        _2256 = _2260;
    }
    int _2262 = _2256;
    bool _2264 = !_2220;
    int _2266 = _2264 ? 0 : 1;
    int _2268 = abs(_2262);
    int _2270 = _2228 ? 0 : 1;
    bool _2272 = _2218 != 3;
    int _2274 = abs(_2266);
    int _2276 = ~_2270;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    bool _2282 = !_2272;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2280;
    if (_2248)
    {
        int _2288 = ~_2270;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    int _2294 = ~_2268;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = uint(_2244) >= uint(_519);
    int _2302 = abs(_2284);
    int _2304 = _2298 * as_type<int>(_2184);
    int _2306 = abs(_2292);
    int _2308 = ~_2274;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    bool _2314 = !_2106;
    int _2316 = _2314 ? 0 : 1;
    bool _2318 = !_2300;
    int _2320 = _2318 ? 0 : (-1);
    int _2322 = _2312 * as_type<int>(_2176);
    int _2324 = _2322 + _2304;
    int _2326 = ~_2306;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = abs(_2316);
    int _2334 = ~_2194;
    int _2336 = _2334 + _2320;
    int _2338 = _2336 + 1;
    int _2340 = _2330 * as_type<int>(_2208);
    int _2342 = _2340 + _2324;
    int _2344 = ~_2302;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = _1289 + _1281;
    int _2352 = _519 * _2338;
    int _2354 = _2352 + _2024;
    float _2356 = -_601;
    float _2358 = _2356 + 1.0;
    int _2360 = _2348 * as_type<int>(_2216);
    int _2362 = _2360 + _2342;
    int _2364 = ~_2332;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2132, _1936, _2240);
    bool _2372 = !_1950;
    int _2374 = _2372 ? _2354 : (-1);
    float _2376 = -_2358;
    float _2378 = fma(_2198, _2376, _2230);
    float _2380 = as_type<float>(_2354);
    if (!_1755)
    {
        _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2382 = _2380;
    int _2384 = _2362 * _2368;
    int _2386 = _2374 * _2332;
    int _2388 = _2386 + _2384;
    float _2390 = _2350 * 0.5;
    float _2392 = -_2006;
    float _2394 = _2392 + 1.0;
    int _2396 = as_type<int>(_2382);
    if (!_1755)
    {
        float _2398 = _2382 * 5.0;
        _2396 = as_type<int>(_2398);
    }
    int _2400 = _2396;
    float _2402 = float(_2388);
    float _2404 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2406 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1755)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_2400);
        out.gl_Position.z = _5931;
    }
    float _2408 = _2404 * _1477;
    float _2410 = _2408;
    if (!_1755)
    {
        _2410 = 0.0;
    }
    float _2412 = _2410;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_77.x = _2402;
    bool _2416 = _1371 > 0.0;
    bool _2418 = isnan(_1371);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(0.0);
    bool _2424 = _2420 || _2422;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2378;
    out.m_79.y = _2370;
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2438 = -_2406;
    float _2440 = _2438 + 1.0;
    out.m_81.z = _2390;
    out.m_81.w = _1281;
    float _2442 = _2406 * _1871;
    out.m_83.x = _2430;
    out.m_83.y = _2432;
    out.m_83.z = _2434;
    float _2444 = _1882 * _2442;
    float _2446 = _1896 * _2442;
    out.m_85.w = _2436;
    float _2448 = fma(_1892, _2444, _1876);
    float _2450 = fma(_1894, _2444, _1878);
    float _2452 = _1882 * _2440;
    float _2454 = fma(_1882, _2446, _1880);
    out.m_87.x = _2448;
    out.m_87.y = _2450;
    out.m_87.z = _2454;
    out.m_87.w = _2452;
    if (_2424)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_54.x = 0.0;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2456;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

