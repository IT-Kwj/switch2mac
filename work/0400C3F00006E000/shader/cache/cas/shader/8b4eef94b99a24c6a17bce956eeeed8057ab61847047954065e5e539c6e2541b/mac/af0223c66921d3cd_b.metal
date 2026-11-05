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
    float4 m_93 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
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
    float4 m_67 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_51.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_54.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3672 = as_type<float>(_126);
        out.gl_Position.z = _3672;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_56.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_54.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3736 = as_type<float>(_160);
        out.gl_Position.z = _3736;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_58.x;
    float _170 = in.m_58.y;
    float _172 = in.m_58.z;
    float _174 = in.m_58.w;
    float _176 = in.m_60.x;
    float _178 = in.m_60.y;
    float _180 = in.m_60.z;
    float _182 = in.m_60.w;
    float _184 = in.m_62.x;
    float _186 = in.m_62.y;
    float _188 = in.m_62.z;
    float _190 = in.m_62.w;
    float _192 = _164 * _170;
    float _194 = fma(_162, _168, _192);
    float _196 = _164 * _178;
    float _198 = fma(_166, _172, _194);
    float _200 = _164 * _186;
    float _202 = fma(_162, _176, _196);
    float _204 = _198 + _174;
    float _206 = fma(_162, _184, _200);
    float _208 = fma(_166, _180, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _212 = fma(_166, _188, _206);
    float _214 = _208 + _182;
    float _216 = _210 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _220 = _212 + _190;
    float _222 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].x, _216);
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].x, _218);
    float _226 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].z, _222);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _234 = trunc(_230);
    int _236 = int(_234);
    float _238 = trunc(_232);
    int _240 = int(_238);
    int _242 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _244 = _236 + _242;
    int _246 = _244 + 1;
    bool _248 = _246 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _252 = _240 + _250;
    int _254 = _252 + 1;
    int _256 = _246 | _254;
    bool _258 = _256 < 0;
    bool _260 = _258 || _248;
    bool _262 = _254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _264 = _262 || _260;
    int _266 = int(_260);
    int _268 = _264 ? 2 : 0;
    int _270 = _266 | _268;
    int _272 = false ? 4 : 0;
    int _274 = _270 | _272;
    int _276 = false ? 8 : 0;
    int _278 = _274 | _276;
    int _280 = false ? 16 : 0;
    int _282 = _278 | _280;
    int _284 = false ? 32 : 0;
    int _286 = _282 | _284;
    int _288 = false ? 64 : 0;
    int _290 = _286 | _288;
    int _292 = _290 & 2;
    int _294 = 0;
    int _296 = _254;
    int _298 = _246;
    float _300 = as_type<float>(_256);
    float _302 = _176;
    float _304 = _174;
    float _306 = _204;
    if (!_264)
    {
        int _308 = _254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _310 = _308 + _246;
        _294 = _310;
    }
    int _312 = _294;
    float _314 = _190;
    if (!_264)
    {
        float _316 = floor(_232);
        _314 = _316;
    }
    float _318 = _314;
    if (!_264)
    {
        int _320 = _312 << 2;
        _296 = _320;
    }
    int _322 = _296;
    int _324 = _322;
    if (!_264)
    {
        uint _327 = uint(int(uint(_312) >> uint(2)));
        _298 = int(_327);
    }
    int _329 = _298;
    if (!_264)
    {
        int _331 = 12 & _322;
        _324 = _331;
    }
    int _333 = _324;
    if (!_264)
    {
        int _335 = _329 << 4;
        int _337 = _335 + _333;
        _300 = as_type<float>(_337);
    }
    float _339 = _300;
    float _341 = as_type<float>(_333);
    if (!_264)
    {
        float _343 = floor(_230);
        _341 = _343;
    }
    float _345 = _341;
    if (!_264)
    {
        float _347 = -_318;
        float _349 = _232 + _347;
        _302 = _349;
    }
    float _351 = _302;
    float _353 = _339;
    if (!_264)
    {
        int _355 = as_type<int>(_339) + 400;
        uint _357 = uint(int(uint(_355) >> uint(2)));
        uint _359 = uint(int(uint(int(_357)) >> uint(2)));
        int _361 = int(_357) & 3;
        float _363 = (*spvDescriptorSet0.vp_c15)._m0[int(_359)][_361];
        _353 = _363;
    }
    float _365 = _353;
    float _367 = fma(_214, 6.2500002968590706586837768554688e-05, 0.5);
    float _369 = fma(_220, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4064 = float2(_367, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    if (!_264)
    {
        float _373 = -_345;
        float _375 = _230 + _373;
        _304 = _375;
    }
    float _377 = _304;
    float _379 = _172;
    if (!_264)
    {
        float _381 = rint(_365);
        float _383 = precise::max(_381, 0.0);
        uint _385 = uint(_383);
        uint _387 = clamp(_385, 0u, 65535u);
        _379 = as_type<float>(_387);
    }
    float _389 = _379;
    float _391 = _351;
    if (!_264)
    {
        float3 _4110 = float3(_377, _351, float(as_type<int>(_389)));
        float3 _4114 = select(_4110, float3(0.0), isnan(_4110));
        float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4114.xy, uint(rint(_4114.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4114.xy, uint(rint(_4114.z)), level(0.0)).x;
        _391 = _393;
    }
    float _395 = _391;
    float _397 = -_204;
    float _399 = _397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _401 = -_214;
    float _403 = _401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _405 = -_220;
    float _407 = _405 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _399 * _399;
    float _415 = fma(_403, _403, _413);
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    float _421 = fma(_407, _407, _415);
    float _423 = rsqrt(_421);
    float _425 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _431 = float(_411);
    float _433 = -_425;
    float _435 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _433);
    float _437 = -_427;
    float _439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _437);
    float _441 = -_429;
    float _443 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _441);
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _447 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _449 = _439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _451 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _453 = -_445;
    float _455 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _453);
    float _457 = -_447;
    float _459 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _457);
    float _461 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _463 = -_451;
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _463);
    float _467 = _403 * _423;
    float _469 = _407 * _423;
    float _471 = 1.0 / _431;
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[1].w, _465);
    float _475 = _467 * _467;
    float _477 = float(_419);
    float _479 = _399 * _423;
    float _481 = _473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _483 = fma(_469, _469, _475);
    float _485 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _487 = int(_485);
    float _489 = -_461;
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _489);
    float _493 = -_449;
    float _495 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].y, _493);
    float _497 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _499 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].w, _495);
    float _501 = -_497;
    float _503 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _501);
    float _505 = rsqrt(_483);
    float _507 = _136 * _471;
    float _509 = -_481;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[0].x, _509);
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].w, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _525 = _523 != 0;
    float _527 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _511);
    float _529 = _455 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _533 = int(_531);
    float _535 = float(uint(_487));
    float _537 = -_529;
    float _539 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _537);
    float _541 = float(_487);
    float _543 = _469 * _505;
    float _545 = _467 * _505;
    float _547 = 1.0 / _477;
    float _549 = -_543;
    float _551 = _469 * _549;
    float _553 = -_543;
    float _555 = _479 * _553;
    float _557 = -_551;
    float _559 = fma(_467, _545, _557);
    float _561 = _479 * _545;
    float _563 = 1.0 / _535;
    float _565 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _539);
    float _567 = _559 * _559;
    float _569 = float(uint(_533));
    float _571 = -_565;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[0].w, _527);
    float _575 = fma(_561, _561, _567);
    float _577 = _439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _579 = trunc(_507);
    int _581 = int(_579);
    float _583 = _136 * _547;
    float _585 = fma(_555, _555, _575);
    float _587 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _589 = -_577;
    float _591 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].y, _589);
    float _593 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _595 = -_587;
    float _597 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _595);
    float _599 = rsqrt(_585);
    int _601 = as_type<int>(_563) + (-2);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[0].w, _591);
    float _605 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[0].w, _597);
    float _607 = -_593;
    float _609 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _607);
    float _611 = 1.0 / _573;
    float _613 = float(uint(_581));
    float _615 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[0].w, _609);
    int _617 = ~_487;
    int _619 = _617 + 1;
    float _621 = as_type<float>(_601) * _613;
    float _623 = 1.0 / _569;
    float _625 = _559 * _599;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    bool _629 = !_517;
    int _631 = _629 ? 0 : 1;
    float _633 = -_627;
    float _635 = _633 + 1.0;
    int _637 = abs(_631);
    float _639 = trunc(_583);
    int _641 = int(_639);
    float _643 = fma(_605, _611, -1.0);
    float _645 = _635 * _611;
    float _647 = as_type<float>(int(gl_VertexIndex));
    float _649 = fma(_635, _643, 1.0);
    float _651 = _603 * _645;
    float _653 = _615 * _645;
    int _655 = as_type<int>(_623) + (-2);
    float _657 = trunc(_621);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    int _663 = ~_533;
    int _665 = _663 + 1;
    float _667 = float(uint(_641));
    float _669 = 1.0 / _132;
    float _671 = as_type<float>(_655) * _667;
    float _673 = _649 * _649;
    float _675 = trunc(_671);
    float _677 = precise::max(_675, 0.0);
    uint _679 = uint(_677);
    float _681 = fma(_651, _651, _673);
    int _683 = _619 * int(_661);
    int _685 = _683 + _581;
    float _687 = fma(_653, _653, _681);
    float _689 = float(uint(_685));
    float _691 = rsqrt(_687);
    float _693 = as_type<float>(_601) * _689;
    int _695 = _665 * int(_679);
    int _697 = _695 + _641;
    float _699 = trunc(_693);
    float _701 = precise::max(_699, 0.0);
    uint _703 = uint(_701);
    float _705 = float(uint(_697));
    float _707 = _653 * _691;
    float _709 = _649 * _691;
    float _711 = _651 * _691;
    float _713 = -_707;
    float _715 = _467 * _713;
    float _717 = _469 * _709;
    float _719 = -_711;
    float _721 = -_715;
    float _723 = fma(_469, _719, _721);
    float _725 = -_707;
    float _727 = -_717;
    float _729 = fma(_479, _725, _727);
    float _731 = as_type<float>(_655) * _705;
    float _733 = -_711;
    float _735 = _479 * _733;
    float _737 = _723 * _723;
    float _739 = trunc(_731);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = -_735;
    float _747 = fma(_467, _709, _745);
    float _749 = fma(_729, _729, _737);
    int _751 = int(_661) + int(_703);
    int _753 = ~_533;
    int _755 = _753 + 1;
    float _757 = fma(_747, _747, _749);
    float _759 = _136 * 0.25;
    int _761 = as_type<int>(_647) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_647) & 2;
    bool _767 = _765 != 0;
    float _769 = rsqrt(_757);
    int _771 = ~_487;
    int _773 = _771 + 1;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _777 = _775 != 0;
    bool _779 = !_767;
    float _781 = _779 ? (-0.5) : 0.5;
    int _783 = _773 * _751;
    int _785 = _783 + _581;
    int _787 = int(_679) + int(_743);
    float _789 = ceil(_759);
    bool _791 = !_521;
    int _793 = _791 ? 0 : 1;
    int _795 = _755 * _787;
    int _797 = _795 + _641;
    bool _799 = uint(_785) >= uint(_487);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _729 * _769;
    float _807 = _747 * _769;
    float _809 = _723 * _769;
    bool _811 = uint(_797) >= uint(_533);
    float _813 = _469 * _805;
    float _815 = _479 * _807;
    float _817 = _467 * _809;
    bool _819 = !_763;
    float _821 = _819 ? (-0.5) : 0.5;
    float _823 = -_813;
    float _825 = fma(_467, _807, _823);
    float _827 = -_815;
    float _829 = fma(_469, _809, _827);
    float _831 = -_817;
    float _833 = fma(_479, _805, _831);
    float _835 = _789 * 0.5;
    float _837 = _825 * _825;
    float _839 = in.m_67.x;
    float _841 = in.m_67.y;
    float _843 = in.m_67.z;
    float _845 = in.m_67.w;
    bool _847 = !_777;
    int _849 = _847 ? 0 : 1;
    float _851 = floor(_835);
    float _853 = fma(_829, _829, _837);
    bool _855 = !_799;
    int _857 = _855 ? 0 : (-1);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _861 = as_type<float>(_787);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_803)
    {
        float _865 = in.m_67.x;
        _859 = _865;
    }
    float _867 = _859;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _883 = _881 != 0;
    float _885 = fma(_833, _833, _853);
    bool _887 = !_811;
    int _889 = _887 ? 0 : (-1);
    float _891 = _867;
    float _893 = as_type<float>(_889);
    if (!_803)
    {
        float _895 = in.m_67.y;
        _891 = _895;
    }
    float _897 = _891;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _901 = _899 != 0;
    float _903 = rsqrt(_885);
    bool _905 = !_871;
    int _907 = _905 ? 0 : 1;
    bool _909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.5);
    bool _917 = _913 || _915;
    float _919 = fma(_851, -2.0, _789);
    bool _921 = !_875;
    int _923 = _921 ? 0 : 1;
    float _925 = _136 * _669;
    bool _927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.5);
    bool _935 = _931 || _933;
    float _937 = _851;
    if (_803)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = in.m_69.x;
    float _943 = in.m_69.y;
    float _945 = _939;
    if (!_803)
    {
        _945 = 7.345489978790283203125;
    }
    float _947 = _945;
    float _949 = _833 * _903;
    float _951 = _829 * _903;
    float _953 = _825 * _903;
    bool _955 = !_525;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = _467 * _949;
    float _961 = _947 * _839;
    float _963 = _469 * _953;
    float _965 = _479 * _951;
    float _967 = -_959;
    float _969 = fma(_469, _951, _967);
    float _971 = floor(_961);
    float _973 = -_963;
    float _975 = fma(_479, _949, _973);
    float _977 = -_965;
    float _979 = fma(_467, _953, _977);
    float _981 = _969 * _969;
    bool _983 = _925 < 0.85000002384185791015625;
    float _985 = float(_983);
    bool _987 = _487 == 0;
    float _989 = fma(_975, _975, _981);
    float _991 = precise::max(_919, _985);
    float _993 = _985;
    float _995 = _957;
    if (_803)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = fma(_979, _979, _989);
    float _1001 = _997;
    if (!_803)
    {
        _1001 = 1.2345600128173828125;
    }
    float _1003 = _1001;
    float _1005 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1007 = _781 * _991;
    float _1009 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = _821 * _991;
    float _1013 = rsqrt(_999);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1007);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1023 = _897 * _1003;
    float _1025 = _1015 * _1017;
    float _1027 = -_971;
    float _1029 = _961 + _1027;
    float _1031 = _1019 * _1021;
    int _1033 = ~_751;
    int _1035 = _1033 + _857;
    int _1037 = _1035 + 1;
    float _1039 = _1025 * _949;
    float _1041 = float(_581);
    float _1043 = floor(_1023);
    int _1045 = abs(_849);
    int _1047 = _487 * _1037;
    int _1049 = _1047 + _581;
    bool _1051 = _1041 >= _541;
    bool _1053 = isnan(_1041);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(_541);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _979 * _1013;
    float _1065 = _1025 * _951;
    float _1067 = _975 * _1013;
    float _1069 = _1029 * _541;
    float _1071 = fma(_1031, _1063, _1039);
    float _1073 = trunc(_1061);
    int _1075 = int(_1073);
    float _1077 = fma(_1031, _1067, _1065);
    bool _1079 = !_987;
    int _1081 = _1079 ? _1049 : (-1);
    float _1083 = _220 + _1071;
    float _1085 = _204 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = _214 + _1077;
    float _1089 = _204 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1083 + _1091;
    float _1095 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1087 + _1097;
    float _1101 = trunc(_1069);
    int _1103 = int(_1101);
    float _1105 = _1093 * _1093;
    float _1107 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1089);
    float _1109 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1095);
    float _1111 = -_1043;
    float _1113 = _1023 + _1111;
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1107);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _969 * _1013;
    float _1123 = sqrt(_1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1127 = ~_1075;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _541 * _925;
    float _1135 = float(_533);
    float _1137 = _1119 + _1125;
    int _1139 = _487 + (-1);
    int _1141 = _1081 * _1131;
    float _1143 = float(_641);
    int _1145 = _1103 * _1045;
    int _1147 = _1145 + _581;
    int _1149 = abs(_793);
    float _1151 = 1.0 / _1125;
    bool _1153 = !_879;
    int _1155 = _1153 ? 0 : 1;
    int _1157 = _1075 * _1139;
    int _1159 = _1157 + _1141;
    bool _1161 = _1143 >= _1135;
    bool _1163 = isnan(_1143);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    int _1171 = _1169 ? 1065353216 : 0;
    bool _1173 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1175 = _1159 * _1149;
    float _1177 = trunc(_1133);
    int _1179 = int(_1177);
    float _1181 = _1025 * _953;
    bool _1183 = !_883;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_1031, _1121, _1181);
    int _1189 = ~_787;
    int _1191 = _1189 + _889;
    int _1193 = _1191 + 1;
    float _1195 = trunc(as_type<float>(_1171));
    int _1197 = int(_1195);
    float _1199 = _1137 * _1151;
    float _1201 = _1199 * 0.5;
    float _1203 = _204 + _1187;
    float _1205 = _1203;
    int _1207 = _1171;
    float _1209 = as_type<float>(_1149);
    if (!_1173)
    {
        _861 = _1087;
    }
    float _1211 = _861;
    int _1213 = _1179 * _637;
    int _1215 = _1213 + _1175;
    float _1217 = as_type<float>(_1179);
    float _1219 = _1211;
    if (!_1173)
    {
        _1217 = _1083;
    }
    float _1221 = _1217;
    bool _1223 = !_1173;
    float _1225 = _1221;
    float _1227 = _371;
    if (!_1223)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1123 + _1231;
        float _1235 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1115);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1249, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = _1237 * _1253;
        float _1259 = fma(_1203, _1245, _1255);
        float _1261 = fma(_1099, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1263 = fma(_1093, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1259;
        _1219 = _1261;
        _1225 = _1263;
        _1207 = as_type<int>(_1257);
        _893 = _1253;
    }
    float _1265 = _1205;
    float _1267 = _1219;
    float _1269 = _1225;
    int _1271 = _1207;
    float _1273 = _893;
    float _1275 = _1273;
    int _1277 = _1271;
    float _1279 = _1267;
    float _1281 = _1269;
    if (_935)
    {
        _1275 = _1265;
    }
    float _1283 = _1275;
    float _1285 = _1283;
    if (!_935)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _204 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _214 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_204;
        float _1299 = _1297 + _1265;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _220 + _1303;
        float _1307 = -_214;
        float _1309 = _1307 + _1267;
        float _1311 = -_220;
        float _1313 = _1311 + _1269;
        float _1315 = fma(_1293, _1293, _1301);
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1319 = fma(_1305, _1305, _1315);
        float _1321 = sqrt(_1319);
        float _1323 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = precise::min(_1321, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1327 = _1325 * _1317;
        float _1329 = _1323 * _1327;
        float _1331 = fma(_1299, _1329, _204);
        float _1333 = fma(_1309, _1329, _214);
        float _1335 = fma(_1313, _1329, _220);
        _1277 = as_type<int>(_1329);
        _1285 = _1331;
        _1279 = _1333;
        _1281 = _1335;
    }
    int _1337 = _1277;
    float _1339 = _1285;
    float _1341 = _1279;
    float _1343 = _1281;
    int _1345 = abs(as_type<int>(_957));
    bool _1347 = !_901;
    int _1349 = _1347 ? 0 : 1;
    int _1351 = _1337;
    if (_917)
    {
        _995 = 1.0;
    }
    float _1353 = _995;
    float _1355 = _1353;
    if (!_917)
    {
        float _1357 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1359 = _1357 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1367 = _1365 * 0.15915493667125701904296875;
        float _1369 = _1359 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1375 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
        float _1377 = 1.0 / _1363;
        float _1379 = _1367 * 6.283185482025146484375;
        float _1381 = cos(_1379);
        float _1383 = _1371 * _1377;
        float _1385 = 1.0 / _1375;
        float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1387;
        float _1391 = _1381 * _1383;
        float _1393 = _1367 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1391;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1401 = _1385 * _1399;
        float _1403 = 1.0 / _1389;
        float _1405 = _1395 * _1397;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = fma(_1405, _1401, _1407);
        float _1411 = _1409 * _1403;
        float _1413 = precise::clamp(_1411, 0.0, 1.0);
        _306 = _1409;
        _1351 = as_type<int>(_1403);
        _1355 = _1413;
    }
    float _1415 = _306;
    int _1417 = _1351;
    float _1419 = _1355;
    int _1421 = abs(_1349);
    float _1423 = _1415;
    int _1425 = _1417;
    if (_917)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_917)
    {
        float _1431 = as_type<float>(in.m_73.w);
        int _1433 = as_type<int>(_1431) << 24;
        int _1435 = as_type<int>(_1431) << 16;
        int _1437 = _1433 >> 24;
        int _1439 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _1441 = as_type<int>(_1431) << 8;
        int _1443 = _1435 >> 24;
        int _1445 = _1441 >> 24;
        int _1447 = as_type<int>(_1431) >> 24;
        float _1449 = float(_1443);
        float _1451 = float(_1445);
        float _1453 = float(_1447);
        float _1455 = _1449 * 0.0078740157186985015869140625;
        float _1457 = float(_1437);
        float _1459 = _1451 * 0.0078740157186985015869140625;
        bool _1461 = _1439 == 4;
        float _1463 = _1453 * 0.0078740157186985015869140625;
        float _1465 = _1457 * 0.0078740157186985015869140625;
        bool _1467 = _1439 == 8;
        bool _1469 = _1439 == 12;
        float _1471 = precise::min(_1455, 1.0);
        float _1473 = precise::min(_1459, 1.0);
        float _1475 = precise::min(_1463, 1.0);
        float _1477 = precise::min(_1465, 1.0);
        float _1479 = precise::max(_1471, -1.0);
        float _1481 = precise::max(_1473, -1.0);
        float _1483 = precise::max(_1475, -1.0);
        float _1485 = precise::max(_1477, -1.0);
        float _1487 = _1485;
        if (_1461)
        {
            _1487 = _1479;
        }
        float _1489 = _1487;
        float _1491 = _1489;
        if (_1467)
        {
            _1491 = _1481;
        }
        float _1493 = _1491;
        float _1495 = _1493;
        if (_1469)
        {
            _1495 = _1483;
        }
        float _1497 = _1495;
        float _1499 = abs(_1497);
        float _1501 = (-0.0) + _1499;
        _1429 = _1501;
    }
    float _1503 = _1429;
    int _1505 = _533 * _1193;
    int _1507 = _1505 + _641;
    bool _1509 = _533 == 0;
    int _1511 = _1147 * _1345;
    int _1513 = _1511 + _1215;
    float _1515 = _1113 * _1135;
    int _1517 = ~_1197;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1135 * _925;
    bool _1525 = !_1509;
    int _1527 = _1525 ? _1507 : (-1);
    int _1529 = _1103 * _1421;
    int _1531 = _1529 + _1513;
    int _1533 = _533 + (-1);
    float _1535 = trunc(_1515);
    int _1537 = int(_1535);
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1541 = _1539 != 0;
    int _1543 = _1527 * _1521;
    float _1545 = float(uint(_1531));
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1197 * _1533;
    int _1553 = _1551 + _1543;
    int _1555 = abs(_923);
    float _1557 = trunc(_1523);
    int _1559 = int(_1557);
    float _1561 = as_type<float>(_601) * _1545;
    int _1563 = abs(_1549);
    int _1565 = abs(_907);
    float _1567 = trunc(_1561);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1553 * _1555;
    int _1575 = abs(_1155);
    int _1577 = _1537 * _1563;
    int _1579 = _1577 + _641;
    int _1581 = ~_487;
    int _1583 = _1581 + 1;
    int _1585 = _1559 * _1565;
    int _1587 = _1585 + _1573;
    int _1589 = abs(_1185);
    int _1591 = _1579 * _1575;
    int _1593 = _1591 + _1587;
    int _1595 = ~_487;
    int _1597 = _1595 + 1;
    int _1599 = _1583 * int(_1571);
    int _1601 = _1599 + _1531;
    int _1603 = ~_533;
    int _1605 = _1603 + 1;
    int _1607 = _1537 * _1589;
    int _1609 = _1607 + _1593;
    if (_803)
    {
        _1425 = 0;
    }
    int _1611 = _1425;
    float _1613 = float(uint(_1601));
    float _1615 = float(uint(_1609));
    int _1617 = _1611;
    if (!_803)
    {
        _1617 = 1;
    }
    int _1619 = _1617;
    float _1621 = as_type<float>(_601) * _1613;
    float _1623 = abs(_371);
    bool _1625 = _1623 != 0.0;
    bool _1627 = isnan(_1623);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.0);
    bool _1633 = _1629 || _1631;
    float _1635 = as_type<float>(_655) * _1615;
    int _1637 = ~_533;
    int _1639 = _1637 + 1;
    float _1641 = trunc(_1621);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = float(uint(_1147));
    float _1655 = as_type<float>(_601) * _1653;
    int _1657 = int(_1571) + int(_1645);
    int _1659 = ~_487;
    int _1661 = _1659 + 1;
    int _1663 = _1597 * _1657;
    int _1665 = _1663 + _1531;
    int _1667 = _1605 * int(_1651);
    int _1669 = _1667 + _1609;
    bool _1671 = uint(_1665) >= uint(_487);
    float _1673 = float(uint(_1669));
    bool _1675 = !_1671;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = as_type<float>(_655) * _1673;
    int _1681 = ~_1657;
    int _1683 = _1681 + _1677;
    int _1685 = _1683 + 1;
    float _1687 = trunc(_1655);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    int _1693 = _487 * _1685;
    int _1695 = _1693 + _1531;
    float _1697 = float(uint(_1579));
    float _1699 = trunc(_1679);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    bool _1705 = !_987;
    int _1707 = _1705 ? _1695 : (-1);
    float _1709 = as_type<float>(_655) * _1697;
    int _1711 = _1707 & 3;
    bool _1713 = _1711 != 0;
    int _1715 = _1661 * int(_1691);
    int _1717 = _1715 + _1147;
    float _1719 = trunc(_1709);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_533;
    int _1727 = _1725 + 1;
    int _1729 = _1713 ? 0 : 1;
    float _1731 = float(uint(_1717));
    int _1733 = int(_1651) + int(_1703);
    int _1735 = _1707 & 3;
    bool _1737 = _1735 != 0;
    float _1739 = as_type<float>(_601) * _1731;
    int _1741 = ~_533;
    int _1743 = _1741 + 1;
    int _1745 = _1727 * _1733;
    int _1747 = _1745 + _1609;
    bool _1749 = uint(_1735) > 1u;
    bool _1751 = uint(_1735) >= 2u;
    float _1753 = trunc(_1739);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (!_1749)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1743 * int(_1723);
    int _1775 = _1773 + _1579;
    bool _1777 = uint(_1747) >= uint(_533);
    int _1779 = _1751 ? 0 : 1;
    bool _1781 = _1735 != 3;
    bool _1783 = !_1777;
    int _1785 = _1783 ? 0 : (-1);
    float _1787 = float(uint(_1775));
    bool _1789 = _845 > 0.5;
    int _1791 = ~_487;
    int _1793 = _1791 + 1;
    float _1795 = as_type<float>(_655) * _1787;
    int _1797 = ~_1733;
    int _1799 = _1797 + _1785;
    int _1801 = _1799 + 1;
    int _1803 = int(_1691) + int(_1757);
    int _1805 = _533 * _1801;
    int _1807 = _1805 + _1609;
    int _1809 = ~_1779;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = trunc(_1795);
    float _1817 = precise::max(_1815, 0.0);
    uint _1819 = uint(_1817);
    int _1821 = _1813;
    if (_1781)
    {
        int _1823 = ~_1779;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1793 * _1803;
    int _1831 = _1829 + _1147;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1835 = _1833 != 0;
    float _1837 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1839 = -_781;
    int _1841 = _1789 ? as_type<int>(_1839) : as_type<int>(_781);
    bool _1843 = !_1509;
    int _1845 = _1843 ? _1807 : (-1);
    float _1847 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1837);
    bool _1849 = uint(_1831) >= uint(_487);
    float _1851 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1853 = !_1835;
    float _1855 = _1853 ? _781 : as_type<float>(_1841);
    float _1857 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    int _1859 = _1845 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    int _1865 = _1845 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1871 = !_1849;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1877 = uint(_1859) > 1u;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = _1867 ? 0 : 1;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1885 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1887 = _1885 != 0;
    float _1889 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1891 = int(_1723) + int(_1819);
    float _1893 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1895 = ~_1881;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    float _1901 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    int _1903 = _1845 >> 31;
    float _1905 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    int _1907 = _1639 * _1891;
    int _1909 = _1907 + _1579;
    float _1911 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1901);
    int _1913 = _1899;
    float _1915 = as_type<float>(_1903);
    if (!_1877)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1913 = _1919;
    }
    int _1921 = _1913;
    float _1923 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1905);
    float _1927 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1929 = uint(_1859) >= 2u;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1935 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1875);
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    float _1957 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1949);
    int _1959 = _1707 >> 31;
    float _1961 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1951);
    int _1963 = _1929 ? 0 : 1;
    int _1965 = _1959 & 3;
    int _1967 = _1903 & 3;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1961;
    float _1969 = _1939;
    float _1971 = _1955;
    float _1973 = _1953;
    float _1975 = _1957;
    if (_1633)
    {
        _1915 = _1961;
    }
    float _1977 = _1915;
    float _1979 = _1977;
    if (!_1633)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    if (!_1633)
    {
        out.gl_Position.w = 0.0;
    }
    bool _1983 = _292 != 0;
    bool _1985 = _1859 != 3;
    int _1987 = ~_1963;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1707 + _1965;
    int _1995 = _1845 + _1967;
    int _1997 = _1991;
    if (_1983)
    {
        _1227 = _1981;
    }
    float _1999 = _1227;
    float _2001 = _1999;
    if (_1985)
    {
        int _2003 = ~_1963;
        int _2005 = _2003 + 1;
        _1997 = _2005;
    }
    int _2007 = _1997;
    bool _2009 = uint(_1909) >= uint(_533);
    if (!_1983)
    {
        int _2011 = _312 << 4;
        int _2013 = _2011 + 2048;
        uint _2015 = uint(int(uint(_2013) >> uint(2)));
        uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
        int _2019 = int(_2015) & 3;
        float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
        int _2023 = int(_2015) + 1;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        int _2027 = _2023 & 3;
        float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
        int _2031 = _2013 + 8;
        uint _2033 = uint(int(uint(_2031) >> uint(2)));
        uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
        int _2037 = int(_2033) & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = int(_2033) + 1;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        int _2045 = _2041 & 3;
        float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
        float _2049 = _210 * _2029;
        float _2051 = fma(_214, _2021, _2049);
        float _2053 = fma(_220, _2039, _2051);
        float _2055 = _2053 + _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + _395;
        float _2063 = fma(_2061, 500.0, 1.5);
        float _2065 = exp2(_2063);
        float _2067 = 0.0 + _2065;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        bool _2071 = _2069 >= 1.0;
        bool _2073 = isnan(_2069);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan(1.0);
        bool _2079 = _2075 || _2077;
        float _2081 = _2069;
        if (!_2079)
        {
            out.gl_Position.w = 0.0;
        }
        if (_2079)
        {
            _2081 = _1981;
        }
        float _2083 = _2081;
        _2001 = _2083;
        if (!_2079)
        {
            _2001 = 0.0;
        }
    }
    float _2085 = _2001;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1339 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1341 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1343 + _2095;
    float _2099 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2089 * _2089;
    float _2103 = 1.0 / _2085;
    int _2105 = _1993 >> 2;
    float _2107 = fma(_2093, _2093, _2101);
    int _2109 = _1995 >> 2;
    int _2111 = _2105 << 4;
    int _2113 = _2111 + 368;
    float _2115 = fma(_2097, _2097, _2107);
    int _2117 = _2109 << 4;
    int _2119 = _2117 + 512;
    float _2121 = rsqrt(_2115);
    float _2123 = sqrt(_2115);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2127 = _2093 * _2125;
    float _2129 = _2097 * _2125;
    float _2131 = _2127 * _2127;
    float _2133 = _2129 * _2129;
    float _2135 = _2131 + _2133;
    float _2137 = sqrt(_2135);
    bool _2139 = _2137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2143 = _2137 + _2141;
    float _2145 = _214;
    float _2147 = _2135;
    float _2149 = _2143;
    float _2151 = _2089;
    float _2153 = _2127;
    float _2155 = _2129;
    float _2157 = _2131;
    float _2159 = _2133;
    if (_2139)
    {
        float _2161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2161;
    }
    float _2163 = _2145;
    if (_2139)
    {
        float _2165 = rsqrt(_2135);
        _2147 = _2165;
    }
    float _2167 = _2147;
    if (_2139)
    {
        float _2169 = _2143 * _2163;
        _2149 = _2169;
    }
    float _2171 = _2149;
    if (_2139)
    {
        float _2173 = _2171 * 0.15915493667125701904296875;
        _1969 = _2173;
    }
    float _2175 = _1969;
    float _2177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2179 = _1981;
    if (_2139)
    {
        float _2181 = _2175 * 6.283185482025146484375;
        float _2183 = sin(_2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = precise::max(0.0, _2177);
    float _2189 = _2171;
    float _2191 = _2187;
    if (_2139)
    {
        float _2193 = _2175 * 6.283185482025146484375;
        float _2195 = cos(_2193);
        _2189 = _2195;
    }
    float _2197 = _2189;
    float _2199 = -_2125;
    float _2201 = -_2187;
    float _2203 = fma(_2089, _2199, _2201);
    if (_2139)
    {
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2151 = _2205;
    }
    float _2207 = _2151;
    float _2209 = _2207;
    if (_2139)
    {
        float _2211 = fma(_2185, _2207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2139)
    {
        float _2217 = _2167 * _2213;
        _1209 = _2217;
    }
    float _2219 = _1209;
    if (!_2139)
    {
        _2215 = _2203;
    }
    float _2221 = _2215;
    float _2223 = _2221;
    if (_2139)
    {
        float _2225 = _2197 + (-1.0);
        _2191 = _2225;
    }
    float _2227 = _2191;
    float _2229 = _2227;
    if (_2139)
    {
        float _2231 = _2127 * _2219;
        _2153 = _2231;
    }
    float _2233 = _2153;
    if (_2139)
    {
        float _2235 = _2129 * _2219;
        _2155 = _2235;
    }
    float _2237 = _2155;
    if (_2139)
    {
        float _2239 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2239;
    }
    float _2241 = _2229;
    if (_2139)
    {
        float _2243 = _2233 * _2233;
        _2157 = _2243;
    }
    float _2245 = _2157;
    if (_2139)
    {
        float _2247 = _2237 * _2237;
        _2159 = _2247;
    }
    float _2249 = _2159;
    if (_2139)
    {
        float _2251 = fma(_2203, _2197, _2241);
        _2223 = _2251;
    }
    float _2253 = _2223;
    bool _2255 = _839 > 0.5;
    float _2257 = fma(_2253, _2253, _2245);
    float _2259 = -_821;
    int _2261 = _2255 ? as_type<int>(_2259) : as_type<int>(_821);
    bool _2263 = _1503 != 0.0;
    bool _2265 = isnan(_1503);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    float _2273 = _2257 + _2249;
    bool _2275 = !_1887;
    float _2277 = _2275 ? _821 : as_type<float>(_2261);
    bool _2279 = _841 > 0.5;
    float _2281 = rsqrt(_2273);
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = _2289 + 1.0;
    if (!_2271)
    {
        _1971 = 0.0;
        _1973 = 0.0;
    }
    float _2293 = _1971;
    float _2295 = _1973;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2103 * _2293;
    float _2303 = _2281 * _2233;
    float _2305 = _2281 * _2253;
    float _2307 = _2281 * _2237;
    float _2309 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2311 = -_2309;
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2311);
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2317 = -_2307;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2313);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2319, -0.5, 0.5);
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2329 = fma(_2325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2331 = -_2099;
    float _2333 = fma(_2331, _2327, 1.0);
    float _2335 = sqrt(_2323);
    float _2337 = _2305 + 1.0;
    float _2339 = fma(_2325, _2329, -0.212114393711090087890625);
    float _2341 = fma(_2301, -0.5, 0.5);
    float _2343 = fma(_2325, _2339, 1.570728778839111328125);
    float _2345 = _2103 * _2295;
    float _2347 = log2(_2333);
    float _2349 = -_2305;
    float _2351 = fma(_2321, _2337, _2349);
    uint _2353 = uint(int(uint(_2113) >> uint(2)));
    uint _2355 = uint(int(uint(int(_2353)) >> uint(2)));
    int _2357 = int(_2353) & 3;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[int(_2355)][_2357];
    int _2361 = int(_2353) + 1;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    int _2365 = _2361 & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    float _2369 = fma(_2345, 0.5, 0.5);
    float _2371 = -_781;
    int _2373 = _2279 ? as_type<int>(_2371) : as_type<int>(_781);
    float _2375 = fma(_2351, 0.5, 0.5);
    int _2377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2379 = _2377 != 0;
    float _2381 = _2335 * 0.636619746685028076171875;
    float _2383 = -_2343;
    float _2385 = fma(_2381, _2383, 1.0);
    float _2387 = _2347 * 0.693147182464599609375;
    float _2389 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7062 = float3(_2369, _2341, _2389);
    float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7062, float3(0.0), isnan(_7062)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7062, float3(0.0), isnan(_7062)), level(0.0)).x;
    float3 _7071 = float3(_2369, _2341, _2389);
    float4 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7071, float3(0.0), isnan(_7071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7071, float3(0.0), isnan(_7071)), level(0.0)).xyzw;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = _2394.w;
    float2 _7087 = float2(_2385, _2375);
    float3 _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7087, float2(0.0), isnan(_7087)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7087, float2(0.0), isnan(_7087)), level(0.0)).xyz;
    float _2408 = _2406.x;
    float _2410 = _2406.y;
    float _2412 = _2406.z;
    uint _2414 = uint(int(uint(_2119) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    bool _2430 = !_2379;
    float _2432 = _2430 ? _781 : as_type<float>(_2373);
    float _2434 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2436 = !_1737;
    int _2438 = _2436 ? 0 : 1;
    float _2440 = _841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2442 = !_1861;
    int _2444 = _2442 ? 0 : 1;
    float _2446 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2448 = _1735 != 3;
    out.m_75.x = _1067;
    out.m_75.y = _1121;
    out.m_75.z = _1063;
    bool _2450 = _1859 != 3;
    float _2452 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2454 = _2113 + 8;
    uint _2456 = uint(int(uint(_2454) >> uint(2)));
    uint _2458 = uint(int(uint(int(_2456)) >> uint(2)));
    int _2460 = int(_2456) & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = int(_2456) + 1;
    uint _2466 = uint(int(uint(_2464) >> uint(2)));
    int _2468 = _2464 & 3;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[int(_2466)][_2468];
    bool _2472 = _1619 != 1;
    out.m_77.x = _1341;
    out.m_77.y = _1339;
    out.m_77.z = _1343;
    float _2474 = exp2(_2452);
    bool _2476 = !_2009;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2119 + 8;
    uint _2482 = uint(int(uint(_2480) >> uint(2)));
    uint _2484 = uint(int(uint(int(_2482)) >> uint(2)));
    int _2486 = int(_2482) & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = int(_2482) + 1;
    uint _2492 = uint(int(uint(_2490) >> uint(2)));
    int _2494 = _2490 & 3;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[int(_2492)][_2494];
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2500 = _843 > 0.5;
    bool _2502 = !_2448;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = -_2498;
    float _2508 = fma(_2434, 2.0, _2506);
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2512 = !_2450;
    float _2514 = _2512 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2516 = -_821;
    int _2518 = _2500 ? as_type<int>(_2516) : as_type<int>(_821);
    float _2520 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2510);
    int _2522 = abs(_1771);
    float _2524 = -_136;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2508);
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2530 = _2528 != 0;
    float _2532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2520);
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2540 = _2538 != 0;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _2544 = _2514;
    if (!_2472)
    {
        _863 = _841;
    }
    float _2546 = _863;
    float _2548 = _2546;
    if (!_2472)
    {
        _2542 = _841;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2472)
    {
        _2548 = _839;
    }
    float _2554 = _2548;
    if (_2472)
    {
        _2552 = _839;
    }
    float _2556 = _2552;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2560 = abs(_2438);
    float _2562 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2564 = int(_2562);
    int _2566 = ~_1803;
    int _2568 = _2566 + _1873;
    int _2570 = _2568 + 1;
    int _2572 = abs(_1921);
    int _2574 = ~_2522;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _487 * _2570;
    int _2582 = _2580 + _1147;
    int _2584 = ~_1891;
    int _2586 = _2584 + _2478;
    int _2588 = _2586 + 1;
    int _2590 = _2578 * as_type<int>(_2367);
    int _2592 = ~_2572;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = abs(_2444);
    int _2600 = _533 * _2588;
    int _2602 = _2600 + _1579;
    int _2604 = ~_2560;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2596 * as_type<int>(_2428);
    int _2612 = abs(_1827);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2608 * as_type<int>(_2359);
    int _2622 = _2620 + _2590;
    int _2624 = abs(_2504);
    float _2626 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2628 = int(_2626);
    int _2630 = ~_2612;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2420);
    int _2638 = _2636 + _2610;
    int _2640 = abs(_2007);
    int _2642 = ~_2624;
    int _2644 = _2642 + 1;
    int _2646 = _2644 + 1;
    int _2648 = _2634 * as_type<int>(_2462);
    int _2650 = _2648 + _2622;
    int _2652 = abs(as_type<int>(_2514));
    int _2654 = ~_2640;
    int _2656 = _2654 + 1;
    int _2658 = _2656 + 1;
    int _2660 = _2646 * as_type<int>(_2470);
    int _2662 = _2660 + _2650;
    float _2664 = float(uint(_2564));
    bool _2666 = !_2530;
    int _2668 = _2666 ? 0 : 1;
    int _2670 = _2658 * as_type<int>(_2488);
    int _2672 = _2670 + _2638;
    int _2674 = ~_2652;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    int _2680 = abs(_2668);
    float _2682 = 1.0 / _2664;
    float _2684 = float(uint(_2628));
    int _2686 = _2678 * as_type<int>(_2496);
    int _2688 = _2686 + _2672;
    int _2690 = ~_2680;
    int _2692 = _2690 + 1;
    int _2694 = _2692 + 1;
    bool _2696 = !_2536;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = abs(_2564);
    int _2702 = _2662 * _2694;
    bool _2704 = !_987;
    int _2706 = _2704 ? _2582 : (-1);
    float _2708 = 1.0 / _2684;
    int _2710 = abs(_2698);
    float _2712 = float(uint(_2700));
    int _2714 = _2706 * _2680;
    int _2716 = _2714 + _2702;
    int _2718 = ~_2710;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = abs(_2628);
    float _2726 = 1.0 / _2712;
    bool _2728 = !_1509;
    int _2730 = _2728 ? _2602 : (-1);
    int _2732 = _2688 * _2722;
    int _2734 = as_type<int>(_2682) + (-2);
    float _2736 = float(uint(_2716));
    int _2738 = _2730 * _2710;
    int _2740 = _2738 + _2732;
    float _2742 = float(uint(_2724));
    int _2744 = as_type<int>(_2708) + (-2);
    float _2746 = as_type<float>(_2734) * _2736;
    float _2748 = float(uint(_2740));
    float _2750 = 1.0 / _2742;
    int _2752 = abs(_2716);
    float _2754 = as_type<float>(_2744) * _2748;
    int _2756 = as_type<int>(_2726) + (-2);
    float _2758 = float(uint(_2752));
    float _2760 = trunc(_2746);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    int _2766 = abs(_2740);
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2770 = ~_2564;
    int _2772 = _2770 + 1;
    float _2774 = as_type<float>(_2756) * _2758;
    float _2776 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2768);
    float _2778 = trunc(_2754);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    float _2784 = _2768;
    if (!_2472)
    {
        _2784 = _843;
    }
    float _2786 = _2784;
    float _2788 = _2786;
    if (!_2472)
    {
        _2544 = _843;
    }
    float _2790 = _2544;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2794 = as_type<int>(_2750) + (-2);
    float _2796 = float(uint(_2766));
    int _2798 = _2772 * int(_2764);
    int _2800 = _2798 + _2716;
    int _2802 = ~_2628;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2774);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = _2790;
    if (_2472)
    {
        _2788 = _841;
    }
    float _2814 = _2788;
    float _2816 = as_type<float>(_2794) * _2796;
    if (_2472)
    {
        _2812 = _841;
    }
    float _2818 = _2812;
    float _2820 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2792);
    float _2822 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2824 = float(uint(_2800));
    float _2826 = trunc(_2816);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    int _2832 = _2804 * int(_2782);
    int _2834 = _2832 + _2740;
    float _2836 = as_type<float>(_2734) * _2824;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2840 = float(uint(_2834));
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2844 = ~int(_2810);
    int _2846 = _2844 + 1;
    float _2848 = trunc(_2836);
    float _2850 = precise::max(_2848, 0.0);
    uint _2852 = uint(_2850);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2838);
    float _2856 = as_type<float>(_2744) * _2840;
    float _2858 = -_2842;
    float _2860 = fma(_2558, 2.0, _2858);
    int _2862 = _2846 * _2700;
    int _2864 = _2862 + _2752;
    float _2866 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2868 = ~int(_2830);
    int _2870 = _2868 + 1;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2874 = trunc(_2856);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    float _2880 = float(uint(_2864));
    float _2882 = fma(_2866, _2866, 1.0);
    int _2884 = _2870 * _2724;
    int _2886 = _2884 + _2766;
    int _2888 = ~_2628;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2440, -2.0, _2872);
    float _2894 = as_type<float>(_2756) * _2880;
    float _2896 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2776);
    int _2898 = int(_2764) + int(_2852);
    float _2900 = rsqrt(_2882);
    float _2902 = float(uint(_2886));
    float _2904 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2820);
    int _2906 = ~_2564;
    int _2908 = _2906 + 1;
    float _2910 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2892);
    bool _2912 = !_2540;
    float _2914 = _2912 ? _821 : as_type<float>(_2518);
    float _2916 = as_type<float>(_2794) * _2902;
    int _2918 = int(_2782) + int(_2878);
    float _2920 = trunc(_2894);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2854);
    bool _2928 = _2628 == 0;
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2936 = -_2926;
    float _2938 = _2936 + 1.0;
    float _2940 = trunc(_2916);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = _2866 * _2900;
    float _2948 = _2866 * _951;
    float _2950 = fma(_2822, -2.0, _2934);
    float _2952 = -_136;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2860);
    float _2956 = -_467;
    float _2958 = _2946 * _2956;
    float _2960 = -_469;
    float _2962 = _2946 * _2960;
    float _2964 = -_479;
    float _2966 = _2946 * _2964;
    int _2968 = int(_2810) + int(_2924);
    float _2970 = fma(_2900, _951, _2958);
    float _2972 = fma(_2900, _949, _2962);
    float _2974 = fma(_2900, _953, _2966);
    int _2976 = _2890 * _2918;
    int _2978 = _2976 + _2740;
    float _2980 = _2866 * _953;
    float _2982 = _2866 * _949;
    int _2984 = ~_2968;
    int _2986 = _2984 + 1;
    int _2988 = _2908 * _2898;
    int _2990 = _2988 + _2716;
    int _2992 = int(_2830) + int(_2944);
    out.m_79.x = _2970;
    out.m_79.y = _2974;
    out.m_79.z = _2972;
    bool _2994 = uint(_2978) >= uint(_2628);
    float _2996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2998 = ~_2992;
    int _3000 = _2998 + 1;
    float _3002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2950);
    bool _3004 = uint(_2990) >= uint(_2564);
    float _3006 = fma(_2446, _1121, _2980);
    float _3008 = fma(_2446, _1063, _2982);
    bool _3010 = !_3004;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = _479 + _3006;
    bool _3016 = _2564 == 0;
    float _3018 = _469 + _3008;
    float _3020 = fma(_2446, _1067, _2948);
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3024 = !_2994;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = _2986 * _2700;
    int _3030 = _3028 + _2752;
    int _3032 = ~_2898;
    int _3034 = _3032 + _3012;
    int _3036 = _3034 + 1;
    int _3038 = _3000 * _2724;
    int _3040 = _3038 + _2766;
    int _3042 = ~_2918;
    int _3044 = _3042 + _3026;
    int _3046 = _3044 + 1;
    float _3048 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3050 = uint(_3030) >= uint(_2700);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3054 = _2716 ^ _2564;
    int _3056 = _2628 * _3046;
    int _3058 = _3056 + _2740;
    bool _3060 = uint(_3040) >= uint(_2724);
    int _3062 = _2564 * _3036;
    int _3064 = _3062 + _2716;
    int _3066 = _2740 ^ _2628;
    bool _3068 = !_3050;
    int _3070 = _3068 ? 0 : (-1);
    float _3072 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3074 = !_3060;
    int _3076 = _3074 ? 0 : (-1);
    uint _3078 = uint(int(uint(_3054) >> uint(31)));
    uint _3080 = uint(int(uint(_3066) >> uint(31)));
    int _3082 = ~_3070;
    int _3084 = _2968 + _3082;
    int _3086 = _3084 + 1;
    float _3088 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3090 = _2628 == 0;
    int _3092 = ~_3076;
    int _3094 = _2992 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = ~int(_3078);
    int _3102 = _3100 + 1;
    int _3104 = ~int(_3080);
    int _3106 = _3104 + 1;
    bool _3108 = !_2928;
    int _3110 = _3108 ? _3058 : (-1);
    bool _3112 = !_3016;
    int _3114 = _3112 ? _3064 : (-1);
    int _3116 = _3086 ^ _3102;
    int _3118 = _3096 ^ _3106;
    float _3120 = float(_3110);
    float _3122 = float(_3114);
    bool _3124 = _2564 == 0;
    float _3126 = fma(_3088, _3120, _2954);
    int _3128 = ~_3102;
    int _3130 = _3128 + _3116;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3048, _3122, _2526);
    int _3136 = ~_3106;
    int _3138 = _3136 + _3118;
    int _3140 = _3138 + 1;
    float _3142 = _2277 + 0.5;
    bool _3144 = !_3124;
    int _3146 = _3144 ? _3132 : (-1);
    float _3148 = _2914 + 0.5;
    bool _3150 = !_3090;
    int _3152 = _3150 ? _3140 : (-1);
    float _3154 = fma(_3048, _3142, _3134);
    float _3156 = float(_3146);
    float _3158 = _1957 + _1961;
    float _3160 = float(_3152);
    float _3162 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3164 = _1855 + (-0.5);
    float _3166 = -_2910;
    float _3168 = fma(_3072, _3156, _3166);
    float _3170 = _2432 + (-0.5);
    float _3172 = -_3002;
    float _3174 = fma(_3162, _3160, _3172);
    if (!_2271)
    {
        _1975 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3176 = _1975;
    float _3178 = fma(_3088, _3148, _3126);
    float _3180 = -_3162;
    float _3182 = fma(_3180, _3164, _3174);
    float _3184 = -_2474;
    float _3186 = _3184 + 1.0;
    float _3188 = -_3072;
    float _3190 = fma(_3188, _3170, _3168);
    float _3192 = -_2896;
    float _3194 = _3192 + 1.0;
    int _3196 = as_type<int>(_3176);
    float _3198 = _3186;
    float _3200 = 0.0;
    if (!_2271)
    {
        float _3202 = _3176 * 5.0;
        _3196 = as_type<int>(_3202);
    }
    int _3204 = _3196;
    float _3206 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = fma(_2432, _3194, _3190);
    float _3210 = _467 + _3020;
    float _3212 = _1419 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3214 = as_type<float>(_3204);
    float _3216 = _3208;
    if (!_2271)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8293 = as_type<float>(_3204);
        out.gl_Position.z = _8293;
    }
    float _3218 = _3158 * 0.5;
    bool _3220 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_2123);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3212 * _1503;
    out.m_81.x = _3210;
    out.m_81.y = _3014;
    out.m_81.z = _3018;
    float _3232 = -_2532;
    float _3234 = _3232 + 1.0;
    float _3236 = -_2932;
    float _3238 = fma(_2914, _3236, _3178);
    float _3240 = fma(_1855, _2938, _3182);
    out.m_83.z = _3218;
    out.m_83.w = _1961;
    float _3242 = -_3234;
    float _3244 = fma(_2277, _3242, _3154);
    float _3246 = _3206 * _2391;
    float _3248 = -_3206;
    float _3250 = _3248 + 1.0;
    out.m_85.x = _3244;
    out.m_85.y = _3208;
    out.m_85.z = _3238;
    out.m_85.w = _3240;
    float _3252 = _3246;
    float _3254 = _3244;
    if (!_3228)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3256 = _3198;
    float _3258 = _2402 * _3246;
    float _3260 = _2412 * _3246;
    float _3262 = _2402 * _3250;
    float _3264 = _3258;
    float _3266 = _3256;
    float _3268 = _3256;
    if (!_3228)
    {
        _3214 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3214;
    float _3272 = fma(_2408, _3258, _2396);
    float _3274 = fma(_2410, _3258, _2398);
    float _3276 = fma(_2402, _3260, _2400);
    float _3278 = _3270;
    float _3280 = _3270;
    if (!_3228)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _3200;
    float _3284 = _3282;
    float _3286 = _3282;
    if (!_3228)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3288 = _3252;
    out.m_87.x = _3272;
    out.m_87.y = _3274;
    out.m_87.z = _3276;
    out.m_87.w = _3262;
    float _3290 = _3288;
    float _3292 = _3288;
    if (_2271)
    {
        _3216 = _3230;
    }
    float _3294 = _3216;
    float _3296 = _3294;
    if (!_2271)
    {
        _3296 = 0.0;
    }
    float _3298 = _3296;
    if (!_3228)
    {
        _3254 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3300 = _3254;
    float _3302 = _3300;
    float _3304 = _3300;
    if (!_3228)
    {
        _3264 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3306 = _3264;
    bool _3308 = !_3228;
    float _3310 = _3306;
    float _3312 = _3306;
    if (!_3308)
    {
        bool _3314 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3316 = isnan(_2123);
        bool _3318 = _3314 || _3316;
        bool _3320 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3322 = _3318 || _3320;
        if (!_3322)
        {
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3326 = _2123 + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3330 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3328;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3340 = 1.0 / _3330;
            float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3354 = _3326 * _3340;
            float _3356 = precise::clamp(_3354, 0.0, 1.0);
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3362 = fma(_3356, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3364 = fma(_3356, _3338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3366 = fma(_3356, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3368 = fma(_3356, _3344, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3370 = fma(_3356, _3348, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3372 = fma(_3356, _3352, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3292 = _3362;
            _3268 = _3370;
            _3286 = _3364;
            _3304 = _3368;
            _3312 = _3366;
            _3280 = _3372;
            _3374 = true;
        }
        else
        {
            bool _3376 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3378 = isnan(_2123);
            bool _3380 = _3376 || _3378;
            bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3384 = _3380 || _3382;
            if (!_3384)
            {
                _3302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3302;
            _3304 = _3386;
            if (!_3384)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3266;
            _3268 = _3388;
            if (!_3384)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3278;
            _3280 = _3390;
            if (!_3384)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3284;
            _3286 = _3392;
            if (!_3384)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3290;
            _3292 = _3394;
            if (!_3384)
            {
                _3310 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3310;
            bool _3398 = !_3384;
            _3312 = _3396;
            if (!_3398)
            {
                bool _3400 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3402 = isnan(_2123);
                bool _3404 = _3400 || _3402;
                bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3408 = _3404 || _3406;
                if (!_3408)
                {
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3412 = _2123 + _3410;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3416 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3414;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3426 = 1.0 / _3416;
                    float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3432 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3440 = _3412 * _3426;
                    float _3442 = precise::clamp(_3440, 0.0, 1.0);
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3448 = fma(_3442, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3450 = fma(_3442, _3424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3452 = fma(_3442, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3454 = fma(_3442, _3430, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3456 = fma(_3442, _3434, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3458 = fma(_3442, _3438, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3292 = _3448;
                    _3268 = _3456;
                    _3286 = _3450;
                    _3304 = _3454;
                    _3312 = _3452;
                    _3280 = _3458;
                    _3374 = true;
                }
                else
                {
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3312 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3374 = false;
    float _3460 = _3292;
    float _3462 = _3268;
    float _3464 = _3286;
    float _3466 = _3304;
    float _3468 = _3312;
    float _3470 = _3280;
    float _3472 = fma(_3014, -0.5, 0.5);
    float _3474 = precise::clamp(_3472, 0.0, 1.0);
    float _3476 = -_3460;
    float _3478 = _3462 + _3476;
    float _3480 = _3298 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3482 = -_3464;
    float _3484 = _3466 + _3482;
    float _3486 = fma(_3474, _3478, _3460);
    out.m_89.w = _3480;
    float _3488 = fma(_3474, _3484, _3464);
    float _3490 = -_3468;
    float _3492 = _3470 + _3490;
    float _3494 = _3486 * 0.586610972881317138671875;
    out.m_54.x = 1.0;
    bool _3496 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3498 = fma(_3474, _3492, _3468);
    float _3500 = fma(_3488, 0.298911988735198974609375, _3494);
    bool _3502 = _1419 > 0.0;
    bool _3504 = isnan(_1419);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(0.0);
    bool _3510 = _3506 || _3508;
    float _3512 = fma(_3498, 0.114477999508380889892578125, _3500);
    out.m_91.x = 0.0;
    float _3514 = -_3512;
    float _3516 = _3488 + _3514;
    float _3518 = -_3512;
    float _3520 = _3486 + _3518;
    float _3522 = -_3512;
    float _3524 = _3498 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    bool _3532 = !_3496;
    if (!_3532)
    {
        float _3534 = -_1339;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_1341;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_1343;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3014 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3018, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3610;
        out.m_91.y = _3612;
        out.m_91.z = _3614;
    }
    out.m_93.x = _3526;
    out.m_93.y = _3528;
    out.m_93.z = _3530;
    if (_3510)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_54.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_51.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_54.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3672 = as_type<float>(_126);
        out.gl_Position.z = _3672;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_56.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_54.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3736 = as_type<float>(_160);
        out.gl_Position.z = _3736;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_58.x;
    float _170 = in.m_58.y;
    float _172 = in.m_58.z;
    float _174 = in.m_58.w;
    float _176 = in.m_60.x;
    float _178 = in.m_60.y;
    float _180 = in.m_60.z;
    float _182 = in.m_60.w;
    float _184 = in.m_62.x;
    float _186 = in.m_62.y;
    float _188 = in.m_62.z;
    float _190 = in.m_62.w;
    float _192 = _164 * _170;
    float _194 = fma(_162, _168, _192);
    float _196 = _164 * _178;
    float _198 = fma(_166, _172, _194);
    float _200 = _164 * _186;
    float _202 = fma(_162, _176, _196);
    float _204 = _198 + _174;
    float _206 = fma(_162, _184, _200);
    float _208 = fma(_166, _180, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _212 = fma(_166, _188, _206);
    float _214 = _208 + _182;
    float _216 = _210 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _220 = _212 + _190;
    float _222 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].x, _216);
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].x, _218);
    float _226 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].z, _222);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _234 = trunc(_230);
    int _236 = int(_234);
    float _238 = trunc(_232);
    int _240 = int(_238);
    int _242 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _244 = _236 + _242;
    int _246 = _244 + 1;
    bool _248 = _246 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _252 = _240 + _250;
    int _254 = _252 + 1;
    int _256 = _246 | _254;
    bool _258 = _256 < 0;
    bool _260 = _258 || _248;
    bool _262 = _254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _264 = _262 || _260;
    int _266 = int(_260);
    int _268 = _264 ? 2 : 0;
    int _270 = _266 | _268;
    int _272 = false ? 4 : 0;
    int _274 = _270 | _272;
    int _276 = false ? 8 : 0;
    int _278 = _274 | _276;
    int _280 = false ? 16 : 0;
    int _282 = _278 | _280;
    int _284 = false ? 32 : 0;
    int _286 = _282 | _284;
    int _288 = false ? 64 : 0;
    int _290 = _286 | _288;
    int _292 = _290 & 2;
    int _294 = 0;
    int _296 = _254;
    int _298 = _246;
    float _300 = as_type<float>(_256);
    float _302 = _176;
    float _304 = _174;
    float _306 = _204;
    if (!_264)
    {
        int _308 = _254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _310 = _308 + _246;
        _294 = _310;
    }
    int _312 = _294;
    float _314 = _190;
    if (!_264)
    {
        float _316 = floor(_232);
        _314 = _316;
    }
    float _318 = _314;
    if (!_264)
    {
        int _320 = _312 << 2;
        _296 = _320;
    }
    int _322 = _296;
    int _324 = _322;
    if (!_264)
    {
        uint _327 = uint(int(uint(_312) >> uint(2)));
        _298 = int(_327);
    }
    int _329 = _298;
    if (!_264)
    {
        int _331 = 12 & _322;
        _324 = _331;
    }
    int _333 = _324;
    if (!_264)
    {
        int _335 = _329 << 4;
        int _337 = _335 + _333;
        _300 = as_type<float>(_337);
    }
    float _339 = _300;
    float _341 = as_type<float>(_333);
    if (!_264)
    {
        float _343 = floor(_230);
        _341 = _343;
    }
    float _345 = _341;
    if (!_264)
    {
        float _347 = -_318;
        float _349 = _232 + _347;
        _302 = _349;
    }
    float _351 = _302;
    float _353 = _339;
    if (!_264)
    {
        int _355 = as_type<int>(_339) + 400;
        uint _357 = uint(int(uint(_355) >> uint(2)));
        uint _359 = uint(int(uint(int(_357)) >> uint(2)));
        int _361 = int(_357) & 3;
        float _363 = (*spvDescriptorSet0.vp_c15)._m0[int(_359)][_361];
        _353 = _363;
    }
    float _365 = _353;
    float _367 = fma(_214, 6.2500002968590706586837768554688e-05, 0.5);
    float _369 = fma(_220, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4064 = float2(_367, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    if (!_264)
    {
        float _373 = -_345;
        float _375 = _230 + _373;
        _304 = _375;
    }
    float _377 = _304;
    float _379 = _172;
    if (!_264)
    {
        float _381 = rint(_365);
        float _383 = precise::max(_381, 0.0);
        uint _385 = uint(_383);
        uint _387 = clamp(_385, 0u, 65535u);
        _379 = as_type<float>(_387);
    }
    float _389 = _379;
    float _391 = _351;
    if (!_264)
    {
        float3 _4110 = float3(_377, _351, float(as_type<int>(_389)));
        float3 _4114 = select(_4110, float3(0.0), isnan(_4110));
        float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4114.xy, uint(rint(_4114.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4114.xy, uint(rint(_4114.z)), level(0.0)).x;
        _391 = _393;
    }
    float _395 = _391;
    float _397 = -_204;
    float _399 = _397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _401 = -_214;
    float _403 = _401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _405 = -_220;
    float _407 = _405 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _399 * _399;
    float _415 = fma(_403, _403, _413);
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    float _421 = fma(_407, _407, _415);
    float _423 = rsqrt(_421);
    float _425 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _431 = float(_411);
    float _433 = -_425;
    float _435 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _433);
    float _437 = -_427;
    float _439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _437);
    float _441 = -_429;
    float _443 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _441);
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _447 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _449 = _439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _451 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _453 = -_445;
    float _455 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _453);
    float _457 = -_447;
    float _459 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _457);
    float _461 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _463 = -_451;
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _463);
    float _467 = _403 * _423;
    float _469 = _407 * _423;
    float _471 = 1.0 / _431;
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[1].w, _465);
    float _475 = _467 * _467;
    float _477 = float(_419);
    float _479 = _399 * _423;
    float _481 = _473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _483 = fma(_469, _469, _475);
    float _485 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _487 = int(_485);
    float _489 = -_461;
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _489);
    float _493 = -_449;
    float _495 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].y, _493);
    float _497 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _499 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].w, _495);
    float _501 = -_497;
    float _503 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _501);
    float _505 = rsqrt(_483);
    float _507 = _136 * _471;
    float _509 = -_481;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[0].x, _509);
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].w, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _525 = _523 != 0;
    float _527 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _511);
    float _529 = _455 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _533 = int(_531);
    float _535 = float(uint(_487));
    float _537 = -_529;
    float _539 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _537);
    float _541 = float(_487);
    float _543 = _469 * _505;
    float _545 = _467 * _505;
    float _547 = 1.0 / _477;
    float _549 = -_543;
    float _551 = _469 * _549;
    float _553 = -_543;
    float _555 = _479 * _553;
    float _557 = -_551;
    float _559 = fma(_467, _545, _557);
    float _561 = _479 * _545;
    float _563 = 1.0 / _535;
    float _565 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _539);
    float _567 = _559 * _559;
    float _569 = float(uint(_533));
    float _571 = -_565;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[0].w, _527);
    float _575 = fma(_561, _561, _567);
    float _577 = _439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _579 = trunc(_507);
    int _581 = int(_579);
    float _583 = _136 * _547;
    float _585 = fma(_555, _555, _575);
    float _587 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _589 = -_577;
    float _591 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].y, _589);
    float _593 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _595 = -_587;
    float _597 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _595);
    float _599 = rsqrt(_585);
    int _601 = as_type<int>(_563) + (-2);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[0].w, _591);
    float _605 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[0].w, _597);
    float _607 = -_593;
    float _609 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _607);
    float _611 = 1.0 / _573;
    float _613 = float(uint(_581));
    float _615 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[0].w, _609);
    int _617 = ~_487;
    int _619 = _617 + 1;
    float _621 = as_type<float>(_601) * _613;
    float _623 = 1.0 / _569;
    float _625 = _559 * _599;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    bool _629 = !_517;
    int _631 = _629 ? 0 : 1;
    float _633 = -_627;
    float _635 = _633 + 1.0;
    int _637 = abs(_631);
    float _639 = trunc(_583);
    int _641 = int(_639);
    float _643 = fma(_605, _611, -1.0);
    float _645 = _635 * _611;
    float _647 = as_type<float>(int(gl_VertexIndex));
    float _649 = fma(_635, _643, 1.0);
    float _651 = _603 * _645;
    float _653 = _615 * _645;
    int _655 = as_type<int>(_623) + (-2);
    float _657 = trunc(_621);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    int _663 = ~_533;
    int _665 = _663 + 1;
    float _667 = float(uint(_641));
    float _669 = 1.0 / _132;
    float _671 = as_type<float>(_655) * _667;
    float _673 = _649 * _649;
    float _675 = trunc(_671);
    float _677 = precise::max(_675, 0.0);
    uint _679 = uint(_677);
    float _681 = fma(_651, _651, _673);
    int _683 = _619 * int(_661);
    int _685 = _683 + _581;
    float _687 = fma(_653, _653, _681);
    float _689 = float(uint(_685));
    float _691 = rsqrt(_687);
    float _693 = as_type<float>(_601) * _689;
    int _695 = _665 * int(_679);
    int _697 = _695 + _641;
    float _699 = trunc(_693);
    float _701 = precise::max(_699, 0.0);
    uint _703 = uint(_701);
    float _705 = float(uint(_697));
    float _707 = _653 * _691;
    float _709 = _649 * _691;
    float _711 = _651 * _691;
    float _713 = -_707;
    float _715 = _467 * _713;
    float _717 = _469 * _709;
    float _719 = -_711;
    float _721 = -_715;
    float _723 = fma(_469, _719, _721);
    float _725 = -_707;
    float _727 = -_717;
    float _729 = fma(_479, _725, _727);
    float _731 = as_type<float>(_655) * _705;
    float _733 = -_711;
    float _735 = _479 * _733;
    float _737 = _723 * _723;
    float _739 = trunc(_731);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = -_735;
    float _747 = fma(_467, _709, _745);
    float _749 = fma(_729, _729, _737);
    int _751 = int(_661) + int(_703);
    int _753 = ~_533;
    int _755 = _753 + 1;
    float _757 = fma(_747, _747, _749);
    float _759 = _136 * 0.25;
    int _761 = as_type<int>(_647) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_647) & 2;
    bool _767 = _765 != 0;
    float _769 = rsqrt(_757);
    int _771 = ~_487;
    int _773 = _771 + 1;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _777 = _775 != 0;
    bool _779 = !_767;
    float _781 = _779 ? (-0.5) : 0.5;
    int _783 = _773 * _751;
    int _785 = _783 + _581;
    int _787 = int(_679) + int(_743);
    float _789 = ceil(_759);
    bool _791 = !_521;
    int _793 = _791 ? 0 : 1;
    int _795 = _755 * _787;
    int _797 = _795 + _641;
    bool _799 = uint(_785) >= uint(_487);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _729 * _769;
    float _807 = _747 * _769;
    float _809 = _723 * _769;
    bool _811 = uint(_797) >= uint(_533);
    float _813 = _469 * _805;
    float _815 = _479 * _807;
    float _817 = _467 * _809;
    bool _819 = !_763;
    float _821 = _819 ? (-0.5) : 0.5;
    float _823 = -_813;
    float _825 = fma(_467, _807, _823);
    float _827 = -_815;
    float _829 = fma(_469, _809, _827);
    float _831 = -_817;
    float _833 = fma(_479, _805, _831);
    float _835 = _789 * 0.5;
    float _837 = _825 * _825;
    float _839 = in.m_67.x;
    float _841 = in.m_67.y;
    float _843 = in.m_67.z;
    float _845 = in.m_67.w;
    bool _847 = !_777;
    int _849 = _847 ? 0 : 1;
    float _851 = floor(_835);
    float _853 = fma(_829, _829, _837);
    bool _855 = !_799;
    int _857 = _855 ? 0 : (-1);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _861 = as_type<float>(_787);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_803)
    {
        float _865 = in.m_67.x;
        _859 = _865;
    }
    float _867 = _859;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _883 = _881 != 0;
    float _885 = fma(_833, _833, _853);
    bool _887 = !_811;
    int _889 = _887 ? 0 : (-1);
    float _891 = _867;
    float _893 = as_type<float>(_889);
    if (!_803)
    {
        float _895 = in.m_67.y;
        _891 = _895;
    }
    float _897 = _891;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _901 = _899 != 0;
    float _903 = rsqrt(_885);
    bool _905 = !_871;
    int _907 = _905 ? 0 : 1;
    bool _909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.5);
    bool _917 = _913 || _915;
    float _919 = fma(_851, -2.0, _789);
    bool _921 = !_875;
    int _923 = _921 ? 0 : 1;
    float _925 = _136 * _669;
    bool _927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.5);
    bool _935 = _931 || _933;
    float _937 = _851;
    if (_803)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = in.m_69.x;
    float _943 = in.m_69.y;
    float _945 = _939;
    if (!_803)
    {
        _945 = 7.345489978790283203125;
    }
    float _947 = _945;
    float _949 = _833 * _903;
    float _951 = _829 * _903;
    float _953 = _825 * _903;
    bool _955 = !_525;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = _467 * _949;
    float _961 = _947 * _839;
    float _963 = _469 * _953;
    float _965 = _479 * _951;
    float _967 = -_959;
    float _969 = fma(_469, _951, _967);
    float _971 = floor(_961);
    float _973 = -_963;
    float _975 = fma(_479, _949, _973);
    float _977 = -_965;
    float _979 = fma(_467, _953, _977);
    float _981 = _969 * _969;
    bool _983 = _925 < 0.85000002384185791015625;
    float _985 = float(_983);
    bool _987 = _487 == 0;
    float _989 = fma(_975, _975, _981);
    float _991 = precise::max(_919, _985);
    float _993 = _985;
    float _995 = _957;
    if (_803)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = fma(_979, _979, _989);
    float _1001 = _997;
    if (!_803)
    {
        _1001 = 1.2345600128173828125;
    }
    float _1003 = _1001;
    float _1005 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1007 = _781 * _991;
    float _1009 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = _821 * _991;
    float _1013 = rsqrt(_999);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1007);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1023 = _897 * _1003;
    float _1025 = _1015 * _1017;
    float _1027 = -_971;
    float _1029 = _961 + _1027;
    float _1031 = _1019 * _1021;
    int _1033 = ~_751;
    int _1035 = _1033 + _857;
    int _1037 = _1035 + 1;
    float _1039 = _1025 * _949;
    float _1041 = float(_581);
    float _1043 = floor(_1023);
    int _1045 = abs(_849);
    int _1047 = _487 * _1037;
    int _1049 = _1047 + _581;
    bool _1051 = _1041 >= _541;
    bool _1053 = isnan(_1041);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(_541);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _979 * _1013;
    float _1065 = _1025 * _951;
    float _1067 = _975 * _1013;
    float _1069 = _1029 * _541;
    float _1071 = fma(_1031, _1063, _1039);
    float _1073 = trunc(_1061);
    int _1075 = int(_1073);
    float _1077 = fma(_1031, _1067, _1065);
    bool _1079 = !_987;
    int _1081 = _1079 ? _1049 : (-1);
    float _1083 = _220 + _1071;
    float _1085 = _204 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = _214 + _1077;
    float _1089 = _204 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1083 + _1091;
    float _1095 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1087 + _1097;
    float _1101 = trunc(_1069);
    int _1103 = int(_1101);
    float _1105 = _1093 * _1093;
    float _1107 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1089);
    float _1109 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1095);
    float _1111 = -_1043;
    float _1113 = _1023 + _1111;
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1107);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _969 * _1013;
    float _1123 = sqrt(_1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1127 = ~_1075;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _541 * _925;
    float _1135 = float(_533);
    float _1137 = _1119 + _1125;
    int _1139 = _487 + (-1);
    int _1141 = _1081 * _1131;
    float _1143 = float(_641);
    int _1145 = _1103 * _1045;
    int _1147 = _1145 + _581;
    int _1149 = abs(_793);
    float _1151 = 1.0 / _1125;
    bool _1153 = !_879;
    int _1155 = _1153 ? 0 : 1;
    int _1157 = _1075 * _1139;
    int _1159 = _1157 + _1141;
    bool _1161 = _1143 >= _1135;
    bool _1163 = isnan(_1143);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    int _1171 = _1169 ? 1065353216 : 0;
    bool _1173 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1175 = _1159 * _1149;
    float _1177 = trunc(_1133);
    int _1179 = int(_1177);
    float _1181 = _1025 * _953;
    bool _1183 = !_883;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_1031, _1121, _1181);
    int _1189 = ~_787;
    int _1191 = _1189 + _889;
    int _1193 = _1191 + 1;
    float _1195 = trunc(as_type<float>(_1171));
    int _1197 = int(_1195);
    float _1199 = _1137 * _1151;
    float _1201 = _1199 * 0.5;
    float _1203 = _204 + _1187;
    float _1205 = _1203;
    int _1207 = _1171;
    float _1209 = as_type<float>(_1149);
    if (!_1173)
    {
        _861 = _1087;
    }
    float _1211 = _861;
    int _1213 = _1179 * _637;
    int _1215 = _1213 + _1175;
    float _1217 = as_type<float>(_1179);
    float _1219 = _1211;
    if (!_1173)
    {
        _1217 = _1083;
    }
    float _1221 = _1217;
    bool _1223 = !_1173;
    float _1225 = _1221;
    float _1227 = _371;
    if (!_1223)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1123 + _1231;
        float _1235 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1115);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1249, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = _1237 * _1253;
        float _1259 = fma(_1203, _1245, _1255);
        float _1261 = fma(_1099, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1263 = fma(_1093, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1259;
        _1219 = _1261;
        _1225 = _1263;
        _1207 = as_type<int>(_1257);
        _893 = _1253;
    }
    float _1265 = _1205;
    float _1267 = _1219;
    float _1269 = _1225;
    int _1271 = _1207;
    float _1273 = _893;
    float _1275 = _1273;
    int _1277 = _1271;
    float _1279 = _1267;
    float _1281 = _1269;
    if (_935)
    {
        _1275 = _1265;
    }
    float _1283 = _1275;
    float _1285 = _1283;
    if (!_935)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _204 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _214 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_204;
        float _1299 = _1297 + _1265;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _220 + _1303;
        float _1307 = -_214;
        float _1309 = _1307 + _1267;
        float _1311 = -_220;
        float _1313 = _1311 + _1269;
        float _1315 = fma(_1293, _1293, _1301);
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1319 = fma(_1305, _1305, _1315);
        float _1321 = sqrt(_1319);
        float _1323 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = precise::min(_1321, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1327 = _1325 * _1317;
        float _1329 = _1323 * _1327;
        float _1331 = fma(_1299, _1329, _204);
        float _1333 = fma(_1309, _1329, _214);
        float _1335 = fma(_1313, _1329, _220);
        _1277 = as_type<int>(_1329);
        _1285 = _1331;
        _1279 = _1333;
        _1281 = _1335;
    }
    int _1337 = _1277;
    float _1339 = _1285;
    float _1341 = _1279;
    float _1343 = _1281;
    int _1345 = abs(as_type<int>(_957));
    bool _1347 = !_901;
    int _1349 = _1347 ? 0 : 1;
    int _1351 = _1337;
    if (_917)
    {
        _995 = 1.0;
    }
    float _1353 = _995;
    float _1355 = _1353;
    if (!_917)
    {
        float _1357 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1359 = _1357 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1367 = _1365 * 0.15915493667125701904296875;
        float _1369 = _1359 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1375 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
        float _1377 = 1.0 / _1363;
        float _1379 = _1367 * 6.283185482025146484375;
        float _1381 = cos(_1379);
        float _1383 = _1371 * _1377;
        float _1385 = 1.0 / _1375;
        float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1387;
        float _1391 = _1381 * _1383;
        float _1393 = _1367 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1391;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1401 = _1385 * _1399;
        float _1403 = 1.0 / _1389;
        float _1405 = _1395 * _1397;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = fma(_1405, _1401, _1407);
        float _1411 = _1409 * _1403;
        float _1413 = precise::clamp(_1411, 0.0, 1.0);
        _306 = _1409;
        _1351 = as_type<int>(_1403);
        _1355 = _1413;
    }
    float _1415 = _306;
    int _1417 = _1351;
    float _1419 = _1355;
    int _1421 = abs(_1349);
    float _1423 = _1415;
    int _1425 = _1417;
    if (_917)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_917)
    {
        float _1431 = as_type<float>(in.m_73.w);
        int _1433 = as_type<int>(_1431) << 24;
        int _1435 = as_type<int>(_1431) << 16;
        int _1437 = _1433 >> 24;
        int _1439 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _1441 = as_type<int>(_1431) << 8;
        int _1443 = _1435 >> 24;
        int _1445 = _1441 >> 24;
        int _1447 = as_type<int>(_1431) >> 24;
        float _1449 = float(_1443);
        float _1451 = float(_1445);
        float _1453 = float(_1447);
        float _1455 = _1449 * 0.0078740157186985015869140625;
        float _1457 = float(_1437);
        float _1459 = _1451 * 0.0078740157186985015869140625;
        bool _1461 = _1439 == 4;
        float _1463 = _1453 * 0.0078740157186985015869140625;
        float _1465 = _1457 * 0.0078740157186985015869140625;
        bool _1467 = _1439 == 8;
        bool _1469 = _1439 == 12;
        float _1471 = precise::min(_1455, 1.0);
        float _1473 = precise::min(_1459, 1.0);
        float _1475 = precise::min(_1463, 1.0);
        float _1477 = precise::min(_1465, 1.0);
        float _1479 = precise::max(_1471, -1.0);
        float _1481 = precise::max(_1473, -1.0);
        float _1483 = precise::max(_1475, -1.0);
        float _1485 = precise::max(_1477, -1.0);
        float _1487 = _1485;
        if (_1461)
        {
            _1487 = _1479;
        }
        float _1489 = _1487;
        float _1491 = _1489;
        if (_1467)
        {
            _1491 = _1481;
        }
        float _1493 = _1491;
        float _1495 = _1493;
        if (_1469)
        {
            _1495 = _1483;
        }
        float _1497 = _1495;
        float _1499 = abs(_1497);
        float _1501 = (-0.0) + _1499;
        _1429 = _1501;
    }
    float _1503 = _1429;
    int _1505 = _533 * _1193;
    int _1507 = _1505 + _641;
    bool _1509 = _533 == 0;
    int _1511 = _1147 * _1345;
    int _1513 = _1511 + _1215;
    float _1515 = _1113 * _1135;
    int _1517 = ~_1197;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1135 * _925;
    bool _1525 = !_1509;
    int _1527 = _1525 ? _1507 : (-1);
    int _1529 = _1103 * _1421;
    int _1531 = _1529 + _1513;
    int _1533 = _533 + (-1);
    float _1535 = trunc(_1515);
    int _1537 = int(_1535);
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1541 = _1539 != 0;
    int _1543 = _1527 * _1521;
    float _1545 = float(uint(_1531));
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1197 * _1533;
    int _1553 = _1551 + _1543;
    int _1555 = abs(_923);
    float _1557 = trunc(_1523);
    int _1559 = int(_1557);
    float _1561 = as_type<float>(_601) * _1545;
    int _1563 = abs(_1549);
    int _1565 = abs(_907);
    float _1567 = trunc(_1561);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1553 * _1555;
    int _1575 = abs(_1155);
    int _1577 = _1537 * _1563;
    int _1579 = _1577 + _641;
    int _1581 = ~_487;
    int _1583 = _1581 + 1;
    int _1585 = _1559 * _1565;
    int _1587 = _1585 + _1573;
    int _1589 = abs(_1185);
    int _1591 = _1579 * _1575;
    int _1593 = _1591 + _1587;
    int _1595 = ~_487;
    int _1597 = _1595 + 1;
    int _1599 = _1583 * int(_1571);
    int _1601 = _1599 + _1531;
    int _1603 = ~_533;
    int _1605 = _1603 + 1;
    int _1607 = _1537 * _1589;
    int _1609 = _1607 + _1593;
    if (_803)
    {
        _1425 = 0;
    }
    int _1611 = _1425;
    float _1613 = float(uint(_1601));
    float _1615 = float(uint(_1609));
    int _1617 = _1611;
    if (!_803)
    {
        _1617 = 1;
    }
    int _1619 = _1617;
    float _1621 = as_type<float>(_601) * _1613;
    float _1623 = abs(_371);
    bool _1625 = _1623 != 0.0;
    bool _1627 = isnan(_1623);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.0);
    bool _1633 = _1629 || _1631;
    float _1635 = as_type<float>(_655) * _1615;
    int _1637 = ~_533;
    int _1639 = _1637 + 1;
    float _1641 = trunc(_1621);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = float(uint(_1147));
    float _1655 = as_type<float>(_601) * _1653;
    int _1657 = int(_1571) + int(_1645);
    int _1659 = ~_487;
    int _1661 = _1659 + 1;
    int _1663 = _1597 * _1657;
    int _1665 = _1663 + _1531;
    int _1667 = _1605 * int(_1651);
    int _1669 = _1667 + _1609;
    bool _1671 = uint(_1665) >= uint(_487);
    float _1673 = float(uint(_1669));
    bool _1675 = !_1671;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = as_type<float>(_655) * _1673;
    int _1681 = ~_1657;
    int _1683 = _1681 + _1677;
    int _1685 = _1683 + 1;
    float _1687 = trunc(_1655);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    int _1693 = _487 * _1685;
    int _1695 = _1693 + _1531;
    float _1697 = float(uint(_1579));
    float _1699 = trunc(_1679);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    bool _1705 = !_987;
    int _1707 = _1705 ? _1695 : (-1);
    float _1709 = as_type<float>(_655) * _1697;
    int _1711 = _1707 & 3;
    bool _1713 = _1711 != 0;
    int _1715 = _1661 * int(_1691);
    int _1717 = _1715 + _1147;
    float _1719 = trunc(_1709);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_533;
    int _1727 = _1725 + 1;
    int _1729 = _1713 ? 0 : 1;
    float _1731 = float(uint(_1717));
    int _1733 = int(_1651) + int(_1703);
    int _1735 = _1707 & 3;
    bool _1737 = _1735 != 0;
    float _1739 = as_type<float>(_601) * _1731;
    int _1741 = ~_533;
    int _1743 = _1741 + 1;
    int _1745 = _1727 * _1733;
    int _1747 = _1745 + _1609;
    bool _1749 = uint(_1735) > 1u;
    bool _1751 = uint(_1735) >= 2u;
    float _1753 = trunc(_1739);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (!_1749)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1743 * int(_1723);
    int _1775 = _1773 + _1579;
    bool _1777 = uint(_1747) >= uint(_533);
    int _1779 = _1751 ? 0 : 1;
    bool _1781 = _1735 != 3;
    bool _1783 = !_1777;
    int _1785 = _1783 ? 0 : (-1);
    float _1787 = float(uint(_1775));
    bool _1789 = _845 > 0.5;
    int _1791 = ~_487;
    int _1793 = _1791 + 1;
    float _1795 = as_type<float>(_655) * _1787;
    int _1797 = ~_1733;
    int _1799 = _1797 + _1785;
    int _1801 = _1799 + 1;
    int _1803 = int(_1691) + int(_1757);
    int _1805 = _533 * _1801;
    int _1807 = _1805 + _1609;
    int _1809 = ~_1779;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = trunc(_1795);
    float _1817 = precise::max(_1815, 0.0);
    uint _1819 = uint(_1817);
    int _1821 = _1813;
    if (_1781)
    {
        int _1823 = ~_1779;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1793 * _1803;
    int _1831 = _1829 + _1147;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1835 = _1833 != 0;
    float _1837 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1839 = -_781;
    int _1841 = _1789 ? as_type<int>(_1839) : as_type<int>(_781);
    bool _1843 = !_1509;
    int _1845 = _1843 ? _1807 : (-1);
    float _1847 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1837);
    bool _1849 = uint(_1831) >= uint(_487);
    float _1851 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1853 = !_1835;
    float _1855 = _1853 ? _781 : as_type<float>(_1841);
    float _1857 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    int _1859 = _1845 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    int _1865 = _1845 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1871 = !_1849;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1877 = uint(_1859) > 1u;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = _1867 ? 0 : 1;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1885 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1887 = _1885 != 0;
    float _1889 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1891 = int(_1723) + int(_1819);
    float _1893 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1895 = ~_1881;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    float _1901 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    int _1903 = _1845 >> 31;
    float _1905 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    int _1907 = _1639 * _1891;
    int _1909 = _1907 + _1579;
    float _1911 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1901);
    int _1913 = _1899;
    float _1915 = as_type<float>(_1903);
    if (!_1877)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1913 = _1919;
    }
    int _1921 = _1913;
    float _1923 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1905);
    float _1927 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1929 = uint(_1859) >= 2u;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1935 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1875);
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    float _1957 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1949);
    int _1959 = _1707 >> 31;
    float _1961 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1951);
    int _1963 = _1929 ? 0 : 1;
    int _1965 = _1959 & 3;
    int _1967 = _1903 & 3;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1961;
    float _1969 = _1939;
    float _1971 = _1955;
    float _1973 = _1953;
    float _1975 = _1957;
    if (_1633)
    {
        _1915 = _1961;
    }
    float _1977 = _1915;
    float _1979 = _1977;
    if (!_1633)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    if (!_1633)
    {
        out.gl_Position.w = 0.0;
    }
    bool _1983 = _292 != 0;
    bool _1985 = _1859 != 3;
    int _1987 = ~_1963;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1707 + _1965;
    int _1995 = _1845 + _1967;
    int _1997 = _1991;
    if (_1983)
    {
        _1227 = _1981;
    }
    float _1999 = _1227;
    float _2001 = _1999;
    if (_1985)
    {
        int _2003 = ~_1963;
        int _2005 = _2003 + 1;
        _1997 = _2005;
    }
    int _2007 = _1997;
    bool _2009 = uint(_1909) >= uint(_533);
    if (!_1983)
    {
        int _2011 = _312 << 4;
        int _2013 = _2011 + 2048;
        uint _2015 = uint(int(uint(_2013) >> uint(2)));
        uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
        int _2019 = int(_2015) & 3;
        float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
        int _2023 = int(_2015) + 1;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        int _2027 = _2023 & 3;
        float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
        int _2031 = _2013 + 8;
        uint _2033 = uint(int(uint(_2031) >> uint(2)));
        uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
        int _2037 = int(_2033) & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = int(_2033) + 1;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        int _2045 = _2041 & 3;
        float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
        float _2049 = _210 * _2029;
        float _2051 = fma(_214, _2021, _2049);
        float _2053 = fma(_220, _2039, _2051);
        float _2055 = _2053 + _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + _395;
        float _2063 = fma(_2061, 500.0, 1.5);
        float _2065 = exp2(_2063);
        float _2067 = 0.0 + _2065;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        bool _2071 = _2069 >= 1.0;
        bool _2073 = isnan(_2069);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan(1.0);
        bool _2079 = _2075 || _2077;
        float _2081 = _2069;
        if (!_2079)
        {
            out.gl_Position.w = 0.0;
        }
        if (_2079)
        {
            _2081 = _1981;
        }
        float _2083 = _2081;
        _2001 = _2083;
        if (!_2079)
        {
            _2001 = 0.0;
        }
    }
    float _2085 = _2001;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1339 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1341 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1343 + _2095;
    float _2099 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2089 * _2089;
    float _2103 = 1.0 / _2085;
    int _2105 = _1993 >> 2;
    float _2107 = fma(_2093, _2093, _2101);
    int _2109 = _1995 >> 2;
    int _2111 = _2105 << 4;
    int _2113 = _2111 + 368;
    float _2115 = fma(_2097, _2097, _2107);
    int _2117 = _2109 << 4;
    int _2119 = _2117 + 512;
    float _2121 = rsqrt(_2115);
    float _2123 = sqrt(_2115);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2127 = _2093 * _2125;
    float _2129 = _2097 * _2125;
    float _2131 = _2127 * _2127;
    float _2133 = _2129 * _2129;
    float _2135 = _2131 + _2133;
    float _2137 = sqrt(_2135);
    bool _2139 = _2137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2143 = _2137 + _2141;
    float _2145 = _214;
    float _2147 = _2135;
    float _2149 = _2143;
    float _2151 = _2089;
    float _2153 = _2127;
    float _2155 = _2129;
    float _2157 = _2131;
    float _2159 = _2133;
    if (_2139)
    {
        float _2161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2161;
    }
    float _2163 = _2145;
    if (_2139)
    {
        float _2165 = rsqrt(_2135);
        _2147 = _2165;
    }
    float _2167 = _2147;
    if (_2139)
    {
        float _2169 = _2143 * _2163;
        _2149 = _2169;
    }
    float _2171 = _2149;
    if (_2139)
    {
        float _2173 = _2171 * 0.15915493667125701904296875;
        _1969 = _2173;
    }
    float _2175 = _1969;
    float _2177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2179 = _1981;
    if (_2139)
    {
        float _2181 = _2175 * 6.283185482025146484375;
        float _2183 = sin(_2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = precise::max(0.0, _2177);
    float _2189 = _2171;
    float _2191 = _2187;
    if (_2139)
    {
        float _2193 = _2175 * 6.283185482025146484375;
        float _2195 = cos(_2193);
        _2189 = _2195;
    }
    float _2197 = _2189;
    float _2199 = -_2125;
    float _2201 = -_2187;
    float _2203 = fma(_2089, _2199, _2201);
    if (_2139)
    {
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2151 = _2205;
    }
    float _2207 = _2151;
    float _2209 = _2207;
    if (_2139)
    {
        float _2211 = fma(_2185, _2207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2139)
    {
        float _2217 = _2167 * _2213;
        _1209 = _2217;
    }
    float _2219 = _1209;
    if (!_2139)
    {
        _2215 = _2203;
    }
    float _2221 = _2215;
    float _2223 = _2221;
    if (_2139)
    {
        float _2225 = _2197 + (-1.0);
        _2191 = _2225;
    }
    float _2227 = _2191;
    float _2229 = _2227;
    if (_2139)
    {
        float _2231 = _2127 * _2219;
        _2153 = _2231;
    }
    float _2233 = _2153;
    if (_2139)
    {
        float _2235 = _2129 * _2219;
        _2155 = _2235;
    }
    float _2237 = _2155;
    if (_2139)
    {
        float _2239 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2239;
    }
    float _2241 = _2229;
    if (_2139)
    {
        float _2243 = _2233 * _2233;
        _2157 = _2243;
    }
    float _2245 = _2157;
    if (_2139)
    {
        float _2247 = _2237 * _2237;
        _2159 = _2247;
    }
    float _2249 = _2159;
    if (_2139)
    {
        float _2251 = fma(_2203, _2197, _2241);
        _2223 = _2251;
    }
    float _2253 = _2223;
    bool _2255 = _839 > 0.5;
    float _2257 = fma(_2253, _2253, _2245);
    float _2259 = -_821;
    int _2261 = _2255 ? as_type<int>(_2259) : as_type<int>(_821);
    bool _2263 = _1503 != 0.0;
    bool _2265 = isnan(_1503);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    float _2273 = _2257 + _2249;
    bool _2275 = !_1887;
    float _2277 = _2275 ? _821 : as_type<float>(_2261);
    bool _2279 = _841 > 0.5;
    float _2281 = rsqrt(_2273);
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = _2289 + 1.0;
    if (!_2271)
    {
        _1971 = 0.0;
        _1973 = 0.0;
    }
    float _2293 = _1971;
    float _2295 = _1973;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2103 * _2293;
    float _2303 = _2281 * _2233;
    float _2305 = _2281 * _2253;
    float _2307 = _2281 * _2237;
    float _2309 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2311 = -_2309;
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2311);
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2317 = -_2307;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2313);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2319, -0.5, 0.5);
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2329 = fma(_2325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2331 = -_2099;
    float _2333 = fma(_2331, _2327, 1.0);
    float _2335 = sqrt(_2323);
    float _2337 = _2305 + 1.0;
    float _2339 = fma(_2325, _2329, -0.212114393711090087890625);
    float _2341 = fma(_2301, -0.5, 0.5);
    float _2343 = fma(_2325, _2339, 1.570728778839111328125);
    float _2345 = _2103 * _2295;
    float _2347 = log2(_2333);
    float _2349 = -_2305;
    float _2351 = fma(_2321, _2337, _2349);
    uint _2353 = uint(int(uint(_2113) >> uint(2)));
    uint _2355 = uint(int(uint(int(_2353)) >> uint(2)));
    int _2357 = int(_2353) & 3;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[int(_2355)][_2357];
    int _2361 = int(_2353) + 1;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    int _2365 = _2361 & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    float _2369 = fma(_2345, 0.5, 0.5);
    float _2371 = -_781;
    int _2373 = _2279 ? as_type<int>(_2371) : as_type<int>(_781);
    float _2375 = fma(_2351, 0.5, 0.5);
    int _2377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2379 = _2377 != 0;
    float _2381 = _2335 * 0.636619746685028076171875;
    float _2383 = -_2343;
    float _2385 = fma(_2381, _2383, 1.0);
    float _2387 = _2347 * 0.693147182464599609375;
    float _2389 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7062 = float3(_2369, _2341, _2389);
    float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7062, float3(0.0), isnan(_7062)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7062, float3(0.0), isnan(_7062)), level(0.0)).x;
    float3 _7071 = float3(_2369, _2341, _2389);
    float4 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7071, float3(0.0), isnan(_7071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7071, float3(0.0), isnan(_7071)), level(0.0)).xyzw;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = _2394.w;
    float2 _7087 = float2(_2385, _2375);
    float3 _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7087, float2(0.0), isnan(_7087)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7087, float2(0.0), isnan(_7087)), level(0.0)).xyz;
    float _2408 = _2406.x;
    float _2410 = _2406.y;
    float _2412 = _2406.z;
    uint _2414 = uint(int(uint(_2119) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    bool _2430 = !_2379;
    float _2432 = _2430 ? _781 : as_type<float>(_2373);
    float _2434 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2436 = !_1737;
    int _2438 = _2436 ? 0 : 1;
    float _2440 = _841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2442 = !_1861;
    int _2444 = _2442 ? 0 : 1;
    float _2446 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2448 = _1735 != 3;
    out.m_75.x = _1067;
    out.m_75.y = _1121;
    out.m_75.z = _1063;
    bool _2450 = _1859 != 3;
    float _2452 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2454 = _2113 + 8;
    uint _2456 = uint(int(uint(_2454) >> uint(2)));
    uint _2458 = uint(int(uint(int(_2456)) >> uint(2)));
    int _2460 = int(_2456) & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = int(_2456) + 1;
    uint _2466 = uint(int(uint(_2464) >> uint(2)));
    int _2468 = _2464 & 3;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[int(_2466)][_2468];
    bool _2472 = _1619 != 1;
    out.m_77.x = _1341;
    out.m_77.y = _1339;
    out.m_77.z = _1343;
    float _2474 = exp2(_2452);
    bool _2476 = !_2009;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2119 + 8;
    uint _2482 = uint(int(uint(_2480) >> uint(2)));
    uint _2484 = uint(int(uint(int(_2482)) >> uint(2)));
    int _2486 = int(_2482) & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = int(_2482) + 1;
    uint _2492 = uint(int(uint(_2490) >> uint(2)));
    int _2494 = _2490 & 3;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[int(_2492)][_2494];
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2500 = _843 > 0.5;
    bool _2502 = !_2448;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = -_2498;
    float _2508 = fma(_2434, 2.0, _2506);
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2512 = !_2450;
    float _2514 = _2512 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2516 = -_821;
    int _2518 = _2500 ? as_type<int>(_2516) : as_type<int>(_821);
    float _2520 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2510);
    int _2522 = abs(_1771);
    float _2524 = -_136;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2508);
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2530 = _2528 != 0;
    float _2532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2520);
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2540 = _2538 != 0;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _2544 = _2514;
    if (!_2472)
    {
        _863 = _841;
    }
    float _2546 = _863;
    float _2548 = _2546;
    if (!_2472)
    {
        _2542 = _841;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2472)
    {
        _2548 = _839;
    }
    float _2554 = _2548;
    if (_2472)
    {
        _2552 = _839;
    }
    float _2556 = _2552;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2560 = abs(_2438);
    float _2562 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2564 = int(_2562);
    int _2566 = ~_1803;
    int _2568 = _2566 + _1873;
    int _2570 = _2568 + 1;
    int _2572 = abs(_1921);
    int _2574 = ~_2522;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _487 * _2570;
    int _2582 = _2580 + _1147;
    int _2584 = ~_1891;
    int _2586 = _2584 + _2478;
    int _2588 = _2586 + 1;
    int _2590 = _2578 * as_type<int>(_2367);
    int _2592 = ~_2572;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = abs(_2444);
    int _2600 = _533 * _2588;
    int _2602 = _2600 + _1579;
    int _2604 = ~_2560;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2596 * as_type<int>(_2428);
    int _2612 = abs(_1827);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2608 * as_type<int>(_2359);
    int _2622 = _2620 + _2590;
    int _2624 = abs(_2504);
    float _2626 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2628 = int(_2626);
    int _2630 = ~_2612;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2420);
    int _2638 = _2636 + _2610;
    int _2640 = abs(_2007);
    int _2642 = ~_2624;
    int _2644 = _2642 + 1;
    int _2646 = _2644 + 1;
    int _2648 = _2634 * as_type<int>(_2462);
    int _2650 = _2648 + _2622;
    int _2652 = abs(as_type<int>(_2514));
    int _2654 = ~_2640;
    int _2656 = _2654 + 1;
    int _2658 = _2656 + 1;
    int _2660 = _2646 * as_type<int>(_2470);
    int _2662 = _2660 + _2650;
    float _2664 = float(uint(_2564));
    bool _2666 = !_2530;
    int _2668 = _2666 ? 0 : 1;
    int _2670 = _2658 * as_type<int>(_2488);
    int _2672 = _2670 + _2638;
    int _2674 = ~_2652;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    int _2680 = abs(_2668);
    float _2682 = 1.0 / _2664;
    float _2684 = float(uint(_2628));
    int _2686 = _2678 * as_type<int>(_2496);
    int _2688 = _2686 + _2672;
    int _2690 = ~_2680;
    int _2692 = _2690 + 1;
    int _2694 = _2692 + 1;
    bool _2696 = !_2536;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = abs(_2564);
    int _2702 = _2662 * _2694;
    bool _2704 = !_987;
    int _2706 = _2704 ? _2582 : (-1);
    float _2708 = 1.0 / _2684;
    int _2710 = abs(_2698);
    float _2712 = float(uint(_2700));
    int _2714 = _2706 * _2680;
    int _2716 = _2714 + _2702;
    int _2718 = ~_2710;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = abs(_2628);
    float _2726 = 1.0 / _2712;
    bool _2728 = !_1509;
    int _2730 = _2728 ? _2602 : (-1);
    int _2732 = _2688 * _2722;
    int _2734 = as_type<int>(_2682) + (-2);
    float _2736 = float(uint(_2716));
    int _2738 = _2730 * _2710;
    int _2740 = _2738 + _2732;
    float _2742 = float(uint(_2724));
    int _2744 = as_type<int>(_2708) + (-2);
    float _2746 = as_type<float>(_2734) * _2736;
    float _2748 = float(uint(_2740));
    float _2750 = 1.0 / _2742;
    int _2752 = abs(_2716);
    float _2754 = as_type<float>(_2744) * _2748;
    int _2756 = as_type<int>(_2726) + (-2);
    float _2758 = float(uint(_2752));
    float _2760 = trunc(_2746);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    int _2766 = abs(_2740);
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2770 = ~_2564;
    int _2772 = _2770 + 1;
    float _2774 = as_type<float>(_2756) * _2758;
    float _2776 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2768);
    float _2778 = trunc(_2754);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    float _2784 = _2768;
    if (!_2472)
    {
        _2784 = _843;
    }
    float _2786 = _2784;
    float _2788 = _2786;
    if (!_2472)
    {
        _2544 = _843;
    }
    float _2790 = _2544;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2794 = as_type<int>(_2750) + (-2);
    float _2796 = float(uint(_2766));
    int _2798 = _2772 * int(_2764);
    int _2800 = _2798 + _2716;
    int _2802 = ~_2628;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2774);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = _2790;
    if (_2472)
    {
        _2788 = _841;
    }
    float _2814 = _2788;
    float _2816 = as_type<float>(_2794) * _2796;
    if (_2472)
    {
        _2812 = _841;
    }
    float _2818 = _2812;
    float _2820 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2792);
    float _2822 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2824 = float(uint(_2800));
    float _2826 = trunc(_2816);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    int _2832 = _2804 * int(_2782);
    int _2834 = _2832 + _2740;
    float _2836 = as_type<float>(_2734) * _2824;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2840 = float(uint(_2834));
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2844 = ~int(_2810);
    int _2846 = _2844 + 1;
    float _2848 = trunc(_2836);
    float _2850 = precise::max(_2848, 0.0);
    uint _2852 = uint(_2850);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2838);
    float _2856 = as_type<float>(_2744) * _2840;
    float _2858 = -_2842;
    float _2860 = fma(_2558, 2.0, _2858);
    int _2862 = _2846 * _2700;
    int _2864 = _2862 + _2752;
    float _2866 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2868 = ~int(_2830);
    int _2870 = _2868 + 1;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2874 = trunc(_2856);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    float _2880 = float(uint(_2864));
    float _2882 = fma(_2866, _2866, 1.0);
    int _2884 = _2870 * _2724;
    int _2886 = _2884 + _2766;
    int _2888 = ~_2628;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2440, -2.0, _2872);
    float _2894 = as_type<float>(_2756) * _2880;
    float _2896 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2776);
    int _2898 = int(_2764) + int(_2852);
    float _2900 = rsqrt(_2882);
    float _2902 = float(uint(_2886));
    float _2904 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2820);
    int _2906 = ~_2564;
    int _2908 = _2906 + 1;
    float _2910 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2892);
    bool _2912 = !_2540;
    float _2914 = _2912 ? _821 : as_type<float>(_2518);
    float _2916 = as_type<float>(_2794) * _2902;
    int _2918 = int(_2782) + int(_2878);
    float _2920 = trunc(_2894);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2854);
    bool _2928 = _2628 == 0;
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2936 = -_2926;
    float _2938 = _2936 + 1.0;
    float _2940 = trunc(_2916);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = _2866 * _2900;
    float _2948 = _2866 * _951;
    float _2950 = fma(_2822, -2.0, _2934);
    float _2952 = -_136;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2860);
    float _2956 = -_467;
    float _2958 = _2946 * _2956;
    float _2960 = -_469;
    float _2962 = _2946 * _2960;
    float _2964 = -_479;
    float _2966 = _2946 * _2964;
    int _2968 = int(_2810) + int(_2924);
    float _2970 = fma(_2900, _951, _2958);
    float _2972 = fma(_2900, _949, _2962);
    float _2974 = fma(_2900, _953, _2966);
    int _2976 = _2890 * _2918;
    int _2978 = _2976 + _2740;
    float _2980 = _2866 * _953;
    float _2982 = _2866 * _949;
    int _2984 = ~_2968;
    int _2986 = _2984 + 1;
    int _2988 = _2908 * _2898;
    int _2990 = _2988 + _2716;
    int _2992 = int(_2830) + int(_2944);
    out.m_79.x = _2970;
    out.m_79.y = _2974;
    out.m_79.z = _2972;
    bool _2994 = uint(_2978) >= uint(_2628);
    float _2996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2998 = ~_2992;
    int _3000 = _2998 + 1;
    float _3002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2950);
    bool _3004 = uint(_2990) >= uint(_2564);
    float _3006 = fma(_2446, _1121, _2980);
    float _3008 = fma(_2446, _1063, _2982);
    bool _3010 = !_3004;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = _479 + _3006;
    bool _3016 = _2564 == 0;
    float _3018 = _469 + _3008;
    float _3020 = fma(_2446, _1067, _2948);
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3024 = !_2994;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = _2986 * _2700;
    int _3030 = _3028 + _2752;
    int _3032 = ~_2898;
    int _3034 = _3032 + _3012;
    int _3036 = _3034 + 1;
    int _3038 = _3000 * _2724;
    int _3040 = _3038 + _2766;
    int _3042 = ~_2918;
    int _3044 = _3042 + _3026;
    int _3046 = _3044 + 1;
    float _3048 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3050 = uint(_3030) >= uint(_2700);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3054 = _2716 ^ _2564;
    int _3056 = _2628 * _3046;
    int _3058 = _3056 + _2740;
    bool _3060 = uint(_3040) >= uint(_2724);
    int _3062 = _2564 * _3036;
    int _3064 = _3062 + _2716;
    int _3066 = _2740 ^ _2628;
    bool _3068 = !_3050;
    int _3070 = _3068 ? 0 : (-1);
    float _3072 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3074 = !_3060;
    int _3076 = _3074 ? 0 : (-1);
    uint _3078 = uint(int(uint(_3054) >> uint(31)));
    uint _3080 = uint(int(uint(_3066) >> uint(31)));
    int _3082 = ~_3070;
    int _3084 = _2968 + _3082;
    int _3086 = _3084 + 1;
    float _3088 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3090 = _2628 == 0;
    int _3092 = ~_3076;
    int _3094 = _2992 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = ~int(_3078);
    int _3102 = _3100 + 1;
    int _3104 = ~int(_3080);
    int _3106 = _3104 + 1;
    bool _3108 = !_2928;
    int _3110 = _3108 ? _3058 : (-1);
    bool _3112 = !_3016;
    int _3114 = _3112 ? _3064 : (-1);
    int _3116 = _3086 ^ _3102;
    int _3118 = _3096 ^ _3106;
    float _3120 = float(_3110);
    float _3122 = float(_3114);
    bool _3124 = _2564 == 0;
    float _3126 = fma(_3088, _3120, _2954);
    int _3128 = ~_3102;
    int _3130 = _3128 + _3116;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3048, _3122, _2526);
    int _3136 = ~_3106;
    int _3138 = _3136 + _3118;
    int _3140 = _3138 + 1;
    float _3142 = _2277 + 0.5;
    bool _3144 = !_3124;
    int _3146 = _3144 ? _3132 : (-1);
    float _3148 = _2914 + 0.5;
    bool _3150 = !_3090;
    int _3152 = _3150 ? _3140 : (-1);
    float _3154 = fma(_3048, _3142, _3134);
    float _3156 = float(_3146);
    float _3158 = _1957 + _1961;
    float _3160 = float(_3152);
    float _3162 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3164 = _1855 + (-0.5);
    float _3166 = -_2910;
    float _3168 = fma(_3072, _3156, _3166);
    float _3170 = _2432 + (-0.5);
    float _3172 = -_3002;
    float _3174 = fma(_3162, _3160, _3172);
    if (!_2271)
    {
        _1975 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3176 = _1975;
    float _3178 = fma(_3088, _3148, _3126);
    float _3180 = -_3162;
    float _3182 = fma(_3180, _3164, _3174);
    float _3184 = -_2474;
    float _3186 = _3184 + 1.0;
    float _3188 = -_3072;
    float _3190 = fma(_3188, _3170, _3168);
    float _3192 = -_2896;
    float _3194 = _3192 + 1.0;
    int _3196 = as_type<int>(_3176);
    float _3198 = _3186;
    float _3200 = 0.0;
    if (!_2271)
    {
        float _3202 = _3176 * 5.0;
        _3196 = as_type<int>(_3202);
    }
    int _3204 = _3196;
    float _3206 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = fma(_2432, _3194, _3190);
    float _3210 = _467 + _3020;
    float _3212 = _1419 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3214 = as_type<float>(_3204);
    float _3216 = _3208;
    if (!_2271)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8293 = as_type<float>(_3204);
        out.gl_Position.z = _8293;
    }
    float _3218 = _3158 * 0.5;
    bool _3220 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_2123);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3212 * _1503;
    out.m_81.x = _3210;
    out.m_81.y = _3014;
    out.m_81.z = _3018;
    float _3232 = -_2532;
    float _3234 = _3232 + 1.0;
    float _3236 = -_2932;
    float _3238 = fma(_2914, _3236, _3178);
    float _3240 = fma(_1855, _2938, _3182);
    out.m_83.z = _3218;
    out.m_83.w = _1961;
    float _3242 = -_3234;
    float _3244 = fma(_2277, _3242, _3154);
    float _3246 = _3206 * _2391;
    float _3248 = -_3206;
    float _3250 = _3248 + 1.0;
    out.m_85.x = _3244;
    out.m_85.y = _3208;
    out.m_85.z = _3238;
    out.m_85.w = _3240;
    float _3252 = _3246;
    float _3254 = _3244;
    if (!_3228)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3256 = _3198;
    float _3258 = _2402 * _3246;
    float _3260 = _2412 * _3246;
    float _3262 = _2402 * _3250;
    float _3264 = _3258;
    float _3266 = _3256;
    float _3268 = _3256;
    if (!_3228)
    {
        _3214 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3214;
    float _3272 = fma(_2408, _3258, _2396);
    float _3274 = fma(_2410, _3258, _2398);
    float _3276 = fma(_2402, _3260, _2400);
    float _3278 = _3270;
    float _3280 = _3270;
    if (!_3228)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _3200;
    float _3284 = _3282;
    float _3286 = _3282;
    if (!_3228)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3288 = _3252;
    out.m_87.x = _3272;
    out.m_87.y = _3274;
    out.m_87.z = _3276;
    out.m_87.w = _3262;
    float _3290 = _3288;
    float _3292 = _3288;
    if (_2271)
    {
        _3216 = _3230;
    }
    float _3294 = _3216;
    float _3296 = _3294;
    if (!_2271)
    {
        _3296 = 0.0;
    }
    float _3298 = _3296;
    if (!_3228)
    {
        _3254 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3300 = _3254;
    float _3302 = _3300;
    float _3304 = _3300;
    if (!_3228)
    {
        _3264 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3306 = _3264;
    bool _3308 = !_3228;
    float _3310 = _3306;
    float _3312 = _3306;
    if (!_3308)
    {
        bool _3314 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3316 = isnan(_2123);
        bool _3318 = _3314 || _3316;
        bool _3320 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3322 = _3318 || _3320;
        if (!_3322)
        {
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3326 = _2123 + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3330 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3328;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3340 = 1.0 / _3330;
            float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3354 = _3326 * _3340;
            float _3356 = precise::clamp(_3354, 0.0, 1.0);
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3362 = fma(_3356, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3364 = fma(_3356, _3338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3366 = fma(_3356, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3368 = fma(_3356, _3344, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3370 = fma(_3356, _3348, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3372 = fma(_3356, _3352, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3292 = _3362;
            _3268 = _3370;
            _3286 = _3364;
            _3304 = _3368;
            _3312 = _3366;
            _3280 = _3372;
            _3374 = true;
        }
        else
        {
            bool _3376 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3378 = isnan(_2123);
            bool _3380 = _3376 || _3378;
            bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3384 = _3380 || _3382;
            if (!_3384)
            {
                _3302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3302;
            _3304 = _3386;
            if (!_3384)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3266;
            _3268 = _3388;
            if (!_3384)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3278;
            _3280 = _3390;
            if (!_3384)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3284;
            _3286 = _3392;
            if (!_3384)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3290;
            _3292 = _3394;
            if (!_3384)
            {
                _3310 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3310;
            bool _3398 = !_3384;
            _3312 = _3396;
            if (!_3398)
            {
                bool _3400 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3402 = isnan(_2123);
                bool _3404 = _3400 || _3402;
                bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3408 = _3404 || _3406;
                if (!_3408)
                {
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3412 = _2123 + _3410;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3416 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3414;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3426 = 1.0 / _3416;
                    float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3432 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3440 = _3412 * _3426;
                    float _3442 = precise::clamp(_3440, 0.0, 1.0);
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3448 = fma(_3442, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3450 = fma(_3442, _3424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3452 = fma(_3442, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3454 = fma(_3442, _3430, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3456 = fma(_3442, _3434, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3458 = fma(_3442, _3438, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3292 = _3448;
                    _3268 = _3456;
                    _3286 = _3450;
                    _3304 = _3454;
                    _3312 = _3452;
                    _3280 = _3458;
                    _3374 = true;
                }
                else
                {
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3312 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3374 = false;
    float _3460 = _3292;
    float _3462 = _3268;
    float _3464 = _3286;
    float _3466 = _3304;
    float _3468 = _3312;
    float _3470 = _3280;
    float _3472 = fma(_3014, -0.5, 0.5);
    float _3474 = precise::clamp(_3472, 0.0, 1.0);
    float _3476 = -_3460;
    float _3478 = _3462 + _3476;
    float _3480 = _3298 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3482 = -_3464;
    float _3484 = _3466 + _3482;
    float _3486 = fma(_3474, _3478, _3460);
    out.m_89.w = _3480;
    float _3488 = fma(_3474, _3484, _3464);
    float _3490 = -_3468;
    float _3492 = _3470 + _3490;
    float _3494 = _3486 * 0.586610972881317138671875;
    out.m_54.x = 1.0;
    bool _3496 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3498 = fma(_3474, _3492, _3468);
    float _3500 = fma(_3488, 0.298911988735198974609375, _3494);
    bool _3502 = _1419 > 0.0;
    bool _3504 = isnan(_1419);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(0.0);
    bool _3510 = _3506 || _3508;
    float _3512 = fma(_3498, 0.114477999508380889892578125, _3500);
    out.m_91.x = 0.0;
    float _3514 = -_3512;
    float _3516 = _3488 + _3514;
    float _3518 = -_3512;
    float _3520 = _3486 + _3518;
    float _3522 = -_3512;
    float _3524 = _3498 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    bool _3532 = !_3496;
    if (!_3532)
    {
        float _3534 = -_1339;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_1341;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_1343;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3014 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3018, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3610;
        out.m_91.y = _3612;
        out.m_91.z = _3614;
    }
    out.m_93.x = _3526;
    out.m_93.y = _3528;
    out.m_93.z = _3530;
    if (_3510)
    {
        return out;
    }
    out.m_54.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_51.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_54.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3672 = as_type<float>(_126);
        out.gl_Position.z = _3672;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_56.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_54.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3736 = as_type<float>(_160);
        out.gl_Position.z = _3736;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_58.x;
    float _170 = in.m_58.y;
    float _172 = in.m_58.z;
    float _174 = in.m_58.w;
    float _176 = in.m_60.x;
    float _178 = in.m_60.y;
    float _180 = in.m_60.z;
    float _182 = in.m_60.w;
    float _184 = in.m_62.x;
    float _186 = in.m_62.y;
    float _188 = in.m_62.z;
    float _190 = in.m_62.w;
    float _192 = _164 * _170;
    float _194 = fma(_162, _168, _192);
    float _196 = _164 * _178;
    float _198 = fma(_166, _172, _194);
    float _200 = _164 * _186;
    float _202 = fma(_162, _176, _196);
    float _204 = _198 + _174;
    float _206 = fma(_162, _184, _200);
    float _208 = fma(_166, _180, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _212 = fma(_166, _188, _206);
    float _214 = _208 + _182;
    float _216 = _210 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _220 = _212 + _190;
    float _222 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[126].x, _216);
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c15)._m0[127].x, _218);
    float _226 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].z, _222);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _234 = trunc(_230);
    int _236 = int(_234);
    float _238 = trunc(_232);
    int _240 = int(_238);
    int _242 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _244 = _236 + _242;
    int _246 = _244 + 1;
    bool _248 = _246 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _252 = _240 + _250;
    int _254 = _252 + 1;
    int _256 = _246 | _254;
    bool _258 = _256 < 0;
    bool _260 = _258 || _248;
    bool _262 = _254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _264 = _262 || _260;
    int _266 = int(_260);
    int _268 = _264 ? 2 : 0;
    int _270 = _266 | _268;
    int _272 = false ? 4 : 0;
    int _274 = _270 | _272;
    int _276 = false ? 8 : 0;
    int _278 = _274 | _276;
    int _280 = false ? 16 : 0;
    int _282 = _278 | _280;
    int _284 = false ? 32 : 0;
    int _286 = _282 | _284;
    int _288 = false ? 64 : 0;
    int _290 = _286 | _288;
    int _292 = _290 & 2;
    int _294 = 0;
    int _296 = _254;
    int _298 = _246;
    float _300 = as_type<float>(_256);
    float _302 = _176;
    float _304 = _174;
    float _306 = _204;
    if (!_264)
    {
        int _308 = _254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _310 = _308 + _246;
        _294 = _310;
    }
    int _312 = _294;
    float _314 = _190;
    if (!_264)
    {
        float _316 = floor(_232);
        _314 = _316;
    }
    float _318 = _314;
    if (!_264)
    {
        int _320 = _312 << 2;
        _296 = _320;
    }
    int _322 = _296;
    int _324 = _322;
    if (!_264)
    {
        uint _327 = uint(int(uint(_312) >> uint(2)));
        _298 = int(_327);
    }
    int _329 = _298;
    if (!_264)
    {
        int _331 = 12 & _322;
        _324 = _331;
    }
    int _333 = _324;
    if (!_264)
    {
        int _335 = _329 << 4;
        int _337 = _335 + _333;
        _300 = as_type<float>(_337);
    }
    float _339 = _300;
    float _341 = as_type<float>(_333);
    if (!_264)
    {
        float _343 = floor(_230);
        _341 = _343;
    }
    float _345 = _341;
    if (!_264)
    {
        float _347 = -_318;
        float _349 = _232 + _347;
        _302 = _349;
    }
    float _351 = _302;
    float _353 = _339;
    if (!_264)
    {
        int _355 = as_type<int>(_339) + 400;
        uint _357 = uint(int(uint(_355) >> uint(2)));
        uint _359 = uint(int(uint(int(_357)) >> uint(2)));
        int _361 = int(_357) & 3;
        float _363 = (*spvDescriptorSet0.vp_c15)._m0[int(_359)][_361];
        _353 = _363;
    }
    float _365 = _353;
    float _367 = fma(_214, 6.2500002968590706586837768554688e-05, 0.5);
    float _369 = fma(_220, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4064 = float2(_367, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    if (!_264)
    {
        float _373 = -_345;
        float _375 = _230 + _373;
        _304 = _375;
    }
    float _377 = _304;
    float _379 = _172;
    if (!_264)
    {
        float _381 = rint(_365);
        float _383 = precise::max(_381, 0.0);
        uint _385 = uint(_383);
        uint _387 = clamp(_385, 0u, 65535u);
        _379 = as_type<float>(_387);
    }
    float _389 = _379;
    float _391 = _351;
    if (!_264)
    {
        float3 _4110 = float3(_377, _351, float(as_type<int>(_389)));
        float3 _4114 = select(_4110, float3(0.0), isnan(_4110));
        float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4114.xy, uint(rint(_4114.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4114.xy, uint(rint(_4114.z)), level(0.0)).x;
        _391 = _393;
    }
    float _395 = _391;
    float _397 = -_204;
    float _399 = _397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _401 = -_214;
    float _403 = _401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _405 = -_220;
    float _407 = _405 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _399 * _399;
    float _415 = fma(_403, _403, _413);
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    float _421 = fma(_407, _407, _415);
    float _423 = rsqrt(_421);
    float _425 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _431 = float(_411);
    float _433 = -_425;
    float _435 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _433);
    float _437 = -_427;
    float _439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _437);
    float _441 = -_429;
    float _443 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _441);
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _447 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _449 = _439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _451 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _453 = -_445;
    float _455 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _453);
    float _457 = -_447;
    float _459 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _457);
    float _461 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _463 = -_451;
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _463);
    float _467 = _403 * _423;
    float _469 = _407 * _423;
    float _471 = 1.0 / _431;
    float _473 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[1].w, _465);
    float _475 = _467 * _467;
    float _477 = float(_419);
    float _479 = _399 * _423;
    float _481 = _473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _483 = fma(_469, _469, _475);
    float _485 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _487 = int(_485);
    float _489 = -_461;
    float _491 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _489);
    float _493 = -_449;
    float _495 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[1].y, _493);
    float _497 = _443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _499 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].w, _495);
    float _501 = -_497;
    float _503 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _501);
    float _505 = rsqrt(_483);
    float _507 = _136 * _471;
    float _509 = -_481;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[0].x, _509);
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].w, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _525 = _523 != 0;
    float _527 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _511);
    float _529 = _455 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _533 = int(_531);
    float _535 = float(uint(_487));
    float _537 = -_529;
    float _539 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _537);
    float _541 = float(_487);
    float _543 = _469 * _505;
    float _545 = _467 * _505;
    float _547 = 1.0 / _477;
    float _549 = -_543;
    float _551 = _469 * _549;
    float _553 = -_543;
    float _555 = _479 * _553;
    float _557 = -_551;
    float _559 = fma(_467, _545, _557);
    float _561 = _479 * _545;
    float _563 = 1.0 / _535;
    float _565 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _539);
    float _567 = _559 * _559;
    float _569 = float(uint(_533));
    float _571 = -_565;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[0].w, _527);
    float _575 = fma(_561, _561, _567);
    float _577 = _439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _579 = trunc(_507);
    int _581 = int(_579);
    float _583 = _136 * _547;
    float _585 = fma(_555, _555, _575);
    float _587 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _589 = -_577;
    float _591 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].y, _589);
    float _593 = _443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _595 = -_587;
    float _597 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _595);
    float _599 = rsqrt(_585);
    int _601 = as_type<int>(_563) + (-2);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[0].w, _591);
    float _605 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[0].w, _597);
    float _607 = -_593;
    float _609 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _607);
    float _611 = 1.0 / _573;
    float _613 = float(uint(_581));
    float _615 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[0].w, _609);
    int _617 = ~_487;
    int _619 = _617 + 1;
    float _621 = as_type<float>(_601) * _613;
    float _623 = 1.0 / _569;
    float _625 = _559 * _599;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    bool _629 = !_517;
    int _631 = _629 ? 0 : 1;
    float _633 = -_627;
    float _635 = _633 + 1.0;
    int _637 = abs(_631);
    float _639 = trunc(_583);
    int _641 = int(_639);
    float _643 = fma(_605, _611, -1.0);
    float _645 = _635 * _611;
    float _647 = as_type<float>(int(gl_VertexIndex));
    float _649 = fma(_635, _643, 1.0);
    float _651 = _603 * _645;
    float _653 = _615 * _645;
    int _655 = as_type<int>(_623) + (-2);
    float _657 = trunc(_621);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    int _663 = ~_533;
    int _665 = _663 + 1;
    float _667 = float(uint(_641));
    float _669 = 1.0 / _132;
    float _671 = as_type<float>(_655) * _667;
    float _673 = _649 * _649;
    float _675 = trunc(_671);
    float _677 = precise::max(_675, 0.0);
    uint _679 = uint(_677);
    float _681 = fma(_651, _651, _673);
    int _683 = _619 * int(_661);
    int _685 = _683 + _581;
    float _687 = fma(_653, _653, _681);
    float _689 = float(uint(_685));
    float _691 = rsqrt(_687);
    float _693 = as_type<float>(_601) * _689;
    int _695 = _665 * int(_679);
    int _697 = _695 + _641;
    float _699 = trunc(_693);
    float _701 = precise::max(_699, 0.0);
    uint _703 = uint(_701);
    float _705 = float(uint(_697));
    float _707 = _653 * _691;
    float _709 = _649 * _691;
    float _711 = _651 * _691;
    float _713 = -_707;
    float _715 = _467 * _713;
    float _717 = _469 * _709;
    float _719 = -_711;
    float _721 = -_715;
    float _723 = fma(_469, _719, _721);
    float _725 = -_707;
    float _727 = -_717;
    float _729 = fma(_479, _725, _727);
    float _731 = as_type<float>(_655) * _705;
    float _733 = -_711;
    float _735 = _479 * _733;
    float _737 = _723 * _723;
    float _739 = trunc(_731);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    float _745 = -_735;
    float _747 = fma(_467, _709, _745);
    float _749 = fma(_729, _729, _737);
    int _751 = int(_661) + int(_703);
    int _753 = ~_533;
    int _755 = _753 + 1;
    float _757 = fma(_747, _747, _749);
    float _759 = _136 * 0.25;
    int _761 = as_type<int>(_647) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_647) & 2;
    bool _767 = _765 != 0;
    float _769 = rsqrt(_757);
    int _771 = ~_487;
    int _773 = _771 + 1;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _777 = _775 != 0;
    bool _779 = !_767;
    float _781 = _779 ? (-0.5) : 0.5;
    int _783 = _773 * _751;
    int _785 = _783 + _581;
    int _787 = int(_679) + int(_743);
    float _789 = ceil(_759);
    bool _791 = !_521;
    int _793 = _791 ? 0 : 1;
    int _795 = _755 * _787;
    int _797 = _795 + _641;
    bool _799 = uint(_785) >= uint(_487);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _729 * _769;
    float _807 = _747 * _769;
    float _809 = _723 * _769;
    bool _811 = uint(_797) >= uint(_533);
    float _813 = _469 * _805;
    float _815 = _479 * _807;
    float _817 = _467 * _809;
    bool _819 = !_763;
    float _821 = _819 ? (-0.5) : 0.5;
    float _823 = -_813;
    float _825 = fma(_467, _807, _823);
    float _827 = -_815;
    float _829 = fma(_469, _809, _827);
    float _831 = -_817;
    float _833 = fma(_479, _805, _831);
    float _835 = _789 * 0.5;
    float _837 = _825 * _825;
    float _839 = in.m_67.x;
    float _841 = in.m_67.y;
    float _843 = in.m_67.z;
    float _845 = in.m_67.w;
    bool _847 = !_777;
    int _849 = _847 ? 0 : 1;
    float _851 = floor(_835);
    float _853 = fma(_829, _829, _837);
    bool _855 = !_799;
    int _857 = _855 ? 0 : (-1);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _861 = as_type<float>(_787);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_803)
    {
        float _865 = in.m_67.x;
        _859 = _865;
    }
    float _867 = _859;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _883 = _881 != 0;
    float _885 = fma(_833, _833, _853);
    bool _887 = !_811;
    int _889 = _887 ? 0 : (-1);
    float _891 = _867;
    float _893 = as_type<float>(_889);
    if (!_803)
    {
        float _895 = in.m_67.y;
        _891 = _895;
    }
    float _897 = _891;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _901 = _899 != 0;
    float _903 = rsqrt(_885);
    bool _905 = !_871;
    int _907 = _905 ? 0 : 1;
    bool _909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.5);
    bool _917 = _913 || _915;
    float _919 = fma(_851, -2.0, _789);
    bool _921 = !_875;
    int _923 = _921 ? 0 : 1;
    float _925 = _136 * _669;
    bool _927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.5);
    bool _935 = _931 || _933;
    float _937 = _851;
    if (_803)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = in.m_69.x;
    float _943 = in.m_69.y;
    float _945 = _939;
    if (!_803)
    {
        _945 = 7.345489978790283203125;
    }
    float _947 = _945;
    float _949 = _833 * _903;
    float _951 = _829 * _903;
    float _953 = _825 * _903;
    bool _955 = !_525;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = _467 * _949;
    float _961 = _947 * _839;
    float _963 = _469 * _953;
    float _965 = _479 * _951;
    float _967 = -_959;
    float _969 = fma(_469, _951, _967);
    float _971 = floor(_961);
    float _973 = -_963;
    float _975 = fma(_479, _949, _973);
    float _977 = -_965;
    float _979 = fma(_467, _953, _977);
    float _981 = _969 * _969;
    bool _983 = _925 < 0.85000002384185791015625;
    float _985 = float(_983);
    bool _987 = _487 == 0;
    float _989 = fma(_975, _975, _981);
    float _991 = precise::max(_919, _985);
    float _993 = _985;
    float _995 = _957;
    if (_803)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = fma(_979, _979, _989);
    float _1001 = _997;
    if (!_803)
    {
        _1001 = 1.2345600128173828125;
    }
    float _1003 = _1001;
    float _1005 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1007 = _781 * _991;
    float _1009 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = _821 * _991;
    float _1013 = rsqrt(_999);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1007);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1023 = _897 * _1003;
    float _1025 = _1015 * _1017;
    float _1027 = -_971;
    float _1029 = _961 + _1027;
    float _1031 = _1019 * _1021;
    int _1033 = ~_751;
    int _1035 = _1033 + _857;
    int _1037 = _1035 + 1;
    float _1039 = _1025 * _949;
    float _1041 = float(_581);
    float _1043 = floor(_1023);
    int _1045 = abs(_849);
    int _1047 = _487 * _1037;
    int _1049 = _1047 + _581;
    bool _1051 = _1041 >= _541;
    bool _1053 = isnan(_1041);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(_541);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _979 * _1013;
    float _1065 = _1025 * _951;
    float _1067 = _975 * _1013;
    float _1069 = _1029 * _541;
    float _1071 = fma(_1031, _1063, _1039);
    float _1073 = trunc(_1061);
    int _1075 = int(_1073);
    float _1077 = fma(_1031, _1067, _1065);
    bool _1079 = !_987;
    int _1081 = _1079 ? _1049 : (-1);
    float _1083 = _220 + _1071;
    float _1085 = _204 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = _214 + _1077;
    float _1089 = _204 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1083 + _1091;
    float _1095 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1087 + _1097;
    float _1101 = trunc(_1069);
    int _1103 = int(_1101);
    float _1105 = _1093 * _1093;
    float _1107 = fma(_214, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1089);
    float _1109 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1095);
    float _1111 = -_1043;
    float _1113 = _1023 + _1111;
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1107);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _969 * _1013;
    float _1123 = sqrt(_1115);
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1127 = ~_1075;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _541 * _925;
    float _1135 = float(_533);
    float _1137 = _1119 + _1125;
    int _1139 = _487 + (-1);
    int _1141 = _1081 * _1131;
    float _1143 = float(_641);
    int _1145 = _1103 * _1045;
    int _1147 = _1145 + _581;
    int _1149 = abs(_793);
    float _1151 = 1.0 / _1125;
    bool _1153 = !_879;
    int _1155 = _1153 ? 0 : 1;
    int _1157 = _1075 * _1139;
    int _1159 = _1157 + _1141;
    bool _1161 = _1143 >= _1135;
    bool _1163 = isnan(_1143);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    int _1171 = _1169 ? 1065353216 : 0;
    bool _1173 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1175 = _1159 * _1149;
    float _1177 = trunc(_1133);
    int _1179 = int(_1177);
    float _1181 = _1025 * _953;
    bool _1183 = !_883;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_1031, _1121, _1181);
    int _1189 = ~_787;
    int _1191 = _1189 + _889;
    int _1193 = _1191 + 1;
    float _1195 = trunc(as_type<float>(_1171));
    int _1197 = int(_1195);
    float _1199 = _1137 * _1151;
    float _1201 = _1199 * 0.5;
    float _1203 = _204 + _1187;
    float _1205 = _1203;
    int _1207 = _1171;
    float _1209 = as_type<float>(_1149);
    if (!_1173)
    {
        _861 = _1087;
    }
    float _1211 = _861;
    int _1213 = _1179 * _637;
    int _1215 = _1213 + _1175;
    float _1217 = as_type<float>(_1179);
    float _1219 = _1211;
    if (!_1173)
    {
        _1217 = _1083;
    }
    float _1221 = _1217;
    bool _1223 = !_1173;
    float _1225 = _1221;
    float _1227 = _371;
    if (!_1223)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1123 + _1231;
        float _1235 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1115);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1249, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = _1237 * _1253;
        float _1259 = fma(_1203, _1245, _1255);
        float _1261 = fma(_1099, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1263 = fma(_1093, _1257, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1259;
        _1219 = _1261;
        _1225 = _1263;
        _1207 = as_type<int>(_1257);
        _893 = _1253;
    }
    float _1265 = _1205;
    float _1267 = _1219;
    float _1269 = _1225;
    int _1271 = _1207;
    float _1273 = _893;
    float _1275 = _1273;
    int _1277 = _1271;
    float _1279 = _1267;
    float _1281 = _1269;
    if (_935)
    {
        _1275 = _1265;
    }
    float _1283 = _1275;
    float _1285 = _1283;
    if (!_935)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _204 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _214 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_204;
        float _1299 = _1297 + _1265;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _220 + _1303;
        float _1307 = -_214;
        float _1309 = _1307 + _1267;
        float _1311 = -_220;
        float _1313 = _1311 + _1269;
        float _1315 = fma(_1293, _1293, _1301);
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1319 = fma(_1305, _1305, _1315);
        float _1321 = sqrt(_1319);
        float _1323 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = precise::min(_1321, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1327 = _1325 * _1317;
        float _1329 = _1323 * _1327;
        float _1331 = fma(_1299, _1329, _204);
        float _1333 = fma(_1309, _1329, _214);
        float _1335 = fma(_1313, _1329, _220);
        _1277 = as_type<int>(_1329);
        _1285 = _1331;
        _1279 = _1333;
        _1281 = _1335;
    }
    int _1337 = _1277;
    float _1339 = _1285;
    float _1341 = _1279;
    float _1343 = _1281;
    int _1345 = abs(as_type<int>(_957));
    bool _1347 = !_901;
    int _1349 = _1347 ? 0 : 1;
    int _1351 = _1337;
    if (_917)
    {
        _995 = 1.0;
    }
    float _1353 = _995;
    float _1355 = _1353;
    if (!_917)
    {
        float _1357 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1359 = _1357 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1367 = _1365 * 0.15915493667125701904296875;
        float _1369 = _1359 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1375 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
        float _1377 = 1.0 / _1363;
        float _1379 = _1367 * 6.283185482025146484375;
        float _1381 = cos(_1379);
        float _1383 = _1371 * _1377;
        float _1385 = 1.0 / _1375;
        float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1387;
        float _1391 = _1381 * _1383;
        float _1393 = _1367 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = 1.0 / _1391;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1401 = _1385 * _1399;
        float _1403 = 1.0 / _1389;
        float _1405 = _1395 * _1397;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = fma(_1405, _1401, _1407);
        float _1411 = _1409 * _1403;
        float _1413 = precise::clamp(_1411, 0.0, 1.0);
        _306 = _1409;
        _1351 = as_type<int>(_1403);
        _1355 = _1413;
    }
    float _1415 = _306;
    int _1417 = _1351;
    float _1419 = _1355;
    int _1421 = abs(_1349);
    float _1423 = _1415;
    int _1425 = _1417;
    if (_917)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_917)
    {
        float _1431 = as_type<float>(in.m_73.w);
        int _1433 = as_type<int>(_1431) << 24;
        int _1435 = as_type<int>(_1431) << 16;
        int _1437 = _1433 >> 24;
        int _1439 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _1441 = as_type<int>(_1431) << 8;
        int _1443 = _1435 >> 24;
        int _1445 = _1441 >> 24;
        int _1447 = as_type<int>(_1431) >> 24;
        float _1449 = float(_1443);
        float _1451 = float(_1445);
        float _1453 = float(_1447);
        float _1455 = _1449 * 0.0078740157186985015869140625;
        float _1457 = float(_1437);
        float _1459 = _1451 * 0.0078740157186985015869140625;
        bool _1461 = _1439 == 4;
        float _1463 = _1453 * 0.0078740157186985015869140625;
        float _1465 = _1457 * 0.0078740157186985015869140625;
        bool _1467 = _1439 == 8;
        bool _1469 = _1439 == 12;
        float _1471 = precise::min(_1455, 1.0);
        float _1473 = precise::min(_1459, 1.0);
        float _1475 = precise::min(_1463, 1.0);
        float _1477 = precise::min(_1465, 1.0);
        float _1479 = precise::max(_1471, -1.0);
        float _1481 = precise::max(_1473, -1.0);
        float _1483 = precise::max(_1475, -1.0);
        float _1485 = precise::max(_1477, -1.0);
        float _1487 = _1485;
        if (_1461)
        {
            _1487 = _1479;
        }
        float _1489 = _1487;
        float _1491 = _1489;
        if (_1467)
        {
            _1491 = _1481;
        }
        float _1493 = _1491;
        float _1495 = _1493;
        if (_1469)
        {
            _1495 = _1483;
        }
        float _1497 = _1495;
        float _1499 = abs(_1497);
        float _1501 = (-0.0) + _1499;
        _1429 = _1501;
    }
    float _1503 = _1429;
    int _1505 = _533 * _1193;
    int _1507 = _1505 + _641;
    bool _1509 = _533 == 0;
    int _1511 = _1147 * _1345;
    int _1513 = _1511 + _1215;
    float _1515 = _1113 * _1135;
    int _1517 = ~_1197;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1135 * _925;
    bool _1525 = !_1509;
    int _1527 = _1525 ? _1507 : (-1);
    int _1529 = _1103 * _1421;
    int _1531 = _1529 + _1513;
    int _1533 = _533 + (-1);
    float _1535 = trunc(_1515);
    int _1537 = int(_1535);
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1541 = _1539 != 0;
    int _1543 = _1527 * _1521;
    float _1545 = float(uint(_1531));
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1197 * _1533;
    int _1553 = _1551 + _1543;
    int _1555 = abs(_923);
    float _1557 = trunc(_1523);
    int _1559 = int(_1557);
    float _1561 = as_type<float>(_601) * _1545;
    int _1563 = abs(_1549);
    int _1565 = abs(_907);
    float _1567 = trunc(_1561);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1553 * _1555;
    int _1575 = abs(_1155);
    int _1577 = _1537 * _1563;
    int _1579 = _1577 + _641;
    int _1581 = ~_487;
    int _1583 = _1581 + 1;
    int _1585 = _1559 * _1565;
    int _1587 = _1585 + _1573;
    int _1589 = abs(_1185);
    int _1591 = _1579 * _1575;
    int _1593 = _1591 + _1587;
    int _1595 = ~_487;
    int _1597 = _1595 + 1;
    int _1599 = _1583 * int(_1571);
    int _1601 = _1599 + _1531;
    int _1603 = ~_533;
    int _1605 = _1603 + 1;
    int _1607 = _1537 * _1589;
    int _1609 = _1607 + _1593;
    if (_803)
    {
        _1425 = 0;
    }
    int _1611 = _1425;
    float _1613 = float(uint(_1601));
    float _1615 = float(uint(_1609));
    int _1617 = _1611;
    if (!_803)
    {
        _1617 = 1;
    }
    int _1619 = _1617;
    float _1621 = as_type<float>(_601) * _1613;
    float _1623 = abs(_371);
    bool _1625 = _1623 != 0.0;
    bool _1627 = isnan(_1623);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.0);
    bool _1633 = _1629 || _1631;
    float _1635 = as_type<float>(_655) * _1615;
    int _1637 = ~_533;
    int _1639 = _1637 + 1;
    float _1641 = trunc(_1621);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = float(uint(_1147));
    float _1655 = as_type<float>(_601) * _1653;
    int _1657 = int(_1571) + int(_1645);
    int _1659 = ~_487;
    int _1661 = _1659 + 1;
    int _1663 = _1597 * _1657;
    int _1665 = _1663 + _1531;
    int _1667 = _1605 * int(_1651);
    int _1669 = _1667 + _1609;
    bool _1671 = uint(_1665) >= uint(_487);
    float _1673 = float(uint(_1669));
    bool _1675 = !_1671;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = as_type<float>(_655) * _1673;
    int _1681 = ~_1657;
    int _1683 = _1681 + _1677;
    int _1685 = _1683 + 1;
    float _1687 = trunc(_1655);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    int _1693 = _487 * _1685;
    int _1695 = _1693 + _1531;
    float _1697 = float(uint(_1579));
    float _1699 = trunc(_1679);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    bool _1705 = !_987;
    int _1707 = _1705 ? _1695 : (-1);
    float _1709 = as_type<float>(_655) * _1697;
    int _1711 = _1707 & 3;
    bool _1713 = _1711 != 0;
    int _1715 = _1661 * int(_1691);
    int _1717 = _1715 + _1147;
    float _1719 = trunc(_1709);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_533;
    int _1727 = _1725 + 1;
    int _1729 = _1713 ? 0 : 1;
    float _1731 = float(uint(_1717));
    int _1733 = int(_1651) + int(_1703);
    int _1735 = _1707 & 3;
    bool _1737 = _1735 != 0;
    float _1739 = as_type<float>(_601) * _1731;
    int _1741 = ~_533;
    int _1743 = _1741 + 1;
    int _1745 = _1727 * _1733;
    int _1747 = _1745 + _1609;
    bool _1749 = uint(_1735) > 1u;
    bool _1751 = uint(_1735) >= 2u;
    float _1753 = trunc(_1739);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (!_1749)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1743 * int(_1723);
    int _1775 = _1773 + _1579;
    bool _1777 = uint(_1747) >= uint(_533);
    int _1779 = _1751 ? 0 : 1;
    bool _1781 = _1735 != 3;
    bool _1783 = !_1777;
    int _1785 = _1783 ? 0 : (-1);
    float _1787 = float(uint(_1775));
    bool _1789 = _845 > 0.5;
    int _1791 = ~_487;
    int _1793 = _1791 + 1;
    float _1795 = as_type<float>(_655) * _1787;
    int _1797 = ~_1733;
    int _1799 = _1797 + _1785;
    int _1801 = _1799 + 1;
    int _1803 = int(_1691) + int(_1757);
    int _1805 = _533 * _1801;
    int _1807 = _1805 + _1609;
    int _1809 = ~_1779;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = trunc(_1795);
    float _1817 = precise::max(_1815, 0.0);
    uint _1819 = uint(_1817);
    int _1821 = _1813;
    if (_1781)
    {
        int _1823 = ~_1779;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1793 * _1803;
    int _1831 = _1829 + _1147;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1835 = _1833 != 0;
    float _1837 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1839 = -_781;
    int _1841 = _1789 ? as_type<int>(_1839) : as_type<int>(_781);
    bool _1843 = !_1509;
    int _1845 = _1843 ? _1807 : (-1);
    float _1847 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1837);
    bool _1849 = uint(_1831) >= uint(_487);
    float _1851 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1853 = !_1835;
    float _1855 = _1853 ? _781 : as_type<float>(_1841);
    float _1857 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    int _1859 = _1845 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    int _1865 = _1845 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1871 = !_1849;
    int _1873 = _1871 ? 0 : (-1);
    float _1875 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1877 = uint(_1859) > 1u;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = _1867 ? 0 : 1;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1885 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1887 = _1885 != 0;
    float _1889 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1891 = int(_1723) + int(_1819);
    float _1893 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1895 = ~_1881;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    float _1901 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    int _1903 = _1845 >> 31;
    float _1905 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    int _1907 = _1639 * _1891;
    int _1909 = _1907 + _1579;
    float _1911 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1901);
    int _1913 = _1899;
    float _1915 = as_type<float>(_1903);
    if (!_1877)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1913 = _1919;
    }
    int _1921 = _1913;
    float _1923 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1905);
    float _1927 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1929 = uint(_1859) >= 2u;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1935 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1875);
    float _1937 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1941 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1949 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    float _1951 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    float _1957 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1949);
    int _1959 = _1707 >> 31;
    float _1961 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1951);
    int _1963 = _1929 ? 0 : 1;
    int _1965 = _1959 & 3;
    int _1967 = _1903 & 3;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1961;
    float _1969 = _1939;
    float _1971 = _1955;
    float _1973 = _1953;
    float _1975 = _1957;
    if (_1633)
    {
        _1915 = _1961;
    }
    float _1977 = _1915;
    float _1979 = _1977;
    if (!_1633)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    if (!_1633)
    {
        out.gl_Position.w = 0.0;
    }
    bool _1983 = _292 != 0;
    bool _1985 = _1859 != 3;
    int _1987 = ~_1963;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1707 + _1965;
    int _1995 = _1845 + _1967;
    int _1997 = _1991;
    if (_1983)
    {
        _1227 = _1981;
    }
    float _1999 = _1227;
    float _2001 = _1999;
    if (_1985)
    {
        int _2003 = ~_1963;
        int _2005 = _2003 + 1;
        _1997 = _2005;
    }
    int _2007 = _1997;
    bool _2009 = uint(_1909) >= uint(_533);
    if (!_1983)
    {
        int _2011 = _312 << 4;
        int _2013 = _2011 + 2048;
        uint _2015 = uint(int(uint(_2013) >> uint(2)));
        uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
        int _2019 = int(_2015) & 3;
        float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
        int _2023 = int(_2015) + 1;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        int _2027 = _2023 & 3;
        float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
        int _2031 = _2013 + 8;
        uint _2033 = uint(int(uint(_2031) >> uint(2)));
        uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
        int _2037 = int(_2033) & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = int(_2033) + 1;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        int _2045 = _2041 & 3;
        float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
        float _2049 = _210 * _2029;
        float _2051 = fma(_214, _2021, _2049);
        float _2053 = fma(_220, _2039, _2051);
        float _2055 = _2053 + _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + _395;
        float _2063 = fma(_2061, 500.0, 1.5);
        float _2065 = exp2(_2063);
        float _2067 = 0.0 + _2065;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        bool _2071 = _2069 >= 1.0;
        bool _2073 = isnan(_2069);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan(1.0);
        bool _2079 = _2075 || _2077;
        float _2081 = _2069;
        if (!_2079)
        {
            out.gl_Position.w = 0.0;
        }
        if (_2079)
        {
            _2081 = _1981;
        }
        float _2083 = _2081;
        _2001 = _2083;
        if (!_2079)
        {
            _2001 = 0.0;
        }
    }
    float _2085 = _2001;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1339 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1341 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1343 + _2095;
    float _2099 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2089 * _2089;
    float _2103 = 1.0 / _2085;
    int _2105 = _1993 >> 2;
    float _2107 = fma(_2093, _2093, _2101);
    int _2109 = _1995 >> 2;
    int _2111 = _2105 << 4;
    int _2113 = _2111 + 368;
    float _2115 = fma(_2097, _2097, _2107);
    int _2117 = _2109 << 4;
    int _2119 = _2117 + 512;
    float _2121 = rsqrt(_2115);
    float _2123 = sqrt(_2115);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2127 = _2093 * _2125;
    float _2129 = _2097 * _2125;
    float _2131 = _2127 * _2127;
    float _2133 = _2129 * _2129;
    float _2135 = _2131 + _2133;
    float _2137 = sqrt(_2135);
    bool _2139 = _2137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2143 = _2137 + _2141;
    float _2145 = _214;
    float _2147 = _2135;
    float _2149 = _2143;
    float _2151 = _2089;
    float _2153 = _2127;
    float _2155 = _2129;
    float _2157 = _2131;
    float _2159 = _2133;
    if (_2139)
    {
        float _2161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2161;
    }
    float _2163 = _2145;
    if (_2139)
    {
        float _2165 = rsqrt(_2135);
        _2147 = _2165;
    }
    float _2167 = _2147;
    if (_2139)
    {
        float _2169 = _2143 * _2163;
        _2149 = _2169;
    }
    float _2171 = _2149;
    if (_2139)
    {
        float _2173 = _2171 * 0.15915493667125701904296875;
        _1969 = _2173;
    }
    float _2175 = _1969;
    float _2177 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2179 = _1981;
    if (_2139)
    {
        float _2181 = _2175 * 6.283185482025146484375;
        float _2183 = sin(_2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = precise::max(0.0, _2177);
    float _2189 = _2171;
    float _2191 = _2187;
    if (_2139)
    {
        float _2193 = _2175 * 6.283185482025146484375;
        float _2195 = cos(_2193);
        _2189 = _2195;
    }
    float _2197 = _2189;
    float _2199 = -_2125;
    float _2201 = -_2187;
    float _2203 = fma(_2089, _2199, _2201);
    if (_2139)
    {
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2151 = _2205;
    }
    float _2207 = _2151;
    float _2209 = _2207;
    if (_2139)
    {
        float _2211 = fma(_2185, _2207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2139)
    {
        float _2217 = _2167 * _2213;
        _1209 = _2217;
    }
    float _2219 = _1209;
    if (!_2139)
    {
        _2215 = _2203;
    }
    float _2221 = _2215;
    float _2223 = _2221;
    if (_2139)
    {
        float _2225 = _2197 + (-1.0);
        _2191 = _2225;
    }
    float _2227 = _2191;
    float _2229 = _2227;
    if (_2139)
    {
        float _2231 = _2127 * _2219;
        _2153 = _2231;
    }
    float _2233 = _2153;
    if (_2139)
    {
        float _2235 = _2129 * _2219;
        _2155 = _2235;
    }
    float _2237 = _2155;
    if (_2139)
    {
        float _2239 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2239;
    }
    float _2241 = _2229;
    if (_2139)
    {
        float _2243 = _2233 * _2233;
        _2157 = _2243;
    }
    float _2245 = _2157;
    if (_2139)
    {
        float _2247 = _2237 * _2237;
        _2159 = _2247;
    }
    float _2249 = _2159;
    if (_2139)
    {
        float _2251 = fma(_2203, _2197, _2241);
        _2223 = _2251;
    }
    float _2253 = _2223;
    bool _2255 = _839 > 0.5;
    float _2257 = fma(_2253, _2253, _2245);
    float _2259 = -_821;
    int _2261 = _2255 ? as_type<int>(_2259) : as_type<int>(_821);
    bool _2263 = _1503 != 0.0;
    bool _2265 = isnan(_1503);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    float _2273 = _2257 + _2249;
    bool _2275 = !_1887;
    float _2277 = _2275 ? _821 : as_type<float>(_2261);
    bool _2279 = _841 > 0.5;
    float _2281 = rsqrt(_2273);
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = _2289 + 1.0;
    if (!_2271)
    {
        _1971 = 0.0;
        _1973 = 0.0;
    }
    float _2293 = _1971;
    float _2295 = _1973;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2103 * _2293;
    float _2303 = _2281 * _2233;
    float _2305 = _2281 * _2253;
    float _2307 = _2281 * _2237;
    float _2309 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2311 = -_2309;
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2311);
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2317 = -_2307;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2313);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2319, -0.5, 0.5);
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2329 = fma(_2325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2331 = -_2099;
    float _2333 = fma(_2331, _2327, 1.0);
    float _2335 = sqrt(_2323);
    float _2337 = _2305 + 1.0;
    float _2339 = fma(_2325, _2329, -0.212114393711090087890625);
    float _2341 = fma(_2301, -0.5, 0.5);
    float _2343 = fma(_2325, _2339, 1.570728778839111328125);
    float _2345 = _2103 * _2295;
    float _2347 = log2(_2333);
    float _2349 = -_2305;
    float _2351 = fma(_2321, _2337, _2349);
    uint _2353 = uint(int(uint(_2113) >> uint(2)));
    uint _2355 = uint(int(uint(int(_2353)) >> uint(2)));
    int _2357 = int(_2353) & 3;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[int(_2355)][_2357];
    int _2361 = int(_2353) + 1;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    int _2365 = _2361 & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    float _2369 = fma(_2345, 0.5, 0.5);
    float _2371 = -_781;
    int _2373 = _2279 ? as_type<int>(_2371) : as_type<int>(_781);
    float _2375 = fma(_2351, 0.5, 0.5);
    int _2377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2379 = _2377 != 0;
    float _2381 = _2335 * 0.636619746685028076171875;
    float _2383 = -_2343;
    float _2385 = fma(_2381, _2383, 1.0);
    float _2387 = _2347 * 0.693147182464599609375;
    float _2389 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7062 = float3(_2369, _2341, _2389);
    float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7062, float3(0.0), isnan(_7062)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7062, float3(0.0), isnan(_7062)), level(0.0)).x;
    float3 _7071 = float3(_2369, _2341, _2389);
    float4 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7071, float3(0.0), isnan(_7071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7071, float3(0.0), isnan(_7071)), level(0.0)).xyzw;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = _2394.w;
    float2 _7087 = float2(_2385, _2375);
    float3 _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7087, float2(0.0), isnan(_7087)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7087, float2(0.0), isnan(_7087)), level(0.0)).xyz;
    float _2408 = _2406.x;
    float _2410 = _2406.y;
    float _2412 = _2406.z;
    uint _2414 = uint(int(uint(_2119) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    bool _2430 = !_2379;
    float _2432 = _2430 ? _781 : as_type<float>(_2373);
    float _2434 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2436 = !_1737;
    int _2438 = _2436 ? 0 : 1;
    float _2440 = _841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2442 = !_1861;
    int _2444 = _2442 ? 0 : 1;
    float _2446 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2448 = _1735 != 3;
    out.m_75.x = _1067;
    out.m_75.y = _1121;
    out.m_75.z = _1063;
    bool _2450 = _1859 != 3;
    float _2452 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2454 = _2113 + 8;
    uint _2456 = uint(int(uint(_2454) >> uint(2)));
    uint _2458 = uint(int(uint(int(_2456)) >> uint(2)));
    int _2460 = int(_2456) & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = int(_2456) + 1;
    uint _2466 = uint(int(uint(_2464) >> uint(2)));
    int _2468 = _2464 & 3;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[int(_2466)][_2468];
    bool _2472 = _1619 != 1;
    out.m_77.x = _1341;
    out.m_77.y = _1339;
    out.m_77.z = _1343;
    float _2474 = exp2(_2452);
    bool _2476 = !_2009;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2119 + 8;
    uint _2482 = uint(int(uint(_2480) >> uint(2)));
    uint _2484 = uint(int(uint(int(_2482)) >> uint(2)));
    int _2486 = int(_2482) & 3;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[int(_2484)][_2486];
    int _2490 = int(_2482) + 1;
    uint _2492 = uint(int(uint(_2490) >> uint(2)));
    int _2494 = _2490 & 3;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[int(_2492)][_2494];
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2500 = _843 > 0.5;
    bool _2502 = !_2448;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = -_2498;
    float _2508 = fma(_2434, 2.0, _2506);
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2512 = !_2450;
    float _2514 = _2512 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2516 = -_821;
    int _2518 = _2500 ? as_type<int>(_2516) : as_type<int>(_821);
    float _2520 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2510);
    int _2522 = abs(_1771);
    float _2524 = -_136;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2508);
    int _2528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2530 = _2528 != 0;
    float _2532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2520);
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2540 = _2538 != 0;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _2544 = _2514;
    if (!_2472)
    {
        _863 = _841;
    }
    float _2546 = _863;
    float _2548 = _2546;
    if (!_2472)
    {
        _2542 = _841;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2472)
    {
        _2548 = _839;
    }
    float _2554 = _2548;
    if (_2472)
    {
        _2552 = _839;
    }
    float _2556 = _2552;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2560 = abs(_2438);
    float _2562 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2564 = int(_2562);
    int _2566 = ~_1803;
    int _2568 = _2566 + _1873;
    int _2570 = _2568 + 1;
    int _2572 = abs(_1921);
    int _2574 = ~_2522;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _487 * _2570;
    int _2582 = _2580 + _1147;
    int _2584 = ~_1891;
    int _2586 = _2584 + _2478;
    int _2588 = _2586 + 1;
    int _2590 = _2578 * as_type<int>(_2367);
    int _2592 = ~_2572;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = abs(_2444);
    int _2600 = _533 * _2588;
    int _2602 = _2600 + _1579;
    int _2604 = ~_2560;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2596 * as_type<int>(_2428);
    int _2612 = abs(_1827);
    int _2614 = ~_2598;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2608 * as_type<int>(_2359);
    int _2622 = _2620 + _2590;
    int _2624 = abs(_2504);
    float _2626 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2628 = int(_2626);
    int _2630 = ~_2612;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2420);
    int _2638 = _2636 + _2610;
    int _2640 = abs(_2007);
    int _2642 = ~_2624;
    int _2644 = _2642 + 1;
    int _2646 = _2644 + 1;
    int _2648 = _2634 * as_type<int>(_2462);
    int _2650 = _2648 + _2622;
    int _2652 = abs(as_type<int>(_2514));
    int _2654 = ~_2640;
    int _2656 = _2654 + 1;
    int _2658 = _2656 + 1;
    int _2660 = _2646 * as_type<int>(_2470);
    int _2662 = _2660 + _2650;
    float _2664 = float(uint(_2564));
    bool _2666 = !_2530;
    int _2668 = _2666 ? 0 : 1;
    int _2670 = _2658 * as_type<int>(_2488);
    int _2672 = _2670 + _2638;
    int _2674 = ~_2652;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    int _2680 = abs(_2668);
    float _2682 = 1.0 / _2664;
    float _2684 = float(uint(_2628));
    int _2686 = _2678 * as_type<int>(_2496);
    int _2688 = _2686 + _2672;
    int _2690 = ~_2680;
    int _2692 = _2690 + 1;
    int _2694 = _2692 + 1;
    bool _2696 = !_2536;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = abs(_2564);
    int _2702 = _2662 * _2694;
    bool _2704 = !_987;
    int _2706 = _2704 ? _2582 : (-1);
    float _2708 = 1.0 / _2684;
    int _2710 = abs(_2698);
    float _2712 = float(uint(_2700));
    int _2714 = _2706 * _2680;
    int _2716 = _2714 + _2702;
    int _2718 = ~_2710;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    int _2724 = abs(_2628);
    float _2726 = 1.0 / _2712;
    bool _2728 = !_1509;
    int _2730 = _2728 ? _2602 : (-1);
    int _2732 = _2688 * _2722;
    int _2734 = as_type<int>(_2682) + (-2);
    float _2736 = float(uint(_2716));
    int _2738 = _2730 * _2710;
    int _2740 = _2738 + _2732;
    float _2742 = float(uint(_2724));
    int _2744 = as_type<int>(_2708) + (-2);
    float _2746 = as_type<float>(_2734) * _2736;
    float _2748 = float(uint(_2740));
    float _2750 = 1.0 / _2742;
    int _2752 = abs(_2716);
    float _2754 = as_type<float>(_2744) * _2748;
    int _2756 = as_type<int>(_2726) + (-2);
    float _2758 = float(uint(_2752));
    float _2760 = trunc(_2746);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    int _2766 = abs(_2740);
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2770 = ~_2564;
    int _2772 = _2770 + 1;
    float _2774 = as_type<float>(_2756) * _2758;
    float _2776 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2768);
    float _2778 = trunc(_2754);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    float _2784 = _2768;
    if (!_2472)
    {
        _2784 = _843;
    }
    float _2786 = _2784;
    float _2788 = _2786;
    if (!_2472)
    {
        _2544 = _843;
    }
    float _2790 = _2544;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2794 = as_type<int>(_2750) + (-2);
    float _2796 = float(uint(_2766));
    int _2798 = _2772 * int(_2764);
    int _2800 = _2798 + _2716;
    int _2802 = ~_2628;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2774);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = _2790;
    if (_2472)
    {
        _2788 = _841;
    }
    float _2814 = _2788;
    float _2816 = as_type<float>(_2794) * _2796;
    if (_2472)
    {
        _2812 = _841;
    }
    float _2818 = _2812;
    float _2820 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2792);
    float _2822 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2824 = float(uint(_2800));
    float _2826 = trunc(_2816);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    int _2832 = _2804 * int(_2782);
    int _2834 = _2832 + _2740;
    float _2836 = as_type<float>(_2734) * _2824;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2840 = float(uint(_2834));
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2844 = ~int(_2810);
    int _2846 = _2844 + 1;
    float _2848 = trunc(_2836);
    float _2850 = precise::max(_2848, 0.0);
    uint _2852 = uint(_2850);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2838);
    float _2856 = as_type<float>(_2744) * _2840;
    float _2858 = -_2842;
    float _2860 = fma(_2558, 2.0, _2858);
    int _2862 = _2846 * _2700;
    int _2864 = _2862 + _2752;
    float _2866 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2868 = ~int(_2830);
    int _2870 = _2868 + 1;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2874 = trunc(_2856);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    float _2880 = float(uint(_2864));
    float _2882 = fma(_2866, _2866, 1.0);
    int _2884 = _2870 * _2724;
    int _2886 = _2884 + _2766;
    int _2888 = ~_2628;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2440, -2.0, _2872);
    float _2894 = as_type<float>(_2756) * _2880;
    float _2896 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2776);
    int _2898 = int(_2764) + int(_2852);
    float _2900 = rsqrt(_2882);
    float _2902 = float(uint(_2886));
    float _2904 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2820);
    int _2906 = ~_2564;
    int _2908 = _2906 + 1;
    float _2910 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2892);
    bool _2912 = !_2540;
    float _2914 = _2912 ? _821 : as_type<float>(_2518);
    float _2916 = as_type<float>(_2794) * _2902;
    int _2918 = int(_2782) + int(_2878);
    float _2920 = trunc(_2894);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2854);
    bool _2928 = _2628 == 0;
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2936 = -_2926;
    float _2938 = _2936 + 1.0;
    float _2940 = trunc(_2916);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = _2866 * _2900;
    float _2948 = _2866 * _951;
    float _2950 = fma(_2822, -2.0, _2934);
    float _2952 = -_136;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2860);
    float _2956 = -_467;
    float _2958 = _2946 * _2956;
    float _2960 = -_469;
    float _2962 = _2946 * _2960;
    float _2964 = -_479;
    float _2966 = _2946 * _2964;
    int _2968 = int(_2810) + int(_2924);
    float _2970 = fma(_2900, _951, _2958);
    float _2972 = fma(_2900, _949, _2962);
    float _2974 = fma(_2900, _953, _2966);
    int _2976 = _2890 * _2918;
    int _2978 = _2976 + _2740;
    float _2980 = _2866 * _953;
    float _2982 = _2866 * _949;
    int _2984 = ~_2968;
    int _2986 = _2984 + 1;
    int _2988 = _2908 * _2898;
    int _2990 = _2988 + _2716;
    int _2992 = int(_2830) + int(_2944);
    out.m_79.x = _2970;
    out.m_79.y = _2974;
    out.m_79.z = _2972;
    bool _2994 = uint(_2978) >= uint(_2628);
    float _2996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2998 = ~_2992;
    int _3000 = _2998 + 1;
    float _3002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2950);
    bool _3004 = uint(_2990) >= uint(_2564);
    float _3006 = fma(_2446, _1121, _2980);
    float _3008 = fma(_2446, _1063, _2982);
    bool _3010 = !_3004;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = _479 + _3006;
    bool _3016 = _2564 == 0;
    float _3018 = _469 + _3008;
    float _3020 = fma(_2446, _1067, _2948);
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3024 = !_2994;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = _2986 * _2700;
    int _3030 = _3028 + _2752;
    int _3032 = ~_2898;
    int _3034 = _3032 + _3012;
    int _3036 = _3034 + 1;
    int _3038 = _3000 * _2724;
    int _3040 = _3038 + _2766;
    int _3042 = ~_2918;
    int _3044 = _3042 + _3026;
    int _3046 = _3044 + 1;
    float _3048 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3050 = uint(_3030) >= uint(_2700);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3054 = _2716 ^ _2564;
    int _3056 = _2628 * _3046;
    int _3058 = _3056 + _2740;
    bool _3060 = uint(_3040) >= uint(_2724);
    int _3062 = _2564 * _3036;
    int _3064 = _3062 + _2716;
    int _3066 = _2740 ^ _2628;
    bool _3068 = !_3050;
    int _3070 = _3068 ? 0 : (-1);
    float _3072 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3074 = !_3060;
    int _3076 = _3074 ? 0 : (-1);
    uint _3078 = uint(int(uint(_3054) >> uint(31)));
    uint _3080 = uint(int(uint(_3066) >> uint(31)));
    int _3082 = ~_3070;
    int _3084 = _2968 + _3082;
    int _3086 = _3084 + 1;
    float _3088 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3090 = _2628 == 0;
    int _3092 = ~_3076;
    int _3094 = _2992 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = ~int(_3078);
    int _3102 = _3100 + 1;
    int _3104 = ~int(_3080);
    int _3106 = _3104 + 1;
    bool _3108 = !_2928;
    int _3110 = _3108 ? _3058 : (-1);
    bool _3112 = !_3016;
    int _3114 = _3112 ? _3064 : (-1);
    int _3116 = _3086 ^ _3102;
    int _3118 = _3096 ^ _3106;
    float _3120 = float(_3110);
    float _3122 = float(_3114);
    bool _3124 = _2564 == 0;
    float _3126 = fma(_3088, _3120, _2954);
    int _3128 = ~_3102;
    int _3130 = _3128 + _3116;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3048, _3122, _2526);
    int _3136 = ~_3106;
    int _3138 = _3136 + _3118;
    int _3140 = _3138 + 1;
    float _3142 = _2277 + 0.5;
    bool _3144 = !_3124;
    int _3146 = _3144 ? _3132 : (-1);
    float _3148 = _2914 + 0.5;
    bool _3150 = !_3090;
    int _3152 = _3150 ? _3140 : (-1);
    float _3154 = fma(_3048, _3142, _3134);
    float _3156 = float(_3146);
    float _3158 = _1957 + _1961;
    float _3160 = float(_3152);
    float _3162 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3164 = _1855 + (-0.5);
    float _3166 = -_2910;
    float _3168 = fma(_3072, _3156, _3166);
    float _3170 = _2432 + (-0.5);
    float _3172 = -_3002;
    float _3174 = fma(_3162, _3160, _3172);
    if (!_2271)
    {
        _1975 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3176 = _1975;
    float _3178 = fma(_3088, _3148, _3126);
    float _3180 = -_3162;
    float _3182 = fma(_3180, _3164, _3174);
    float _3184 = -_2474;
    float _3186 = _3184 + 1.0;
    float _3188 = -_3072;
    float _3190 = fma(_3188, _3170, _3168);
    float _3192 = -_2896;
    float _3194 = _3192 + 1.0;
    int _3196 = as_type<int>(_3176);
    float _3198 = _3186;
    float _3200 = 0.0;
    if (!_2271)
    {
        float _3202 = _3176 * 5.0;
        _3196 = as_type<int>(_3202);
    }
    int _3204 = _3196;
    float _3206 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = fma(_2432, _3194, _3190);
    float _3210 = _467 + _3020;
    float _3212 = _1419 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3214 = as_type<float>(_3204);
    float _3216 = _3208;
    if (!_2271)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8293 = as_type<float>(_3204);
        out.gl_Position.z = _8293;
    }
    float _3218 = _3158 * 0.5;
    bool _3220 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_2123);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3212 * _1503;
    out.m_81.x = _3210;
    out.m_81.y = _3014;
    out.m_81.z = _3018;
    float _3232 = -_2532;
    float _3234 = _3232 + 1.0;
    float _3236 = -_2932;
    float _3238 = fma(_2914, _3236, _3178);
    float _3240 = fma(_1855, _2938, _3182);
    out.m_83.z = _3218;
    out.m_83.w = _1961;
    float _3242 = -_3234;
    float _3244 = fma(_2277, _3242, _3154);
    float _3246 = _3206 * _2391;
    float _3248 = -_3206;
    float _3250 = _3248 + 1.0;
    out.m_85.x = _3244;
    out.m_85.y = _3208;
    out.m_85.z = _3238;
    out.m_85.w = _3240;
    float _3252 = _3246;
    float _3254 = _3244;
    if (!_3228)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3256 = _3198;
    float _3258 = _2402 * _3246;
    float _3260 = _2412 * _3246;
    float _3262 = _2402 * _3250;
    float _3264 = _3258;
    float _3266 = _3256;
    float _3268 = _3256;
    if (!_3228)
    {
        _3214 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3214;
    float _3272 = fma(_2408, _3258, _2396);
    float _3274 = fma(_2410, _3258, _2398);
    float _3276 = fma(_2402, _3260, _2400);
    float _3278 = _3270;
    float _3280 = _3270;
    if (!_3228)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _3200;
    float _3284 = _3282;
    float _3286 = _3282;
    if (!_3228)
    {
        _3252 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3288 = _3252;
    out.m_87.x = _3272;
    out.m_87.y = _3274;
    out.m_87.z = _3276;
    out.m_87.w = _3262;
    float _3290 = _3288;
    float _3292 = _3288;
    if (_2271)
    {
        _3216 = _3230;
    }
    float _3294 = _3216;
    float _3296 = _3294;
    if (!_2271)
    {
        _3296 = 0.0;
    }
    float _3298 = _3296;
    if (!_3228)
    {
        _3254 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3300 = _3254;
    float _3302 = _3300;
    float _3304 = _3300;
    if (!_3228)
    {
        _3264 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3306 = _3264;
    bool _3308 = !_3228;
    float _3310 = _3306;
    float _3312 = _3306;
    if (!_3308)
    {
        bool _3314 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3316 = isnan(_2123);
        bool _3318 = _3314 || _3316;
        bool _3320 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3322 = _3318 || _3320;
        if (!_3322)
        {
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3326 = _2123 + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3330 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3328;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3340 = 1.0 / _3330;
            float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3354 = _3326 * _3340;
            float _3356 = precise::clamp(_3354, 0.0, 1.0);
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3362 = fma(_3356, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3364 = fma(_3356, _3338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3366 = fma(_3356, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3368 = fma(_3356, _3344, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3370 = fma(_3356, _3348, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3372 = fma(_3356, _3352, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3292 = _3362;
            _3268 = _3370;
            _3286 = _3364;
            _3304 = _3368;
            _3312 = _3366;
            _3280 = _3372;
            _3374 = true;
        }
        else
        {
            bool _3376 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3378 = isnan(_2123);
            bool _3380 = _3376 || _3378;
            bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3384 = _3380 || _3382;
            if (!_3384)
            {
                _3302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3302;
            _3304 = _3386;
            if (!_3384)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3266;
            _3268 = _3388;
            if (!_3384)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3278;
            _3280 = _3390;
            if (!_3384)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3284;
            _3286 = _3392;
            if (!_3384)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3290;
            _3292 = _3394;
            if (!_3384)
            {
                _3310 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3310;
            bool _3398 = !_3384;
            _3312 = _3396;
            if (!_3398)
            {
                bool _3400 = _2123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3402 = isnan(_2123);
                bool _3404 = _3400 || _3402;
                bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3408 = _3404 || _3406;
                if (!_3408)
                {
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3412 = _2123 + _3410;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3416 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3414;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3426 = 1.0 / _3416;
                    float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3432 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3440 = _3412 * _3426;
                    float _3442 = precise::clamp(_3440, 0.0, 1.0);
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3448 = fma(_3442, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3450 = fma(_3442, _3424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3452 = fma(_3442, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3454 = fma(_3442, _3430, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3456 = fma(_3442, _3434, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3458 = fma(_3442, _3438, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3292 = _3448;
                    _3268 = _3456;
                    _3286 = _3450;
                    _3304 = _3454;
                    _3312 = _3452;
                    _3280 = _3458;
                    _3374 = true;
                }
                else
                {
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3312 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3374 = false;
    float _3460 = _3292;
    float _3462 = _3268;
    float _3464 = _3286;
    float _3466 = _3304;
    float _3468 = _3312;
    float _3470 = _3280;
    float _3472 = fma(_3014, -0.5, 0.5);
    float _3474 = precise::clamp(_3472, 0.0, 1.0);
    float _3476 = -_3460;
    float _3478 = _3462 + _3476;
    float _3480 = _3298 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3482 = -_3464;
    float _3484 = _3466 + _3482;
    float _3486 = fma(_3474, _3478, _3460);
    out.m_89.w = _3480;
    float _3488 = fma(_3474, _3484, _3464);
    float _3490 = -_3468;
    float _3492 = _3470 + _3490;
    float _3494 = _3486 * 0.586610972881317138671875;
    out.m_54.x = 1.0;
    bool _3496 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3498 = fma(_3474, _3492, _3468);
    float _3500 = fma(_3488, 0.298911988735198974609375, _3494);
    bool _3502 = _1419 > 0.0;
    bool _3504 = isnan(_1419);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(0.0);
    bool _3510 = _3506 || _3508;
    float _3512 = fma(_3498, 0.114477999508380889892578125, _3500);
    out.m_91.x = 0.0;
    float _3514 = -_3512;
    float _3516 = _3488 + _3514;
    float _3518 = -_3512;
    float _3520 = _3486 + _3518;
    float _3522 = -_3512;
    float _3524 = _3498 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3512);
    bool _3532 = !_3496;
    if (!_3532)
    {
        float _3534 = -_1339;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_1341;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_1343;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3014 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3018, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3610;
        out.m_91.y = _3612;
        out.m_91.z = _3614;
    }
    out.m_93.x = _3526;
    out.m_93.y = _3528;
    out.m_93.z = _3530;
    if (_3510)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_54.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

